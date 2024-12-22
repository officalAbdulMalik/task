// ignore_for_file: library_private_types_in_public_api, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:startup_repo/helper/navigation.dart';
import 'package:startup_repo/utils/images.dart';
import 'package:startup_repo/utils/style.dart';
import 'package:startup_repo/view/base/common/primary_button.dart';
import 'package:startup_repo/view/base/common/textfield.dart';
import 'package:startup_repo/view/base/common_app_bar.dart';
import 'package:startup_repo/view/screens/auth/sign_in_screen.dart';

class CreateNewPassword extends StatefulWidget {
  const CreateNewPassword({super.key});

  @override
  _CreateNewPasswordState createState() => _CreateNewPasswordState();
}

class _CreateNewPasswordState extends State<CreateNewPassword> {
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(56.sp),
            child: const CommonAppBar(
              title: "Create New Password",
            )),
        body: SafeArea(
          child: Padding(
            padding: pagePadding,
            child: Form(
              key: _formKey,
              child: ListView(
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  10.verticalSpace,
                  Center(
                    child: Image.asset(
                      Images.logo,
                      width: double.infinity,
                      height: 180.sp,
                    ),
                  ),
                  20.verticalSpace,
                  Text(
                    'Your New Password Must be different from previously used password',
                    textAlign: TextAlign.center,
                    style: bodyMedium(context).copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 20.sp),
                  CustomTextField(
                    controller: _passwordController,
                    hintText: 'Enter new password',
                    labelText: 'New Password',
                    obscureText: true,
                  ),
                  20.sp.horizontalSpace,
                  CustomTextField(
                    controller: _confirmPasswordController,
                    hintText: 'Confirm new password',
                    labelText: 'Confirm Password',
                    obscureText: true,
                  ),
                  20.sp.verticalSpace,
                  PrimaryButton(
                    text: 'Create Password',
                    onPressed: _createNewPassword,
                  ),
                  SizedBox(height: 10.sp),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _createNewPassword() {
    final isValid = _formKey.currentState?.validate() ?? false;
    if (isValid) {
      launchScreen(const SignInScreen(), pushAndRemove: true);
    } else {
      setState(() {
        // Triggers UI updates for validation errors
      });
    }
  }
}
