import 'package:flutter/material.dart';

extension SizedBoxh on num {
  SizedBox get h => SizedBox(height: toDouble());
}

extension SizedBoxw on num {
  SizedBox get w => SizedBox(width: toDouble());
}
