// ignore_for_file: library_private_types_in_public_api, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:startup_repo/helper/navigation.dart';
import 'package:startup_repo/utils/extensions.dart';
import 'package:startup_repo/utils/images.dart';
import 'package:startup_repo/utils/style.dart';
import 'package:startup_repo/view/base/common/primary_button.dart';
import 'package:startup_repo/view/base/common/textfield.dart';
import 'package:startup_repo/view/screens/auth/forgot_screen.dart';
import 'package:startup_repo/view/screens/auth/sign_up_screen.dart';
import 'package:startup_repo/view/screens/auth/widgets/custom_check_box.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  bool _isPasswordVisible = false;

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
        child: Padding(
          padding: pagePadding,
          child: Form(
            key: _formKey,
            child: ListView(
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                25.hight,
                Center(
                  child: Image.asset(
                    Images.logo,
                    height: 150.sp,
                    fit: BoxFit.cover,
                  ),
                ),
                Center(
                  child: Text(
                    "welcome_back".tr,
                    style: headlineSmall(context),
                  ),
                ),
                25.verticalSpace,
                CustomTextField(
                 
                  prefixIcon: Icons.email,
                  hintText: "example@example.com",
                  labelText: "enter_email".tr,
                  controller: _emailController,
                  // validator: (value) => Validators.emailValidator(value),
                ),
                20.verticalSpace,
                CustomTextField(
                  hintText: "Password",
                 
                  prefixIcon: Icons.lock,
                  labelText: "enter_password".tr,
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
                5.verticalSpace,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const CustomCheckBox(text: 'Remember Me'),
                    TextButton(
                      onPressed: () {
                        launchScreen(
                          const ForgotPassword(),
                        );
                      },
                      child: Text(
                        'Forgot Password?',
                        style: bodySmall(context).copyWith(
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
                25.verticalSpace,
                PrimaryButton(
                  text: "Sign In",
                  onPressed: _signIn,
                ),
                20.verticalSpace,
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
                30.verticalSpace,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.facebook, size: 30.sp),
                    10.horizontalSpace,
                    Icon(Icons.facebook, size: 30.sp),
                  ],
                ),
                15.verticalSpace,
                InkWell(
                  onTap: () => launchScreen(
                    const SignUpScreen(),
                  ),
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      text: 'I dont have an account? ',
                      style: Theme.of(context).textTheme.bodyMedium,
                      children: [
                        TextSpan(
                          text: 'SIGN UP',
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
      ),
    );
  }

  void _signIn() {
    final isValid = _formKey.currentState?.validate() ?? false;
    if (isValid) {
    } else {
      setState(() {});
    }
  }
}
