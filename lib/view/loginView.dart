// ignore_for_file: file_names

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hobit_app/core/view_model/login_view_model.dart';
import 'package:hobit_app/view/widget/MyBotton.dart';
import 'package:hobit_app/view/widget/MyTextField.dart';
import 'package:hobit_app/view/widget/Text.dart';
import 'package:hobit_app/view/widget/icon_broken.dart';
import 'package:lottie/lottie.dart';

class LoginView extends GetWidget<LoginViewModel> {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: GetBuilder<LoginViewModel>(
            init: LoginViewModel(),
            builder: (control) {
              return SingleChildScrollView(
                child: Column(
                  children: [
                    Lottie.asset('assets/images/animation.json', width: 200),
                    const SizedBox(height: 30.0),
                    MyTextFormField(
                      isShow: false,
                      perfixIcon: const Icon(IconBroken.Profile),
                      text: 'Username',
                      type: TextInputType.emailAddress,
                      controller: control.usernameController,
                    ),
                    const SizedBox(height: 20.0),
                    MyTextFormField(
                      perfixIcon: const Icon(IconBroken.Lock),
                      isShow: control.isShow,
                      controller: control.passwordController,
                      text: 'password',
                      type: TextInputType.emailAddress,
                      suffixIcon: IconButton(
                          onPressed: () {
                            control.changeShow();
                          },
                          icon: control.isShow
                              ? const Icon(Icons.visibility)
                              : const Icon(Icons.visibility_off)),
                    ),
                    const SizedBox(height: 20.0),
                    GetBuilder<LoginViewModel>(
                      builder: (contro) {
                        return CustomBottom(
                          onPressed: () {
                            controller.loginMethod();
                          },
                          color: const Color.fromARGB(255, 176, 210, 209),
                          text: contro.isLoading.value
                              ? const CupertinoActivityIndicator(
                                  color: Colors.white,
                                )
                              : CustomText(
                                  text: 'Login',
                                  textStyle: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .copyWith(
                                        color: Colors.white,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600,
                                      ),
                                ),
                          width: double.infinity,
                          height: 50,
                        );
                      },
                    ),
                  ],
                ),
              );
            }),
      ),
    );
  }
}
