import 'package:flutter/material.dart';

extension CustomSizedBoxExt on num {
  SizedBox get hight => SizedBox(width: toDouble());
  SizedBox get width => SizedBox(height: toDouble());
}
