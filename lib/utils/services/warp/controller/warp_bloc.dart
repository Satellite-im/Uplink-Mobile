import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:warp_dart/mp_ipfs.dart' as warp_mp_ipfs;
import 'package:warp_dart/multipass.dart' as warp_multipass;
import 'package:warp_dart/warp.dart' as warp;

part 'warp_event.dart';
part 'warp_state.dart';

enum MultipassTest { temporary, persistent }

class WarpBloc extends Bloc<WarpEvent, WarpState> {
  WarpBloc() : super(WarpInitial()) {
    on<WarpStarted>((event, emit) async {
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
    });

    on<WarpDropMultipass>((event, emit) async {
      try {
        emit(WarpLoadInProgress());
        multipass!.drop();
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
    _multipassPath = _directory.path;
    _tesseractPath = '${_directory.path}/tesseract';
  }

  // Enable Tesseract to use
  // Unlock Tesseract using pin as passphrase
  // Save a file for Tesseract
  // Set auto save
  Future<void> _enableTesseract(String pin) async {
    _tesseract!
      ..unlock(pin)
      ..setFile(_tesseractPath!)
      ..setAutosave();
  }

  /// Get Tesseract from the devive. If not, create a new one
  Future<void> _getTesseract(String pin) async {
    try {
      _tesseract = warp.Tesseract.fromFile(_tesseractPath!);
    } catch (error) {
      _tesseract = warp.Tesseract.newStore();
    }
    await _enableTesseract(pin);
  }

  warp.Tesseract? _tesseract;

  warp_multipass.MultiPass? multipass;

  late warp.DID? currentUserDID;

  String? _tesseractPath;

  String? _multipassPath;
}
