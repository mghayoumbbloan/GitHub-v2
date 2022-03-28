import 'package:flutter/material.dart';

class Loaders {
  static Widget Loader({height, width}) => Container(
        child: SizedBox(
          height: width ?? 25.0,
          width: height ?? 25.0,
          child: CircularProgressIndicator(),
        ),
      );
}
