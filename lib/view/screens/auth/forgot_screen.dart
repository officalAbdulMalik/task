// ignore_for_file: library_private_types_in_public_api, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:startup_repo/helper/navigation.dart';
import 'package:startup_repo/utils/images.dart';
import 'package:startup_repo/utils/style.dart';
import 'package:startup_repo/view/base/common/primary_button.dart';
import 'package:startup_repo/view/base/common/textfield.dart';
import 'package:startup_repo/view/base/common_app_bar.dart';
import 'package:startup_repo/view/screens/auth/verify_email_screen.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final TextEditingController _emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(56.sp),
            child: const CommonAppBar(
              title: "Forgot Password",
            )),
        body: SafeArea(
          child: Padding(
            padding: pagePadding,
            child: Form(
              key: _formKey,
              child: ListView(
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  10.sp.horizontalSpace,
                  Center(
                    child: Image.asset(
                      Images.logo,
                      width: double.infinity,
                      height: 140.sp,
                    ),
                  ),
                  30.verticalSpace,
                  CustomTextField(
                   
                    hintText: "example@example.com",
                    labelText: "enter_email".tr,
                    prefixIcon: Icons.mail,
                    controller: _emailController,
                  ),
                  30.verticalSpace,
                  PrimaryButton(
                    text: "Send Otp",
                    onPressed: _forgotPassword,
                  ),
                  30.verticalSpace,
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      'Try Another Way ?',
                      style: bodySmall(context).copyWith(
                        color: Theme.of(context).hintColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  30.verticalSpace,
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _forgotPassword() {
    final isValid = _formKey.currentState?.validate() ?? false;
    if (isValid) {
      launchScreen(const VerifyEmailScreen());
    } else {
      setState(() {
        // Triggers UI updates for validation errors
      });
    }
  }
}
