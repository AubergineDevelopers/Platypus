import 'dart:convert';
import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:flutter_highlight/flutter_highlight.dart';
import 'package:flutter_highlight/theme_map.dart';
import 'package:screenshot/screenshot.dart';
import 'package:share_extend/share_extend.dart';
import 'package:path_provider/path_provider.dart';
import 'package:file_picker/file_picker.dart';

import 'package:platypus/screens/home/widgets/fontsize_slider.dart';
import 'package:platypus/screens/home/widgets/line_height_slider.dart';
import 'package:platypus/screens/home/widgets/vertical_padding_slider.dart';
import 'package:platypus/screens/home/widgets/horizontal_padding_slider.dart';
import 'package:platypus/screens/home/widgets/three_circles.dart';
import 'package:platypus/screens/home/widgets/programming_languages_dropdown.dart';
import 'package:platypus/screens/home/widgets/highlight_themes_dropdown.dart';
import 'package:platypus/screens/home/widgets/three_circles_styles_dropdown.dart';
import 'package:platypus/screens/home/widgets/three_circles_position_dropdown.dart';
import 'package:platypus/screens/home/widgets/toggle_shadow_raised_button.dart';
import 'package:platypus/screens/home/widgets/background_color_picker.dart';
import 'package:platypus/providers/home.dart';
import 'package:platypus/utils/utils.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(
      builder: (_, homeProvider, __) => Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              homeProvider.codeTextEditingController.text = '';
              homeProvider.codeHighlightTheme = themeMap.keys.first;
              homeProvider.codeProgrammingLanguage =
                  programmingLanguages.keys.first;
              homeProvider.codeBackgroundColor = Colors.white;
              homeProvider.isPreview = false;
              homeProvider.windowThreeCirclesStyle =
                  WindowThreeCirclesStyle.Filled.toString();
              homeProvider.windowThreeCirclesPosition = 'Left';
              homeProvider.verticalPaddingBetweenCodeAndBackground = 20;
              homeProvider.horizontalPaddingBetweenCodeAndBackground = 20;
              homeProvider.codeFontSize = 16;
              homeProvider.codeLineHeight = 0;
              homeProvider.showShadow = false;
            },
            icon: Icon(Icons.refresh),
            tooltip: 'Reset',
          ),
          title: Text('Platypus'),
          centerTitle: true,
          actions: <Widget>[
            homeProvider.isPreview
                ? IconButton(
                    icon: Icon(Icons.share),
                    onPressed: () async {
                      homeProvider.screenshotMode = true;
                      final screenshot = await homeProvider
                          .codeScreenshotController
                          .capture(pixelRatio: window.devicePixelRatio);
                      final downloadPath =
                          await getApplicationDocumentsDirectory();
                      final fileName = DateTime.now().toString();
                      final fileToSave = await screenshot.readAsBytes();
                      final savedScreenshot =
                          await File('${downloadPath.path}/$fileName.png')
                              .writeAsBytes(fileToSave);
                      await showDialog(
                        context: context,
                        builder: (builder) => AlertDialog(
                          title: Text('Code Screenshot'),
                          content: Container(
                            child: Image.file(screenshot),
                          ),
                          actions: <Widget>[
                            FlatButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text('Cancel'),
                            ),
                            FlatButton(
                              onPressed: () async {
                                final generatedConfigFile =
                                    await exportCurrentPlatypusConfig(
                                        homeProvider);
                                await ShareExtend.share(
                                    generatedConfigFile.path, 'file');
                              },
                              child: Text('Export Config'),
                            ),
                            FlatButton(
                              onPressed: () async {
                                await ShareExtend.share(
                                    savedScreenshot.path, 'file');
                              },
                              child: Text('Share'),
                            ),
                          ],
                        ),
                      );
                      homeProvider.screenshotMode = false;
                    },
                  )
                : Container(),
            homeProvider.isPreview
                ? IconButton(
                    tooltip: 'Switch to Editor',
                    onPressed: () {
                      homeProvider.isPreview = !homeProvider.isPreview;
                    },
                    icon: Icon(Icons.edit),
                  )
                : IconButton(
                    tooltip: 'Switch to Preview',
                    onPressed: () {
                      homeProvider.isPreview = !homeProvider.isPreview;
                    },
                    icon: Icon(Icons.remove_red_eye),
                  ),
            IconButton(
              onPressed: () async {
                final importConfigFile = await FilePicker.getFile();
                if (importConfigFile != null) {
                  final config = await importConfigFile.readAsString();
                  final importedConfig = jsonDecode(config);
                  homeProvider.horizontalPaddingBetweenCodeAndBackground =
                      importedConfig['horizontal_padding'];
                  homeProvider.verticalPaddingBetweenCodeAndBackground =
                      importedConfig['vertical_padding'];
                  homeProvider.codeFontSize = importedConfig['font_size'];
                  homeProvider.codeLineHeight = importedConfig['line_height'];
                  homeProvider.windowThreeCirclesStyle =
                      importedConfig['window_circles_style'];
                  homeProvider.windowThreeCirclesPosition =
                      importedConfig['window_circles_position'];
                  homeProvider.showShadow = importedConfig['show_shadow'];
                  homeProvider.codeHighlightTheme =
                      importedConfig['highlight_theme'];
                  homeProvider.codeProgrammingLanguage =
                      importedConfig['programming_language'];
                  homeProvider.codeTextEditingController.text =
                      importedConfig['source_code'];
                  homeProvider.isPreview = true;
                  homeProvider.codeBackgroundColor =
                      Color(importedConfig['background_color']);
                }
              },
              icon: Icon(Icons.attach_file),
            ),
          ],
        ),
        body: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  margin: EdgeInsets.all(12),
                  child: Screenshot(
                    controller: homeProvider.codeScreenshotController,
                    child: Container(
                      color: homeProvider.codeBackgroundColor,
                      padding: EdgeInsets.symmetric(
                        vertical: homeProvider
                            .verticalPaddingBetweenCodeAndBackground,
                        horizontal: homeProvider
                            .horizontalPaddingBetweenCodeAndBackground,
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          boxShadow: [
                            homeProvider.showShadow
                                ? BoxShadow(
                                    color: Colors.black,
                                    spreadRadius: 2,
                                    blurRadius: 20,
                                  )
                                : BoxShadow(),
                          ],
                          color: themeMap[homeProvider.codeHighlightTheme]
                                  ['root']
                              .backgroundColor,
                        ),
                        padding: EdgeInsets.all(16),
                        child: SingleChildScrollView(
                          child: Column(
                            children: <Widget>[
                              ThreeCircles(),
                              homeProvider.isPreview
                                  ? Align(
                                      alignment: Alignment.centerLeft,
                                      child: HighlightView(
                                        homeProvider
                                            .codeTextEditingController.text,
                                        language: homeProvider
                                            .codeProgrammingLanguage,
                                        theme: themeMap[
                                            homeProvider.codeHighlightTheme],
                                        padding: EdgeInsets.only(
                                            top: 12, bottom: 12),
                                        textStyle: TextStyle(
                                          height:
                                              homeProvider.codeLineHeight > 0
                                                  ? homeProvider.codeLineHeight
                                                  : null,
                                          fontSize: homeProvider.codeFontSize,
                                        ),
                                      ),
                                    )
                                  : TextFormField(
                                      keyboardAppearance: Brightness.dark,
                                      style: TextStyle(
                                        height: homeProvider.codeLineHeight > 0
                                            ? homeProvider.codeLineHeight
                                            : null,
                                        fontSize: homeProvider.codeFontSize,
                                        color: Colors.white,
                                        fontFamily: 'monospace',
                                      ),
                                      controller: homeProvider
                                          .codeTextEditingController,
                                      maxLines: 15,
                                    ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            homeProvider.screenshotMode
                ? Container()
                : Expanded(
                    child: ListView(
                      children: <Widget>[
                        ThreeCirclesStylesDropdown(),
                        ThreeCirclesPositionDropdown(),
                        HighlightThemesDropdown(),
                        ProgrammingLanguagesDropdown(),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            ToggleShadowRaisedButton(),
                            BackgroundColorPicker(),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        VerticalPaddingSlider(),
                        HorizontalPaddingSlider(),
                        FontSizeSlider(),
                        LineHeightSlider(),
                        SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
