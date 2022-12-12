import 'package:devbey/core/resources/color_manager.dart';
import 'package:devbey/core/resources/route_manger.dart';
import 'package:devbey/core/resources/validation.dart';
import 'package:devbey/core/widget/lottie_widget.dart';
import 'package:devbey/core/widget/text_field_widget.dart';
import 'package:devbey/featuers/login/presntiation/bloc/login_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/resources/asset_manager.dart';
import '../../../../core/resources/button_widget.dart';
import '../widget/lgoin_widget.dart';

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
                            return LoginWidget(
                                screen: screen, bloc: bloc, formKey: _formKey);
                          } else if (state is LoadingState) {
                            return LottieWidget(
                                text: 'loading...',
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
                          else if (state is LoginSuccess) {
                            return Container();
                          }
                          

                          return LottieWidget(
                              text: 'something happen wrong',
                              lottie: AssetJsonManage.car,
                              onPressed: () {
                                bloc.add(GoToLoginInitial());
                              },
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
