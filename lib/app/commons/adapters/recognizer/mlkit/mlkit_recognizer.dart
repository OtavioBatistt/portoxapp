import 'package:google_mlkit_barcode_scanning/google_mlkit_barcode_scanning.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';
import 'package:portox_app/app/commons/adapters/recognizer/recognizer_adapter.dart';

class Recognizer implements RecognizerAdapter {
  Recognizer(
    this.textRecognizer,
    this.barcodeScanner,
  );

  final TextRecognizer textRecognizer;
  final BarcodeScanner barcodeScanner;

  @override
  Future<RecognizerResult> recognize(
    InputImage inputImage, {
    bool disableCodes = false,
    bool disableOCR = false,
  }) async {
    String recognizedText = '';
    List<String> codeList = [];

    if (!disableOCR) {
      recognizedText = (await textRecognizer.processImage(inputImage)).text;
    }

    if (!disableCodes) {
      codeList = (await barcodeScanner.processImage(inputImage))
          .map((e) => '${e.rawValue}')
          .toList();
    }

    return RecognizerResult(
      codeList: codeList,
      text: recognizedText,
    );
  }

  void close() {
    textRecognizer.close();
    barcodeScanner.close();
  }
}

class RecognizerResult {
  RecognizerResult({
    required this.text,
    required this.codeList,
  });
  final String text;
  final List<String> codeList;
}
