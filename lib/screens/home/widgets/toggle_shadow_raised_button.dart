import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:platypus/providers/home.dart';

class ToggleShadowRaisedButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(
      builder: (_, homeProvider, __) => RaisedButton(
        onPressed: () {
          homeProvider.showShadow = !homeProvider.showShadow;
        },
        child: Text('Toggle Shadow'),
      ),
    );
  }
}
