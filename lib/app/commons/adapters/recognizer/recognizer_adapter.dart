import 'package:google_mlkit_barcode_scanning/google_mlkit_barcode_scanning.dart';
import 'package:portox_app/app/commons/adapters/recognizer/mlkit/mlkit_recognizer.dart';

abstract class RecognizerAdapter {
  Future<RecognizerResult> recognize(
    InputImage inputImage, {
    bool disableOCR,
    bool disableCodes,
  });
}
