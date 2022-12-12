import 'package:devbey/core/resources/validation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../core/resources/button_widget.dart';
import '../../../../core/resources/color_manager.dart';
import '../../../../core/widget/text_field_widget.dart';
import '../bloc/login_bloc.dart';

class LoginWidget extends StatelessWidget {
  const LoginWidget({
    Key? key,
    required this.screen,
    required this.bloc,
    required GlobalKey<FormState> formKey,
  })  : _formKey = formKey,
        super(key: key);

  final Size screen;
  final LoginBloc bloc;
  final GlobalKey<FormState> _formKey;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: screen.height / 6,
          ),
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
            color: ColorManage.primery,
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
      ),
    );
  }
}
