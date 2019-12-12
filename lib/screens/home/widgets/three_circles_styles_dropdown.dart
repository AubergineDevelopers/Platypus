import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:enum_to_string/enum_to_string.dart';

import 'package:platypus/providers/home.dart';
import 'package:platypus/utils/utils.dart';

class ThreeCirclesStylesDropdown extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(
      builder: (_, homeProvider, __) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
        child: DropdownButtonFormField(
          value: homeProvider.windowThreeCirclesStyle.toString(),
          onChanged: (newWindowThreeCirclesStyle) {
            homeProvider.windowThreeCirclesStyle = newWindowThreeCirclesStyle;
          },
          decoration: InputDecoration(labelText: 'Window Circles Style'),
          items: <DropdownMenuItem>[
            ...WindowThreeCirclesStyle.values.map(
              (windowThreeCirclesStyle) => DropdownMenuItem(
                child: Text(
                  EnumToString.parse(windowThreeCirclesStyle),
                ),
                value: windowThreeCirclesStyle.toString(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
