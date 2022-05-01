import 'package:flutter/material.dart';

extension WidgetExtension on Widget {
  Widget toVisible(bool val) => val ? this : Text("-");
}

extension DoubleExtension on double {
  EdgeInsetsGeometry get padding {
    return EdgeInsets.all(this);
  }

  EdgeInsetsGeometry get paddingH {
    return EdgeInsets.only(left: this, right: this);
  }

  EdgeInsetsGeometry get paddingV {
    return EdgeInsets.only(top: this, bottom: this);
  }
}
