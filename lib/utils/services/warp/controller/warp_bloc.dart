import 'package:bloc/bloc.dart';
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
  WarpBloc() : super(WarpStateInitial()) {
    on<EnableWarp>((event, emit) async {
      try {
        if (_tesseract == null || multipass == null) {
          emit(WarpStateLoading());
          await _definePathToTesseractAndMultipass();
          await _checkIfTesseractExists(event.passphrase);

          multipass = warp_mp_ipfs.multipass_ipfs_persistent(
            _tesseract!,
            _directoryPath!,
          );

          raygun = rg_ipfs.raygun_ipfs_persistent(
            multipass!,
            _directoryPath!,
          );

          emit(WarpStateSuccess());
        }
      } catch (error) {
        emit(WarpStateError());
        addError(error);
      }
    });

    on<DropMultipass>((event, emit) async {
      try {
        emit(WarpStateLoading());
        multipass!.drop();
        emit(WarpStateSuccess());
      } catch (error) {
        emit(WarpStateError());
        addError(error);
      }
    });
  }

  // Define Tesseract path and file name to save
  // Define Multipass path to save
  Future<void> _definePathToTesseractAndMultipass() async {
    final _directory = await path_provider.getApplicationSupportDirectory();
    _directoryPath = _directory.path;
    _tesseractPath = '${_directory.path}/tesseract';
  }

  // Enable Tesseract to use
  // Unlock Tesseract using pin as passphrase
  // Save a file for Tesseract
  // Set auto save
  Future<void> _enableTesseract(String passphrase) async {
    _tesseract!
      ..unlock(passphrase)
      ..setFile(_tesseractPath!)
      ..setAutosave();
  }

  // It check is there is a tesseract instance in the device
  // If not, it will create a new one
  Future<bool> _checkIfTesseractExists(String passphrase) async {
    try {
      _tesseract = warp.Tesseract.fromFile(_tesseractPath!);
      await _enableTesseract(passphrase);
      return true;
    } catch (error) {
      _tesseract = warp.Tesseract.newStore();
      await _enableTesseract(passphrase);
      return false;
    }
  }

  warp.Tesseract? _tesseract;

  warp_multipass.MultiPass? multipass;

  warp_raygun.Raygun? raygun;

  late warp.DID? currentUserDID;

  String? _tesseractPath;

  String? _directoryPath;
}
