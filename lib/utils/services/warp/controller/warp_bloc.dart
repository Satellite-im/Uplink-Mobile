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
  WarpBloc() : super(WarpStateInitial()) {
    on<EnableWarp>((event, emit) async {
      try {
        emit(WarpStateLoading());
        await _definePathToTesseractAndMultipass();
        await _checkIfTesseractExists(event.passphrase);

        multipass ??= multipassTest == MultipassTest.temporary
            ? warp_mp_ipfs.multipass_ipfs_temporary(tesseract)
            : warp_mp_ipfs.multipass_ipfs_persistent(
                tesseract,
                _multipassPath!,
              );
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
    _multipassPath = _directory.path;
    _tesseractPath = '${_directory.path}/tesseract';
  }

  // Enable Tesseract to use
  // Unlock Tesseract using pin as passphrase
  // Save a file for Tesseract
  // Set auto save
  Future<void> _enableTesseract(String passphrase) async {
    tesseract
      ..unlock(passphrase)
      ..setFile(_tesseractPath!)
      ..setAutosave();
  }

  Future<bool> _checkIfTesseractExists(String passphrase) async {
    try {
      tesseract = multipassTest == MultipassTest.temporary
          ? warp.Tesseract.fromFile(_tesseractPath!)
          : warp.Tesseract.newStore();
      await _enableTesseract(passphrase);
      return true;
    } catch (error) {
      tesseract = warp.Tesseract.newStore();
      await _enableTesseract(passphrase);
      return false;
    }
  }

  late warp.Tesseract tesseract;

  warp_multipass.MultiPass? multipass;

  late warp.DID? currentUserDID;

  String? _tesseractPath;

  String? _multipassPath;

  final multipassTest = MultipassTest.temporary;
}
