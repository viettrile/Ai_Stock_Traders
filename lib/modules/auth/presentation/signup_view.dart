import 'dart:ui';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:getx_structure/core/assets/locale_keys.g.dart';
import 'package:getx_structure/core/common_widgets/common_app_button.dart';
import 'package:getx_structure/core/common_widgets/common_textform_field.dart';
import 'package:getx_structure/core/core.dart';
import 'package:getx_structure/modules/auth/presentation/controller/login_controller.dart';

class RegisterView extends GetView<LoginController> {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return KeyboardDismisser(
      child: Scaffold(
        body: Stack(
          children: [
            SingleChildScrollView(
              child: Container(
                height: MediaQuery.of(context).size.height,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(Assets.images.backgroundImage.path),
                    fit: BoxFit.cover,
                  ),
                ),
                padding: EdgeInsets.fromLTRB(12.w, 80.h, 12.w, 60.h),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 3.0, sigmaY: 3.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.9),
                      borderRadius: BorderRadius.circular(16.r),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 8,
                          offset: Offset(0, 4),
                        ),
                      ],
                    ),
                    padding: EdgeInsets.all(12.r),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          LocaleKeys.register.trans(),
                          style: TextStyle(
                            fontSize: 28.sp,
                            fontWeight: FontWeight.bold,
                            color: AppColors.primary,
                          ),
                        ),
                        SizedBox(height: 8.h),
                        Center(
                          child: Image.asset(Assets.images.logoHeader.path,
                              width: 150.w, height: 100.h, fit: BoxFit.contain),
                        ),
                        SizedBox(height: 12.h),
                        // Username field
                        CommonTextFormField(
                          controller: controller.usernameController,
                          decoration: InputDecoration(
                            prefixIcon: const Icon(
                                Icons.account_circle_outlined,
                                color: AppColors.gray60),
                            labelText: LocaleKeys.username.trans(),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.r),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: AppColors.primary, width: 1.0.w),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.grey, width: 1.0.w),
                              borderRadius: BorderRadius.circular(8.r),
                            ),
                            filled: true,
                            fillColor: Colors.white,
                          ),
                        ),
                        SizedBox(height: 16.h),
                        // Email field
                        CommonTextFormField(
                          // controller: controller.emailController,
                          decoration: InputDecoration(
                            prefixIcon: const Icon(Icons.email_outlined,
                                color: AppColors.gray60),
                            labelText: LocaleKeys.email.trans(),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.r),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: AppColors.primary, width: 1.0.w),
                              borderRadius: BorderRadius.circular(8.r),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.grey, width: 1.0.w),
                              borderRadius: BorderRadius.circular(8.r),
                            ),
                            filled: true,
                            fillColor: Colors.white,
                          ),
                        ),
                        SizedBox(height: 16.h),
                        // Password field
                        CommonTextFormField(
                          controller: controller.passwordController,
                          decoration: InputDecoration(
                            prefixIcon: const Icon(Icons.lock_outline,
                                color: AppColors.gray60),
                            labelText: LocaleKeys.password.trans(),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.r),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: AppColors.primary, width: 1.0.w),
                              borderRadius: BorderRadius.circular(8.r),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.grey, width: 1.0.w),
                              borderRadius: BorderRadius.circular(8.r),
                            ),
                            filled: true,
                            fillColor: Colors.white,
                          ),
                          obscureText: true,
                        ),
                        SizedBox(height: 16.h),
                        // Confirm Password field
                        CommonTextFormField(
                          // controller: controller.confirmPasswordController,
                          decoration: InputDecoration(
                            prefixIcon: const Icon(Icons.lock_outline,
                                color: AppColors.gray60),
                            labelText: LocaleKeys.confirmPassword.trans(),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.r),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: AppColors.primary, width: 1.0.w),
                              borderRadius: BorderRadius.circular(8.r),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.grey, width: 1.0.w),
                              borderRadius: BorderRadius.circular(8.r),
                            ),
                            filled: true,
                            fillColor: Colors.white,
                          ),
                          obscureText: true,
                        ),
                        SizedBox(height: 40.h),
                        Obx(
                          () => CommonButton(
                            text: LocaleKeys.register.trans(),
                            fontSize: 16.sp,
                            backgroundColor: AppColors.primary,
                            textColor: Theme.of(context).secondaryHeaderColor,
                            widthFactor: 0.8.w,
                            onPressed: controller.isLoading.value
                                ? null
                                : () async {
                                    controller.isLoading.value = true;
                                    // await controller.handleRegister();
                                    controller.isLoading.value = false;
                                  },
                          ),
                        ),
                        SizedBox(height: 32.h),
                        // Navigate to Login
                        Center(
                          child: RichText(
                            text: TextSpan(
                              text: 'Bạn đã có tài khoản?  ',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 14.sp,
                              ),
                              children: [
                                TextSpan(
                                  text: 'Đăng nhập',
                                  style: TextStyle(
                                    color: AppColors.primary,
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      Get.toNamed('/login');
                                    },
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
            ),
            Obx(
              () => controller.isLoading.value
                  ? Positioned.fill(
                      child: Container(
                        color: Colors.black.withOpacity(0.5),
                        child: const Center(
                          child: CircularProgressIndicator(
                            valueColor:
                                AlwaysStoppedAnimation<Color>(Colors.white),
                          ),
                        ),
                      ),
                    )
                  : const SizedBox.shrink(),
            ),
          ],
        ),
      ),
    );
  }
}
