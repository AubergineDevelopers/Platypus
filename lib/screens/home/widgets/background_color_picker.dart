import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

import 'package:platypus/providers/home.dart';

class BackgroundColorPicker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(
      builder: (_, homeProvider, __) => GestureDetector(
        onTap: () async {
          await showDialog(
            context: context,
            builder: (builder) => SimpleDialog(
              children: <Widget>[
                SingleChildScrollView(
                  child: ColorPicker(
                    onColorChanged: (newCodeBackgroundColor) {
                      homeProvider.codeBackgroundColor = newCodeBackgroundColor;
                    },
                    pickerColor: homeProvider.codeBackgroundColor,
                  ),
                ),
              ],
            ),
          );
        },
        child: Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            color: homeProvider.codeBackgroundColor,
            shape: BoxShape.circle,
          ),
        ),
      ),
    );
  }
}
