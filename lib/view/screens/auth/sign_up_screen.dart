// ignore_for_file: library_private_types_in_public_api, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:startup_repo/helper/navigation.dart';
import 'package:startup_repo/utils/images.dart';
import 'package:startup_repo/utils/style.dart';
import 'package:startup_repo/view/base/common/primary_button.dart';
import 'package:startup_repo/view/base/common/textfield.dart';
import 'package:startup_repo/view/screens/auth/sign_in_screen.dart';
import 'package:startup_repo/view/screens/auth/widgets/custom_check_box.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool _isPasswordVisible = false; // Visibility state

  void _submitForm() {
    final isValid = _formKey.currentState?.validate() ?? false;
    if (isValid) {
    } else {
      setState(() {
        // Triggers UI updates for validation errors
      });
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: ListView(
            padding: pagePadding,
            children: [
              25.verticalSpace,
              Center(
                child: Image.asset(
                  Images.logo,
                  width: 180.sp,
                  height: 180.sp,
                ),
              ),
              Center(
                child: Text(
                  "register".tr,
                  style: headlineSmall(context),
                ),
              ),

              10.verticalSpace,
              CustomTextField(
                prefixIcon: Icons.person,
                hintText: "example@example.com",
                labelText: "enter_name".tr,
                // prefixIcon: Icons.mail,
                controller: _emailController,
                // validator: (value) => Validators.emailValidator(value),
              ),
              10.verticalSpace,
              CustomTextField(
                prefixIcon: Icons.email,
                hintText: "example@example.com",
                labelText: "enter_email".tr,
                // prefixIcon: Icons.mail,
                controller: _emailController,
                // validator: (value) => Validators.emailValidator(value),
              ),
              10.verticalSpace,
              // Email TextField

              CustomTextField(
                labelText: "enter_password".tr,
                prefixIcon: Icons.lock,
                suffixIcon: IconButton(
                  icon: Icon(
                    _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                  ),
                  onPressed: () {
                    setState(() {
                      _isPasswordVisible = !_isPasswordVisible;
                    });
                  },
                ),
                obscureText: !_isPasswordVisible,
                controller: _passwordController,
                // validator: (value) => Validators.passwordValidator(value),
              ),
              10.verticalSpace,

              CustomTextField(
                labelText: "confirm_password".tr,
                prefixIcon: Icons.lock,
                suffixIcon: IconButton(
                  icon: Icon(
                    _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                  ),
                  onPressed: () {
                    setState(() {
                      _isPasswordVisible = !_isPasswordVisible;
                    });
                  },
                ),
                obscureText: !_isPasswordVisible,
                controller: _passwordController,
              ),
              15.verticalSpace,
              const CustomCheckBox(
                text: 'Confirm All ',
                secondText: 'Terms & Condition',
              ),
              10.verticalSpace,
              PrimaryButton(
                text: "Sign Up",
                onPressed: _submitForm,
              ),
              SizedBox(height: 15.sp),
              Row(
                children: [
                  Expanded(
                      child: Divider(
                    thickness: 2,
                    color: Theme.of(context).dividerColor,
                  )),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5.sp),
                    child: Text(
                      "or",
                      style: bodyLarge(context).copyWith(
                        color: Theme.of(context).hintColor,
                      ),
                    ),
                  ),
                  Expanded(
                      child: Divider(
                    thickness: 2,
                    color: Theme.of(context).dividerColor,
                  )),
                ],
              ),
              10.verticalSpace,
              InkWell(
                onTap: () {
                  launchScreen(
                    const SignInScreen(),
                  );
                },
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    text: 'Already have an account?',
                    style: Theme.of(context).textTheme.bodyMedium,
                    children: [
                      TextSpan(
                        text: 'SIGN IN',
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium
                            ?.copyWith(color: Theme.of(context).primaryColor, fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
