import 'package:agile/module/login_module/login_cubit/login_cubit.dart';

import 'package:agile/shared/component/custom_text_sec_login.dart';
import 'package:agile/shared/service/app_reouter.dart';
import 'package:agile/shared/service/secure.dart';
import 'package:agile/shared/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class LogInView extends StatelessWidget {
  LogInView({super.key});

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  var formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: Scaffold(
        body: SingleChildScrollView(
          child: SafeArea(
              child: Form(
            key: formkey,
            child: Column(
              children: [
                const TextSecLogin(
                    header: 'Welcome Back!',
                    para:
                        'Login to access your assinged tasks and personal overview.'),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 20.0, right: 20.0, bottom: 30),
                      child: TextFormField(
                        validator: (value){
                          if(!value!.contains("@")){
                            return 'please enter right email address';
                          }
                          return null ;
                        },
                        decoration: InputDecoration(
                            enabledBorder: buildOutlineInputBorder(),
                            focusedBorder: buildOutlineInputBorder(),
                            hintText: 'email'),
                        keyboardType: TextInputType.emailAddress,
                        controller: emailController,
                      ),
                    )
                  ],
                ),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 20.0, right: 20.0, bottom: 30),
                      child: TextFormField(
                        validator: (value){
                          if(value!.length <=6)
                            {
                              return 'please enter right password';
                            }
                          return null ;
                        },
                        decoration: InputDecoration(
                            enabledBorder: buildOutlineInputBorder(),
                            focusedBorder: buildOutlineInputBorder(),
                            hintText: 'password'),
                        obscureText: true,
                        keyboardType: TextInputType.visiblePassword,
                        controller: passwordController,
                      ),
                    )
                  ],
                ),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Row(
                        children: [
                          Checkbox(value: false, onChanged: (value) {}),
                          const Text(
                            'Keep me logged in',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w400),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    BlocConsumer<LoginCubit, LoginState>(
                      listener: (context, state) {
                        if (state is LoginSuccessState) {
                          GoRouter.of(context).push(AppRouter.kHome);
                          Secure().secureWriteData(key: 'token' , value: state.loginModel.data!.token) ;
                        }
                      },
                      builder: (context, state) {
                        return Container(
                          width: MediaQuery.of(context).size.width * 0.9,
                          height: 48,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6),
                              color: const Color(0xff5A55CA)),
                          child: MaterialButton(
                            onPressed: () {
                              if (formkey.currentState!.validate()) {
                                LoginCubit.get(context).loginApp(
                                    email: emailController.text,
                                    password: passwordController.text);
                              }
                            },
                            child: const Text(
                              'Login',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),
          )),
        ),
      ),
    );
  }

  buildOutlineInputBorder() {

    return OutlineInputBorder(

        borderSide: const BorderSide(color: Styles.kColor),
        borderRadius: BorderRadius.circular(6));
  }
}
