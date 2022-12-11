import 'package:devbey/core/resources/color_manager.dart';
import 'package:devbey/core/resources/route_manger.dart';
import 'package:devbey/core/resources/validation.dart';
import 'package:devbey/core/widget/lottie_widget.dart';
import 'package:devbey/core/widget/text_field_widget.dart';
import 'package:devbey/featuers/login/presntiation/bloc/login_bloc.dart';
import 'package:devbey/featuers/search/presntiation/page/search_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

import '../../../../core/resources/asset_manager.dart';
import '../../../../core/resources/button_widget.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  @override
  final _formKey = GlobalKey<FormState>();
  Widget build(BuildContext context) {
    LoginBloc bloc = LoginBloc.getBloc(context);
    Size screen = MediaQuery.of(context).size;
    return Scaffold(
      body: Form(
        key: _formKey,
        child: SafeArea(
          child: SingleChildScrollView(
            child: Container(
              height: screen.height,
              width: screen.width,
              color: ColorManage.white,
              child: Column(
                children: [
                  Container(
                    height: screen.height / 5,
                    width: screen.width,
                    decoration: BoxDecoration(
                      color: ColorManage.primery,
                      borderRadius: BorderRadius.vertical(
                          bottom: Radius.circular(screen.width / 4)),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(screen.height / 35),
                      child: Image.asset(AssetImageManage.logo,
                          height: screen.height / 6),
                    ),
                  ),
                  SizedBox(
                    height: screen.height / 6,
                  ),
                  BlocConsumer<LoginBloc, LoginState>(
                    listener: (context, state) {
                      if (state is LoginSuccess) {
                        Navigator.pushNamedAndRemoveUntil(
                            context, Routes.searchPage, (route) => false);
                      }
                    },
                    builder: (context, state) {
                      return BlocBuilder<LoginBloc, LoginState>(
                        builder: (context, state) {
                          if (state is LoginInitial) {
                            return Column(
                              children: [
                                TextFieldWidget(
                                  textInputType: TextInputType.emailAddress,
                                  screen: screen,
                                  textEditingController: bloc.email,
                                  title: 'Email',
                                  hidden: false,
                                  icon: Icons.person,
                                  validator: (val) {
                                    if (!val!.isValidEmail) {
                                      return 'Enter Valid Email';
                                    }
                                  },
                                ),
                                SizedBox(
                                  height: screen.height / 30,
                                ),
                                TextFieldWidget(
                                  textInputType: TextInputType.visiblePassword,
                                  screen: screen,
                                  textEditingController: bloc.password,
                                  title: 'Password',
                                  hidden: true,
                                  icon: Icons.lock,
                                  validator: (val) {
                                    if (val!.length <= 8) {
                                      return 'Enter valid password';
                                    }
                                  },
                                ),
                                SizedBox(
                                  height: screen.height / 30,
                                ),
                                ButtonWidget(
                                  title: 'Login',
                                  screen: screen,
                                  width: 2,
                                  height: 12,
                                  ontap: () {
                                    if (_formKey.currentState!.validate()) {
                                      print(bloc.email.text);
                                      print(bloc.password.text);
                                      bloc.add(LoginExcute());
                                    }
                                  },
                                )
                              ],
                            );
                          } else if (state is LoadingState) {
                            return LottieWidget(
                                text: 'loading',
                                lottie: AssetJsonManage.loading,
                                onPressed: () {},
                                screen: screen);
                          } else if (state is LoginFaield) {
                            return LottieWidget(
                                text: state.failuer.message,
                                lottie: AssetJsonManage.error,
                                onPressed: () {
                                  bloc.add(GoToLoginInitial());
                                },
                                screen: screen);
                          }
                          return LottieWidget(
                              text: 'something happen wrong',
                              lottie: AssetJsonManage.car,
                              onPressed: () {},
                              screen: screen);
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}