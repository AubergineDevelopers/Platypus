import 'package:flutter/material.dart';
import 'package:flutter_highlight/theme_map.dart';

import 'package:provider/provider.dart';

import 'package:platypus/providers/home.dart';
import 'package:platypus/utils/utils.dart';

class ThreeCircles extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(
      builder: (_, homeProvider, __) => homeProvider.windowThreeCirclesStyle
                  .toString() ==
              WindowThreeCirclesStyle.Hidden.toString()
          ? Container() // when windowThreeCirclesStyle is hidden
          : Row(
              mainAxisAlignment: windowThreeCirclesPositions[
                  homeProvider.windowThreeCirclesPosition],
              children: <Widget>[
                // red circle
                Container(
                  decoration: BoxDecoration(
                      // when windowThreeCirclesStyle is Filled, color is red
                      color: homeProvider.windowThreeCirclesStyle.toString() ==
                              WindowThreeCirclesStyle.Filled.toString()
                          ? Colors.red
                          : Colors.transparent,
                      /*
                       * if brightness of codeHighlightTheme is dark &
                       * windowThreeCirclesStyle is Empty, then border will be
                       * white. (getCircleColor helps in determining that)
                       */
                      border: homeProvider.windowThreeCirclesStyle.toString() ==
                              WindowThreeCirclesStyle.Empty.toString()
                          ? Border.all(
                              color: getCircleColor(
                                  // themeMap - https://github.com/pd4d10/highlight/blob/master/flutter_highlight/lib/theme_map.dart
                                  themeMap[homeProvider.codeHighlightTheme]
                                          ['root']
                                      .backgroundColor),
                            )
                          : Border.all(color: Colors.transparent),
                      shape: BoxShape.circle),
                  width: 15,
                  height: 15,
                ),
                SizedBox(
                  width: 10,
                ),
                // yellow circle
                Container(
                  decoration: BoxDecoration(
                      // when windowThreeCirclesStyle is Filled, color is yellow
                      color: homeProvider.windowThreeCirclesStyle.toString() ==
                              WindowThreeCirclesStyle.Filled.toString()
                          ? Colors.yellow
                          : Colors.transparent,
                      /*
                       * if brightness of codeHighlightTheme is dark &
                       * windowThreeCirclesStyle is Empty, then border will be
                       * white. (getCircleColor helps in determining that)
                       */
                      border: homeProvider.windowThreeCirclesStyle.toString() ==
                              WindowThreeCirclesStyle.Empty.toString()
                          ? Border.all(
                              // themeMap - https://github.com/pd4d10/highlight/blob/master/flutter_highlight/lib/theme_map.dart
                              color: getCircleColor(
                                  themeMap[homeProvider.codeHighlightTheme]
                                          ['root']
                                      .backgroundColor),
                            )
                          : Border.all(color: Colors.transparent),
                      shape: BoxShape.circle),
                  width: 15,
                  height: 15,
                ),
                SizedBox(
                  width: 10,
                ),
                // green circle
                Container(
                  decoration: BoxDecoration(
                      // when windowThreeCirclesStyle is Filled, color is green
                      color: homeProvider.windowThreeCirclesStyle.toString() ==
                              WindowThreeCirclesStyle.Filled.toString()
                          ? Colors.green
                          : Colors.transparent,
                      /*
                       * if brightness of codeHighlightTheme is dark &
                       * windowThreeCirclesStyle is Empty, then border will be
                       * white. (getCircleColor helps in determining that)
                       */
                      border: homeProvider.windowThreeCirclesStyle.toString() ==
                              WindowThreeCirclesStyle.Empty.toString()
                          ? Border.all(
                              // themeMap - https://github.com/pd4d10/highlight/blob/master/flutter_highlight/lib/theme_map.dart
                              color: getCircleColor(
                                  themeMap[homeProvider.codeHighlightTheme]
                                          ['root']
                                      .backgroundColor),
                            )
                          : Border.all(color: Colors.transparent),
                      shape: BoxShape.circle),
                  width: 15,
                  height: 15,
                ),
              ],
            ),
    );
  }
}
