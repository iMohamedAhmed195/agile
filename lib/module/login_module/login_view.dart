

import 'package:agile/shared/component/custom_text_field.dart';
import 'package:agile/shared/component/custom_text_sec_login.dart';
import 'package:agile/shared/styles/colors.dart';
import 'package:flutter/material.dart';

class LogInView extends StatelessWidget {
  LogInView({super.key});

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  var formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
            child: Form(
              key: formkey,
              child: Column(
                children: [
                  const TextSecLogin(header:'Welcome Back!' , para: 'Login to access your assinged tasks and personal overview.' ),
                  CustomTextField(hint: 'email', controller: emailController,),
                  CustomTextField(hint : 'paswword',controller: passwordController,),



                  ButtonAndCheckboxSec(
                    email: emailController.text,
                    password: passwordController.text,
                  )
                ],
              ),
            )),
      ),
    );
  }

  buildOutlineInputBorder() {
    return OutlineInputBorder(
        borderSide: const BorderSide(color: Styles.kColor),
        borderRadius: BorderRadius.circular(6));
  }
}

class ButtonAndCheckboxSec extends StatelessWidget {
  const ButtonAndCheckboxSec(
      {super.key, required this.email, required this.password});

  final String email;
  final String password;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Row(
            children: [
              Checkbox(value: false, onChanged: (value) {}),
              const Text(
                'Keep me logged in',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
              )
            ],
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        Container(
          width: MediaQuery.of(context).size.width * 0.9,
          height: 48,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              color: const Color(0xff5A55CA)),
          child: MaterialButton(
            onPressed: () {
              // LoginCubit.get(context).fetchLoginUser(email, password);
            },
            child: const Text(
              'Login',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }
}
