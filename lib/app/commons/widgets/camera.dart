import 'dart:async';
import 'dart:io';
import 'dart:math';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_mlkit_barcode_scanning/google_mlkit_barcode_scanning.dart';
import 'package:portox_app/app/commons/adapters/localizations/translate_app.dart';
import 'package:portox_app/app/commons/adapters/permissions/permissions_adapter.dart';
import 'package:portox_app/app/commons/adapters/recognizer/recognizer_adapter.dart';
import 'package:portox_app/app/commons/styles/tokens.dart';

class OxCamera extends StatefulWidget {
  const OxCamera({
    required this.permissions,
    required this.recognizer,
    required this.onScan,
    super.key,
    this.onBackPress,
    this.showQRCodeOverlay = false,
    this.showBarcodeOverlay = false,
    this.disableCodesRecognizer = false,
    this.disableOCRRecognizer = false,
    this.scanInterval = const Duration(seconds: 1),
    this.child,
  });

  final PermissionsAdapter permissions;
  final RecognizerAdapter recognizer;
  final Function(String text, List<String> codes) onScan;
  final Function()? onBackPress;
  final bool? showQRCodeOverlay;
  final bool? showBarcodeOverlay;
  final bool? disableCodesRecognizer;
  final bool? disableOCRRecognizer;
  final Duration scanInterval;
  final Widget? child;

  @override
  State<OxCamera> createState() => _OxCameraState();
}

class _OxCameraState extends State<OxCamera> with WidgetsBindingObserver {
  CameraController? _cameraController;
  bool _isPermissionGranted = false;
  Timer? timer;
  bool _isScanBusy = false;
  late final Future<void> _permission;
  
  // Debounce para evitar múltiplas leituras
  String? _lastScannedCode;
  DateTime? _lastScanTime;
  static const Duration _debounceDuration = Duration(seconds: 2);

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    timer = Timer.periodic(widget.scanInterval, (t) => _scanImage());
    _permission = _requestCameraPermission();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    timer?.cancel();
    _stopCamera();
    super.dispose();
  }

  Future<void> _requestCameraPermission() async {
    final result = await widget.permissions.requestCameraPermission();
    _isPermissionGranted = result;
  }

  void _initCameraController(List<CameraDescription> cameras) {
    if (_cameraController != null) {
      return;
    }
    CameraDescription? camera;
    for (var i = 0; i < cameras.length; i++) {
      final current = cameras[i];
      if (current.lensDirection == CameraLensDirection.back) {
        camera = current;
        break;
      }
    }
    if (camera != null) {
      _cameraSelected(camera);
    }
  }

  void _stopCamera() {
    if (_cameraController != null) {
      _cameraController?.dispose();
    }
  }

  Future<void> _cameraSelected(CameraDescription camera) async {
    _cameraController = CameraController(
      camera,
      ResolutionPreset.medium,
      enableAudio: false,
    );

    await _cameraController!.initialize();
    await _cameraController!.setFlashMode(FlashMode.off);
    await _cameraController!.lockCaptureOrientation();
    await _cameraController!.setFocusMode(FocusMode.auto);
    if (!mounted) {
      return;
    }
    setState(() {});
  }

  Future<void> _scanImage() async {
    if (_isScanBusy ||
        _cameraController == null ||
        !(_cameraController?.value.isInitialized ?? true)) {
      return;
    }
    _isScanBusy = true;
    try {
      final pictureFile = await _cameraController!.takePicture();

      final file = File(pictureFile.path);

      final inputImage = InputImage.fromFile(file);
      await _recognizeImage(inputImage);
    } on Exception catch (_) {}
    _isScanBusy = false;
  }

  Future<void> _recognizeImage(InputImage inputImage) async {
    final recognizeResult = await widget.recognizer.recognize(
      inputImage,
      disableCodes: widget.disableCodesRecognizer ?? false,
      disableOCR: widget.disableOCRRecognizer ?? false,
    );
    
    if (recognizeResult.text.isNotEmpty ||
        recognizeResult.codeList.isNotEmpty) {
      
      // Debounce - verificar se já leu recentemente
      final scannedValue = recognizeResult.codeList.isNotEmpty
          ? recognizeResult.codeList.first
          : recognizeResult.text;
      
      final now = DateTime.now();
      
      // Se for o mesmo código e foi lido há menos de 2 segundos, ignorar
      if (_lastScannedCode == scannedValue &&
          _lastScanTime != null &&
          now.difference(_lastScanTime!) < _debounceDuration) {
        return;
      }
      
      _lastScannedCode = scannedValue;
      _lastScanTime = now;
      
      widget.onScan(recognizeResult.text, recognizeResult.codeList);
    }
  }

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return FutureBuilder(
      future: _permission,
      builder: (context, snapshot) {
        if (_isPermissionGranted) {
          return FutureBuilder<List<CameraDescription>>(
            future: availableCameras(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                _initCameraController(snapshot.data!);

                return Stack(
                  children: [
                    if (_cameraController!.value.isInitialized)
                      SizedBox(
                        height: deviceSize.height,
                        width: deviceSize.width,
                        child: OverflowBox(
                          child: FittedBox(
                            fit: BoxFit.fitHeight,
                            child: SizedBox(
                              width: deviceSize.width,
                              height: deviceSize.height /
                                  _cameraController!.value.aspectRatio,
                              child: CameraPreview(_cameraController!),
                            ),
                          ),
                        ),
                      )
                    else
                      Container(),
                    if (widget.showQRCodeOverlay ?? false)
                      Container(
                        decoration: ShapeDecoration(
                          shape: OxQrCodeOverlay(
                            borderColor: Ox.colors.white,
                            borderRadius: Ox.radii.ref20,
                            borderLength: Ox.size.ref50,
                            borderWidth: Ox.size.ref10,
                            cutOutSize: Ox.size.ref800.w,
                          ),
                        ),
                      )
                    else if (widget.showBarcodeOverlay ?? false)
                      Container(
                        decoration: ShapeDecoration(
                          shape: OxBarcodeOverlay(
                            borderColor: Ox.colors.white,
                            borderRadius: Ox.radii.ref20,
                            borderLength: Ox.size.ref50,
                            borderWidth: Ox.size.ref10,
                            cutOutWidth: Ox.size.ref500.w,
                            cutOutHeight: (Ox.size.ref500 * 2.5).h,
                          ),
                        ),
                      )
                    else
                      Container(),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SizedBox(height: Ox.space.ref130),
                          Visibility(
                            visible: widget.child != null,
                            child: widget.child ?? Container(),
                          ),
                          SizedBox(height: Ox.space.ref50),
                          TextButton(
                            style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(Ox.colors.white),
                              foregroundColor: MaterialStateProperty.all(
                                Ox.colors.blueLight,
                              ),
                            ),
                            onPressed: () {
                              if (widget.onBackPress != null) {
                                widget.onBackPress!();
                              } else {
                                Modular.to.maybePop();
                              }
                            },
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  intl(context, 'app.close').toUpperCase(),
                                  style: TextStyle(
                                    fontSize: Ox.fontSizes.ref35,
                                    fontWeight: Ox.fontWeights.medium,
                                    color: Ox.colors.blue,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: Ox.space.ref220.h),
                        ],
                      ),
                    ),
                  ],
                );
              }
              return const LinearProgressIndicator();
            },
          );
        }
        return Container();
      },
    );
  }
}

class OxQrCodeOverlay extends ShapeBorder {
  OxQrCodeOverlay({
    this.borderColor = Colors.red,
    this.borderWidth = 3.0,
    this.overlayColor = const Color.fromRGBO(0, 0, 0, 80),
    this.borderRadius = 0,
    this.borderLength = 40,
    double? cutOutSize,
    double? cutOutWidth,
    double? cutOutHeight,
    this.cutOutBottomOffset = 0,
  })  : cutOutWidth = cutOutWidth ?? cutOutSize ?? 250,
        cutOutHeight = cutOutHeight ?? cutOutSize ?? 250 {
    assert(
      borderLength <=
          min(this.cutOutWidth, this.cutOutHeight) / 2 + borderWidth * 2,
      "Border can't be larger than ${min(this.cutOutWidth, this.cutOutHeight) / 2 + borderWidth * 2}",
    );
    assert(
      (cutOutWidth == null && cutOutHeight == null) ||
          (cutOutSize == null && cutOutWidth != null && cutOutHeight != null),
      'Use only cutOutWidth and cutOutHeight or only cutOutSize',
    );
  }

  final Color borderColor;
  final double borderWidth;
  final Color overlayColor;
  final double borderRadius;
  final double borderLength;
  final double cutOutWidth;
  final double cutOutHeight;
  final double cutOutBottomOffset;

  @override
  EdgeInsetsGeometry get dimensions => const EdgeInsets.all(10);

  @override
  Path getInnerPath(Rect rect, {TextDirection? textDirection}) => Path()
    ..fillType = PathFillType.evenOdd
    ..addPath(getOuterPath(rect), Offset.zero);

  @override
  Path getOuterPath(Rect rect, {TextDirection? textDirection}) {
    Path getLeftTopPath(Rect rect) => Path()
      ..moveTo(rect.left, rect.bottom)
      ..lineTo(rect.left, rect.top)
      ..lineTo(rect.right, rect.top);

    return getLeftTopPath(rect)
      ..lineTo(
        rect.right,
        rect.bottom,
      )
      ..lineTo(
        rect.left,
        rect.bottom,
      )
      ..lineTo(
        rect.left,
        rect.top,
      );
  }

  @override
  void paint(Canvas canvas, Rect rect, {TextDirection? textDirection}) {
    final width = rect.width;
    final borderWidthSize = width / 2;
    final height = rect.height;
    final borderOffset = borderWidth / 2;
    final localBorderLength =
        borderLength > min(cutOutHeight, cutOutHeight) / 2 + borderWidth * 2
            ? borderWidthSize / 2
            : borderLength;
    final localCutOutWidth =
        cutOutWidth < width ? cutOutWidth : width - borderOffset;
    final localCutOutHeight =
        cutOutHeight < height ? cutOutHeight : height - borderOffset;

    final backgroundPaint = Paint()
      ..color = overlayColor
      ..style = PaintingStyle.fill;

    final borderPaint = Paint()
      ..color = borderColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = borderWidth;

    final boxPaint = Paint()
      ..color = borderColor
      ..style = PaintingStyle.fill
      ..blendMode = BlendMode.dstOut;

    final cutOutRect = Rect.fromLTWH(
      rect.left + width / 2 - localCutOutWidth / 2 + borderOffset,
      -cutOutBottomOffset +
          rect.top +
          height / 2 -
          localCutOutHeight / 2 +
          borderOffset,
      localCutOutWidth - borderOffset * 2,
      localCutOutHeight - borderOffset * 2,
    );

    canvas
      ..saveLayer(
        rect,
        backgroundPaint,
      )
      ..drawRect(
        rect,
        backgroundPaint,
      )
      // Draw top right corner
      ..drawRRect(
        RRect.fromLTRBAndCorners(
          cutOutRect.right - localBorderLength,
          cutOutRect.top,
          cutOutRect.right,
          cutOutRect.top + localBorderLength,
          topRight: Radius.circular(borderRadius),
        ),
        borderPaint,
      )
      // Draw top left corner
      ..drawRRect(
        RRect.fromLTRBAndCorners(
          cutOutRect.left,
          cutOutRect.top,
          cutOutRect.left + localBorderLength,
          cutOutRect.top + localBorderLength,
          topLeft: Radius.circular(borderRadius),
        ),
        borderPaint,
      )
      // Draw bottom right corner
      ..drawRRect(
        RRect.fromLTRBAndCorners(
          cutOutRect.right - localBorderLength,
          cutOutRect.bottom - localBorderLength,
          cutOutRect.right,
          cutOutRect.bottom,
          bottomRight: Radius.circular(borderRadius),
        ),
        borderPaint,
      )
      // Draw bottom left corner
      ..drawRRect(
        RRect.fromLTRBAndCorners(
          cutOutRect.left,
          cutOutRect.bottom - localBorderLength,
          cutOutRect.left + localBorderLength,
          cutOutRect.bottom,
          bottomLeft: Radius.circular(borderRadius),
        ),
        borderPaint,
      )
      ..drawRRect(
        RRect.fromRectAndRadius(
          cutOutRect,
          Radius.circular(borderRadius),
        ),
        boxPaint,
      )
      ..restore();
  }

  @override
  ShapeBorder scale(double t) => OxQrCodeOverlay(
        borderColor: borderColor,
        borderWidth: borderWidth,
        overlayColor: overlayColor,
      );
}

// Overlay para código de barras (formato vertical)
class OxBarcodeOverlay extends ShapeBorder {
  OxBarcodeOverlay({
    this.borderColor = Colors.red,
    this.borderWidth = 3.0,
    this.overlayColor = const Color.fromRGBO(0, 0, 0, 80),
    this.borderRadius = 0,
    this.borderLength = 40,
    required this.cutOutWidth,
    required this.cutOutHeight,
    this.cutOutBottomOffset = 0,
  });

  final Color borderColor;
  final double borderWidth;
  final Color overlayColor;
  final double borderRadius;
  final double borderLength;
  final double cutOutWidth;
  final double cutOutHeight;
  final double cutOutBottomOffset;

  @override
  EdgeInsetsGeometry get dimensions => const EdgeInsets.all(10);

  @override
  Path getInnerPath(Rect rect, {TextDirection? textDirection}) => Path()
    ..fillType = PathFillType.evenOdd
    ..addPath(getOuterPath(rect), Offset.zero);

  @override
  Path getOuterPath(Rect rect, {TextDirection? textDirection}) {
    Path getLeftTopPath(Rect rect) => Path()
      ..moveTo(rect.left, rect.bottom)
      ..lineTo(rect.left, rect.top)
      ..lineTo(rect.right, rect.top);

    return getLeftTopPath(rect)
      ..lineTo(rect.right, rect.bottom)
      ..lineTo(rect.left, rect.bottom)
      ..lineTo(rect.left, rect.top);
  }

  @override
  void paint(Canvas canvas, Rect rect, {TextDirection? textDirection}) {
    final width = rect.width;
    final height = rect.height;
    final borderOffset = borderWidth / 2;
    final localBorderLength = borderLength >
            min(cutOutHeight, cutOutWidth) / 2 + borderWidth * 2
        ? min(cutOutWidth, cutOutHeight) / 2
        : borderLength;
    final localCutOutWidth =
        cutOutWidth < width ? cutOutWidth : width - borderOffset;
    final localCutOutHeight =
        cutOutHeight < height ? cutOutHeight : height - borderOffset;

    final backgroundPaint = Paint()
      ..color = overlayColor
      ..style = PaintingStyle.fill;

    final borderPaint = Paint()
      ..color = borderColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = borderWidth;

    final boxPaint = Paint()
      ..color = borderColor
      ..style = PaintingStyle.fill
      ..blendMode = BlendMode.dstOut;

    final cutOutRect = Rect.fromLTWH(
      rect.left + width / 2 - localCutOutWidth / 2 + borderOffset,
      -cutOutBottomOffset +
          rect.top +
          height / 2 -
          localCutOutHeight / 2 +
          borderOffset,
      localCutOutWidth - borderOffset * 2,
      localCutOutHeight - borderOffset * 2,
    );

    canvas
      ..saveLayer(rect, backgroundPaint)
      ..drawRect(rect, backgroundPaint)
      // Desenhar cantos do overlay vertical
      ..drawRRect(
        RRect.fromLTRBAndCorners(
          cutOutRect.right - localBorderLength,
          cutOutRect.top,
          cutOutRect.right,
          cutOutRect.top + localBorderLength,
          topRight: Radius.circular(borderRadius),
        ),
        borderPaint,
      )
      ..drawRRect(
        RRect.fromLTRBAndCorners(
          cutOutRect.left,
          cutOutRect.top,
          cutOutRect.left + localBorderLength,
          cutOutRect.top + localBorderLength,
          topLeft: Radius.circular(borderRadius),
        ),
        borderPaint,
      )
      ..drawRRect(
        RRect.fromLTRBAndCorners(
          cutOutRect.right - localBorderLength,
          cutOutRect.bottom - localBorderLength,
          cutOutRect.right,
          cutOutRect.bottom,
          bottomRight: Radius.circular(borderRadius),
        ),
        borderPaint,
      )
      ..drawRRect(
        RRect.fromLTRBAndCorners(
          cutOutRect.left,
          cutOutRect.bottom - localBorderLength,
          cutOutRect.left + localBorderLength,
          cutOutRect.bottom,
          bottomLeft: Radius.circular(borderRadius),
        ),
        borderPaint,
      )
      ..drawRRect(
        RRect.fromRectAndRadius(cutOutRect, Radius.circular(borderRadius)),
        boxPaint,
      )
      ..restore();
  }

  @override
  ShapeBorder scale(double t) => OxBarcodeOverlay(
        borderColor: borderColor,
        borderWidth: borderWidth,
        overlayColor: overlayColor,
        cutOutWidth: cutOutWidth,
        cutOutHeight: cutOutHeight,
      );
}
