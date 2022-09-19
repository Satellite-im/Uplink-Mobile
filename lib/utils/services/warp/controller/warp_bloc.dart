import 'dart:developer';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:warp_dart/mp_ipfs.dart' as warp_mp_ipfs;
import 'package:warp_dart/multipass.dart' as warp_multipass;
import 'package:warp_dart/raygun.dart' as warp_raygun;
import 'package:warp_dart/rg_ipfs.dart' as rg_ipfs;
import 'package:warp_dart/warp.dart' as warp;

part 'warp_event.dart';
part 'warp_state.dart';

enum MultipassTest { temporary, persistent }

class WarpBloc extends Bloc<WarpEvent, WarpState> {
  WarpBloc() : super(WarpInitial()) {
    on<WarpStarted>(
      (event, emit) async {
        if (_tesseract == null) {
          log('WarpStarted -> tesseract is null');
        }
        if (multipass == null) {
          log('WarpStarted -> multipass is null');
        }
        try {
          if (_tesseract == null || multipass == null) {
            emit(WarpLoadInProgress());
            await _getPathOfTesseractAndMultipass();
            await _getTesseract(event.pin);

            multipass = warp_mp_ipfs.multipass_ipfs_persistent(
              _tesseract!,
              _multipassPath!,
            );

            emit(WarpLoadSuccess());
          }
        } catch (error) {
          emit(WarpLoadFailure());
          addError(error);
        }
      },
    );
    on<WarpLogout>((event, emit) {
      emit(WarpLoadInProgress());
      try {
        multipass!.drop();
        _tesseract!
          ..lock()
          ..drop();
        // delete local multipass and tesseract files
        Directory('$_multipassPath').deleteSync(recursive: true);
        Directory('$_tesseractPath').deleteSync(recursive: true);
        Directory('$_raygunPath').deleteSync(recursive: true);
        multipass = null;
        _tesseract = null;
        log('WarpLogout -> delete tesseract and multipass succeessfully');
      } catch (error) {
        log('WarpLogout -> error');
        addError(error);
        emit(WarpLoadFailure());
        throw Exception(error);
      }
    });

    on<RaygunStarted>((event, emit) {
      try {
        emit(WarpLoadInProgress());

        raygun = rg_ipfs.raygun_ipfs_persistent(
          multipass!,
          _raygunPath!,
        );

        emit(WarpLoadSuccess());
      } catch (error) {
        emit(WarpLoadFailure());
        addError(error);
      }
    });
  }

  /// Get the file path to save tesseract and multipass
  Future<void> _getPathOfTesseractAndMultipass() async {
    final _directory = await path_provider.getApplicationSupportDirectory();
    _multipassPath = '${_directory.path}/multipass/';
    _raygunPath = '${_directory.path}/raygun/';
    _tesseractPath = '${_directory.path}/tesseract';
  }

  // Enable Tesseract to use
  // Unlock Tesseract using pin as passphrase
  // Save a file for Tesseract
  // Set auto save
  Future<void> _enableTesseract(String pin) async {
    log('Tesseract -> tessact path : $_tesseractPath');
    _tesseract!
      ..unlock(pin)
      ..setFile(_tesseractPath!)
      ..setAutosave();
  }

  /// Get Tesseract from the devive. If not, create a new one
  Future<void> _getTesseract(String pin) async {
    final fileList = File(_tesseractPath!).toString();
    log(fileList);
    try {
      log('Tesseract -> get tesseract from file');
      _tesseract = warp.Tesseract.fromFile(_tesseractPath!);
    } catch (error) {
      _tesseract = warp.Tesseract.newStore();
      log('Tesseract -> create a new Tesseract');
    }
    await _enableTesseract(pin);
  }

  String get12RecoverySeeds() {
    recoverySeeds = warp.mnemonic_standard_phrase();
    log('get12RecoverySeeds: $recoverySeeds');
    return recoverySeeds!;
  }

  void deleteRecoverySeeds() {
    recoverySeeds = null;
    log('deleted recovery seeds');
  }

  warp.Tesseract? _tesseract;

  warp_multipass.MultiPass? multipass;

  warp_raygun.Raygun? raygun;

  late warp.DID? currentUserDID;

  String? _tesseractPath;

  String? _multipassPath;

  String? _raygunPath;

  String? recoverySeeds;
}
