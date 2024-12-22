// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:startup_repo/utils/colors.dart';

class PrimaryIconButton extends StatelessWidget {
  final Function() onPressed;
  final Widget icon;
  final double? radius;
  final Color? color;
  final bool shadow;
  const PrimaryIconButton(
      {required this.onPressed, required this.icon, this.radius, this.color, this.shadow = true, super.key});

  @override
  Widget build(BuildContext context) {
    final Color backgroundColor = color ?? primaryColor;
    return Container(
      decoration: BoxDecoration(
        color: backgroundColor,
        shape: radius != null ? BoxShape.rectangle : BoxShape.circle,
        borderRadius: radius != null ? BorderRadius.circular(radius!) : null,
        boxShadow: !shadow
            ? null
            : [
                BoxShadow(
                  color: backgroundColor.withOpacity(0.35), // Shadow color
                  spreadRadius: 5, // Spread radius
                  blurRadius: 10, // Blur radius
                  offset: const Offset(0, 0), // No offset
                ),
              ],
      ),
      child: IconButton.filled(
        style: IconButton.styleFrom(backgroundColor: backgroundColor),
        iconSize: 40.sp,
        icon: icon,
        onPressed: onPressed,
      ),
    );
  }
}

class ActionIconButton extends StatelessWidget {
  final String icon;
  final double? iconSize;
  final double? buttonSize;
  final double? iconRadius;
  final Function() onPressed;
  final Color? color;
  const ActionIconButton(
      {required this.icon,
      required this.onPressed,
      this.buttonSize,
      this.iconRadius,
      this.iconSize,
      this.color,
      super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      padding: EdgeInsets.zero,
      visualDensity: const VisualDensity(horizontal: -4, vertical: -4),
      onPressed: onPressed,
      icon: Container(
        width: buttonSize ?? 50.sp,
        height: buttonSize ?? 50.sp,
        decoration: BoxDecoration(
          color: primaryColor.withOpacity(0.5),
          borderRadius: BorderRadius.circular(iconRadius ?? 18.sp),
        ),
        child: Center(
          child: Image.asset(
            icon,
            width: iconSize ?? 24.sp,
            height: iconSize ?? 24.sp,
            color: color ?? Colors.white,
          ),
        ),
      ),
      style: style,
    );
  }

  get style => IconButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.sp),
        ),
      );
}
