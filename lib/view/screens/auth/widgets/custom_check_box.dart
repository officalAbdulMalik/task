// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomCheckBox extends StatefulWidget {
  final String text;
  final String? secondText;
  const CustomCheckBox({super.key, required this.text, this.secondText});
  @override
  _CustomCheckBoxState createState() => _CustomCheckBoxState();
}

class _CustomCheckBoxState extends State<CustomCheckBox> {
  bool _isChecked = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      onTap: () {
        setState(() {
          _isChecked = !_isChecked;
        });
      },
      child: Row(
        children: [
          2.sp.horizontalSpace,
          Checkbox(
            value: _isChecked,
            onChanged: (bool? value) {
              setState(() {
                _isChecked = value ?? false;
              });
            },
            activeColor: Theme.of(context).primaryColor,
            shape: const CircleBorder(),
          ),
          8.horizontalSpace,
          Text(widget.text),
          if (widget.secondText != null) ...[
            4.sp.verticalSpace,
            Text(widget.secondText!),
          ],
        ],
      ),
    );
  }
}
