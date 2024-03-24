import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

Widget customElevatedButton(
    {required buttonName, required VoidCallback onpress}) {
  return SizedBox(
      width: 160,
      child: ElevatedButton(
        onPressed: onpress,
        child: Text("$buttonName"),
        style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)))),
      ));
}
