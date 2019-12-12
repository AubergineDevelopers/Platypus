import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

import 'package:flutter_highlight/theme_map.dart';
import 'package:screenshot/screenshot.dart';

import 'package:platypus/utils/utils.dart';

///
/// Manages state for HomeScreen
///
class HomeProvider with ChangeNotifier {
  // it is set to true when share is clicked to generate best code screenshot
  bool _screenshotMode = false;

  bool get screenshotMode => this._screenshotMode;

  set screenshotMode(bool _screenshotMode) {
    this._screenshotMode = _screenshotMode;
    notifyListeners();
  }

  // keeps track of source code typed by user
  TextEditingController _codeTextEditingController = TextEditingController();

  TextEditingController get codeTextEditingController =>
      this._codeTextEditingController;

  // helps with screenshot creation
  ScreenshotController _codeScreenshotController = ScreenshotController();

  ScreenshotController get codeScreenshotController =>
      this._codeScreenshotController;

  // syntax highlighting theme of code text-form-field
  String _codeHighlightTheme = themeMap.keys.first;

  String get codeHighlightTheme => this._codeHighlightTheme;

  set codeHighlightTheme(String _codeHighlightTheme) {
    this._codeHighlightTheme = _codeHighlightTheme;
    notifyListeners();
  }

  // programming language of code text-form-field for accurate syntax highlighting
  String _codeProgrammingLanguage = programmingLanguages.keys.first;

  String get codeProgrammingLanguage => this._codeProgrammingLanguage;

  set codeProgrammingLanguage(String _codeProgrammingLanguage) {
    this._codeProgrammingLanguage = _codeProgrammingLanguage;
    notifyListeners();
  }

  // background-color of the container behind the code text-form-field
  Color _codeBackgroundColor = Colors.white;

  Color get codeBackgroundColor => this._codeBackgroundColor;

  set codeBackgroundColor(Color _codeBackgroundColor) {
    this._codeBackgroundColor = _codeBackgroundColor;
    notifyListeners();
  }

  /*
   * code text-form-field can't be edited if it is true
   * code screenshot can't be shared if it is true
  */
  bool _isPreview = false;

  bool get isPreview => this._isPreview;

  set isPreview(bool _isPreview) {
    this._isPreview = _isPreview;
    notifyListeners();
  }

  // style for 3 circles buttons (red, yellow, green)
  String _windowThreeCirclesStyle = WindowThreeCirclesStyle.Filled.toString();

  String get windowThreeCirclesStyle => this._windowThreeCirclesStyle;

  set windowThreeCirclesStyle(String _windowThreeCirclesStyle) {
    this._windowThreeCirclesStyle = _windowThreeCirclesStyle;
    notifyListeners();
  }

  /*
   * holds the value of position of (red, yellow, green) circle buttons
   *    Left for MainAxisAlignment.start
   *    Right for MainAxisAlignment.end
   *    Center for MainAxisAlignment.center
   */
  String _windowThreeCirclesPosition = 'Left';

  String get windowThreeCirclesPosition => this._windowThreeCirclesPosition;

  set windowThreeCirclesPosition(String _windowThreeCirclesPosition) {
    this._windowThreeCirclesPosition = _windowThreeCirclesPosition;
    notifyListeners();
  }

  // vertical padding between code text-form-field and container behind it
  double _verticalPaddingBetweenCodeAndBackground = 20;

  double get verticalPaddingBetweenCodeAndBackground =>
      this._verticalPaddingBetweenCodeAndBackground;

  set verticalPaddingBetweenCodeAndBackground(
      double _verticalPaddingBetweenCodeAndBackground) {
    this._verticalPaddingBetweenCodeAndBackground =
        _verticalPaddingBetweenCodeAndBackground;
    notifyListeners();
  }

  // horizontal padding between code text-form-field and container behind it
  double _horizontalPaddingBetweenCodeAndBackground = 20;

  double get horizontalPaddingBetweenCodeAndBackground =>
      this._horizontalPaddingBetweenCodeAndBackground;

  set horizontalPaddingBetweenCodeAndBackground(
      double _horizontalPaddingBetweenCodeAndBackground) {
    this._horizontalPaddingBetweenCodeAndBackground =
        _horizontalPaddingBetweenCodeAndBackground;
    notifyListeners();
  }

  // font-size of the code text-form-field
  double _codeFontSize = 16;

  double get codeFontSize => this._codeFontSize;

  set codeFontSize(double _codeFontSize) {
    this._codeFontSize = _codeFontSize;
    notifyListeners();
  }

  // line-height of the code text-form-field
  double _codeLineHeight = 0;

  double get codeLineHeight => this._codeLineHeight;

  set codeLineHeight(double _codeLineHeight) {
    this._codeLineHeight = _codeLineHeight;
    notifyListeners();
  }

  // shadow of the container behind the code text-form-field
  bool _showShadow = false;

  bool get showShadow => this._showShadow;

  set showShadow(bool _showShadow) {
    this._showShadow = _showShadow;
    notifyListeners();
  }
}
