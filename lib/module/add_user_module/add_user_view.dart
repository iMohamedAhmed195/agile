import 'package:agile/module/add_user_module/add_user_cubit/add_user_cubit.dart';
import 'package:agile/shared/component/custom_text_sec_login.dart';
import 'package:agile/shared/service/app_reouter.dart';
import 'package:agile/shared/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class AddUserView extends StatelessWidget {
  AddUserView({super.key});

  int value = 0;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  var formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
  create: (context) => AddUserCubit(),
  child: Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
            child: Form(
          key: formkey,
          child: Column(
            children: [
              const TextSecLogin(
                  header: 'Add New User!',
                  para:
                      ' Create a new user now and assign them tasks right away.'),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 20.0, right: 20.0, bottom: 30),
                    child: TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'please enter your name';
                        }
                      },
                      decoration: InputDecoration(
                          enabledBorder: buildOutlineInputBorder(),
                          focusedBorder: buildOutlineInputBorder(),
                          hintText: 'name'),
                      keyboardType: TextInputType.text,
                      controller: nameController,
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
                      validator: (value) {
                        if (!value!.contains("@")) {
                          return 'please enter right email address';
                        }
                      },
                      decoration: InputDecoration(
                          enabledBorder: buildOutlineInputBorder(),
                          focusedBorder: buildOutlineInputBorder(),
                          hintText: 'email'),
                      keyboardType: TextInputType.text,
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
                      validator: (value) {
                        if (value!.length <= 3) {
                          return 'please enter your phone';
                        }
                      },
                      decoration: InputDecoration(
                          enabledBorder: buildOutlineInputBorder(),
                          focusedBorder: buildOutlineInputBorder(),
                          hintText: 'phone'),
                      keyboardType: TextInputType.phone,
                      controller: phoneController,
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
                      validator: (value) {
                        if (value!.length <= 6) {
                          return 'please enter right password';
                        }
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
              Row(
                children: [
                  Expanded(
                    child: RadioListTile(
                      value: 1,
                      groupValue: value,
                      onChanged: (value) {},
                      title: Text(
                        "admin",
                        style: TextStyle(fontSize: 12),
                      ),
                    ),
                  ),
                  Expanded(
                    child: RadioListTile(
                      value: 2,
                      groupValue: value,
                      onChanged: (value) {},
                      title: Text('Manager', style: TextStyle(fontSize: 12)),
                    ),
                  ),
                  Expanded(
                    child: RadioListTile(
                      value: 3,
                      groupValue: value,
                      onChanged: (value) {},
                      title: Text('User', style: TextStyle(fontSize: 12)),
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  BlocConsumer<AddUserCubit, AddUserState>(
                    listener: (context, state) {
                      if (state is AddUserSuccessState) {
                        GoRouter.of(context).push(AppRouter.kHome);
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
                              AddUserCubit.get(context).addedUser(
                                  name: nameController.text,
                                  email: emailController.text,
                                  phone: phoneController.text,
                                  password: passwordController.text,
                                  userType: '0');
                            }
                          },
                          child: const Text(
                            'Create user',
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
