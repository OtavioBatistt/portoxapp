import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Ox {
  static final size = _OxSizes._();
  static final space = _OxSpace._();
  static final fonts = _OxFonts._();
  static final radii = _OxRadii._();
  static final colors = _OxColors._();
  static final duration = _OxDuration._();
  static final elevation = _OxElevation._();
  static final fontSizes = _OxFontSizes._();
  static final lineHeights = _OxLineHeights._();
  static final letterSpace = _OxLetterSpace._();
  static final fontWeights = _OxFontWeights._();
  static final assets = _OxAssets._();
}

class _OxAssets {
  _OxAssets._();
  final splashRect = 'splash_rect.svg';
  final splashLogo = 'splash_logo.svg';
  final logo = 'logo.svg';
  final iconAnswerNo = 'icon_answer_no.svg';
  final iconAnswerYes = 'icon_answer_yes.svg';
  final iconCalendar = 'icon_calendar.svg';
  final iconCamera = 'icon_camera.svg';
  final iconCameraThicker = 'icon_camera_thicker.svg';
  final iconClipboard = 'icon_clipboard.svg';
  final iconClipboardChecked = 'icon_clipboard_checked.svg';
  final iconClose = 'icon_close.svg';
  final iconError = 'icon_error.svg';
  final iconEyeClose = 'icon_eye_close.svg';
  final iconEyeOpen = 'icon_eye_open.svg';
  final iconForklift = 'icon_forklift.svg';
  final iconInfo = 'icon_info.svg';
  final iconProfile = 'icon_profile.svg';
  final iconPlus = 'icon_plus.svg';
  final iconQuestion = 'icon_question.svg';
  final iconSave = 'icon_save.svg';
  final iconScanner = 'icon_scanner.svg';
  final iconSearch = 'icon_search.svg';
  final iconServer = 'icon_server.svg';
  final iconWarning = 'icon_warning.svg';
  final iconShippedAlt = 'icon_shipped_alt.svg';
  final iconShipped = 'icon_shipped.svg';
  final iconTrash = 'icon_trash.svg';
  final iconTruckEntry = 'icon_truck_entry.svg';
  final iconTruckExit = 'icon_truck_exit.svg';
  final iconTruckRelease = 'icon_truck_release.svg';
  final iconTruck = 'icon_truck.svg';
  final iconWeighing = 'icon_weighing.svg';
}

class _OxColors {
  _OxColors._();
  final blue = const Color(0xFF17305A);
  final blueLight = const Color(0xFF1976D2);
  final green = const Color(0xFF9ACA3C);
  final greenDark = const Color(0xFF7B8F00);
  final wine = const Color(0xFF690039);
  final gray = const Color(0xFF646464);
  final grayLight = const Color(0xFFCAC4D0);
  final black = const Color(0xFF000000);
  final white = const Color(0xFFFFFFFF);
  final error = const Color(0xFFD32F2F);
  final errorLight = const Color(0xFFC62828);
  final success = const Color(0xFF2E7D32);
}

class _OxFonts {
  _OxFonts._();
  final app = 'Roboto';
}

class _OxLetterSpace {
  _OxLetterSpace._();
  final none = 0.1;
  final medium = 0.5;
}

class _OxFontWeights {
  _OxFontWeights._();
  final thin = FontWeight.w100;
  final light = FontWeight.w300;
  final regular = FontWeight.w400;
  final medium = FontWeight.w500;
  final semibold = FontWeight.w600;
  final bold = FontWeight.w700;
}

class _OxFontSizes {
  _OxFontSizes._();
  final ref25 = 10.00.sp;
  final ref30 = 12.00.sp;
  final ref35 = 14.00.sp;
  final ref40 = 16.00.sp;
  final ref45 = 18.00.sp;
  final ref50 = 20.00.sp;
  final ref55 = 22.00.sp;
  final ref60 = 24.00.sp;
  final ref70 = 28.00.sp;
  final ref80 = 32.00.sp;
  final ref100 = 40.00.sp;
  final ref120 = 48.00.sp;
  final ref140 = 56.00.sp;
  final ref160 = 64.00.sp;
  final ref200 = 80.00.sp;
}

class _OxLineHeights {
  _OxLineHeights._();
  final negative = .02;
  final none = 1.00;
  final medium = 1.25;
  final tall = 1.50;
}

class _OxElevation {
  _OxElevation._();
  final none = 0.0;
  final medium = 2.0;
}

class _OxRadii {
  _OxRadii._();
  final ref0 = 0.00;
  final ref10 = 4.00;
  final ref20 = 8.00;
  final ref40 = 16.00;
  final ref60 = 24.00;
  final refRibbon = 9999.00;
}

class _OxDuration {
  _OxDuration._();
  final ref0 = 0;
  final ref1 = 100;
  final ref25 = 250;
  final ref50 = 500;
  final ref100 = 1000;
  final ref150 = 1500;
  final ref200 = 2000;
  final ref250 = 2500;
  final ref500 = 5000;
  final ref1000 = 10000;
}

class _OxSizes {
  _OxSizes._();
  final ref0 = 0.00;
  final ref10 = 4.00;
  final ref20 = 8.00;
  final ref25 = 10.00;
  final ref30 = 12.00;
  final ref35 = 14.00;
  final ref40 = 16.00;
  final ref45 = 18.00;
  final ref50 = 20.00;
  final ref60 = 24.00;
  final ref70 = 28.00;
  final ref80 = 32.00;
  final ref90 = 36.00;
  final ref100 = 40.00;
  final ref110 = 44.00;
  final ref115 = 46.00;
  final ref120 = 48.00;
  final ref130 = 52.00;
  final ref140 = 56.00;
  final ref150 = 60.00;
  final ref160 = 64.00;
  final ref180 = 72.00;
  final ref200 = 80.00;
  final ref220 = 88.00;
  final ref240 = 96.00;
  final ref260 = 104.00;
  final ref280 = 112.00;
  final ref300 = 120.00;
  final ref320 = 128.00;
  final ref340 = 136.00;
  final ref360 = 144.00;
  final ref380 = 152.00;
  final ref400 = 160.00;
  final ref420 = 168.00;
  final ref440 = 176.00;
  final ref460 = 184.00;
  final ref480 = 192.00;
  final ref500 = 200.00;
  final ref800 = 320.00;
  final ref025 = 1.00;
  final ref050 = 2.00;
  final ref075 = 3.00;
}

class _OxSpace {
  _OxSpace._();
  final ref0 = 0.00;
  final ref5 = 2.00;
  final ref10 = 4.00;
  final ref20 = 8.00;
  final ref30 = 12.00;
  final ref40 = 16.00;
  final ref50 = 20.00;
  final ref60 = 24.00;
  final ref70 = 28.00;
  final ref80 = 32.00;
  final ref90 = 36.00;
  final ref100 = 40.00;
  final ref110 = 44.00;
  final ref120 = 48.00;
  final ref130 = 52.00;
  final ref140 = 56.00;
  final ref150 = 60.00;
  final ref160 = 64.00;
  final ref180 = 72.00;
  final ref185 = 74.00;
  final ref200 = 80.00;
  final ref220 = 88.00;
  final ref240 = 96.00;
  final ref260 = 104.00;
  final ref280 = 112.00;
  final ref300 = 120.00;
  final ref320 = 128.00;
  final ref340 = 136.00;
  final ref360 = 144.00;
  final ref380 = 152.00;
  final ref400 = 160.00;
  final ref420 = 168.00;
  final ref440 = 176.00;
  final ref460 = 184.00;
  final ref480 = 192.00;
  final ref500 = 200.00;
}
