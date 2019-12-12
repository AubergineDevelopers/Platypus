import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:platypus/providers/home.dart';

class LineHeightSlider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(
      builder: (_, homeProvider, __) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Column(
          children: <Widget>[
            Text('Line Height'),
            Slider(
              onChanged: (newCodeLineHeight) {
                homeProvider.codeLineHeight = newCodeLineHeight;
              },
              value: homeProvider.codeLineHeight,
              min: 0,
              max: 2,
            )
          ],
        ),
      ),
    );
  }
}
