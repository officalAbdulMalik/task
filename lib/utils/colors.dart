import 'package:flutter/material.dart';
import '../data/model/env.dart';

Color primaryColor = EnvModel.primaryColor;
Color secondaryColor = EnvModel.secondaryColor;

const Color backgroundColorDark = Color(0xFF121212);
const Color backgroundColorLight = Color(0xFFFFFFFF);

const Color cardColorDark = Color(0xFF222222);
const Color cardColorLight = Color(0xFFF7F8FA);

const Color textColorDark = Color(0XFFDADADA);
const Color textColorLight = Colors.black;

const Color shadowColorDark = Color(0xFF0A1220);
const Color shadowColorLight = Color(0xFFE8E8E8);

const Color hintColorDark = Color(0xFFA4A6A4);
const Color hintColorLight = Color(0xFF9F9F9F);

const Color canvasColorDark = Color(0xFFA4A6A4);
const Color canvasColorLight = Color.fromARGB(255, 70, 68, 68);

const Color disabledColorDark = Color(0xffa2a7ad);
const Color disabledColorLight = Color(0xffa2a7ad);
Color dividerColorDark = Colors.grey[800]!;
Color dividerColorLight = Colors.grey[300]!;
const Color iconColorDark = Colors.white;
const Color iconColorLight = Colors.black;

LinearGradient get primaryGradient => LinearGradient(
      colors: [secondaryColor, primaryColor],
      stops: const [0.2, 1.0],
      begin: Alignment.bottomLeft,
      end: Alignment.topRight,
    );
