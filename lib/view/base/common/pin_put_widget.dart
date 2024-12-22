// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PinInputField extends StatefulWidget {
  final int? pinLength;
  final double? boxWidth;
  final double? boxHeight;
  final double? fontSize;
  final Color? filledColor;
  final Color? unfilledColor;
  final Color? borderColor;
  final double? borderRadius;
  final double? borderWidth;

  const PinInputField({
    super.key,
    this.pinLength,
    this.boxWidth,
    this.boxHeight,
    this.fontSize,
    this.filledColor,
    this.unfilledColor,
    this.borderColor,
    this.borderRadius,
    this.borderWidth,
  });

  @override
  _PinInputFieldState createState() => _PinInputFieldState();
}

class _PinInputFieldState extends State<PinInputField> {
  late List<String> pinValues;

  @override
  void initState() {
    super.initState();
    pinValues = List.filled(widget.pinLength ?? 4, "");
  }

  void _handleInput(String value, int index) {
    setState(() {
      if (value.isNotEmpty && pinValues[index].isEmpty) {
        pinValues[index] = value;
        if (index < (widget.pinLength ?? 4) - 1) {
          FocusScope.of(context).nextFocus();
        }
      } else if (value.isEmpty) {
        pinValues[index] = value;
        if (index > 0) {
          FocusScope.of(context).previousFocus();
        }
      }
    });
  }

  Widget _buildPinBox(int index) {
    return Container(
      width: (widget.boxWidth ?? 50.0).sp,
      height: (widget.boxHeight ?? 60.0).sp,
      margin: EdgeInsets.symmetric(horizontal: 8.sp),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: pinValues[index].isEmpty
            ? (widget.unfilledColor ?? const Color(0xFFE0E0E0))
            : (widget.filledColor ?? const Color(0xFFB3E5FC)),
        borderRadius: BorderRadius.circular((widget.borderRadius ?? 8.0).sp),
        border: Border.all(
          color: widget.borderColor ?? Colors.blue,
          width: (widget.borderWidth ?? 2.0).sp,
        ),
      ),
      child: TextField(
        maxLength: 1,
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: (widget.fontSize ?? 18.0).sp,
          fontWeight: FontWeight.bold,
        ),
        decoration: const InputDecoration(
          border: InputBorder.none,
          counterText: "", // Remove the counter text
        ),
        onChanged: (value) => _handleInput(value, index),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(widget.pinLength ?? 4, _buildPinBox),
    );
  }
}
