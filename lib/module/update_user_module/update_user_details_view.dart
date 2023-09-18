import 'package:agile/shared/component/custom_text_sec_login.dart';
import 'package:agile/shared/service/app_reouter.dart';
import 'package:agile/shared/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import 'update_user_cubit/update_user_cubit.dart';


class UpdateUserDetailsView extends StatelessWidget {
  UpdateUserDetailsView({super.key});


  var  emailController = TextEditingController();
  var  passwordController = TextEditingController();
  var  nameController = TextEditingController();
  var  phoneController = TextEditingController();
  var  departNameController = TextEditingController();
  var formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
  create: (context) => UpdateUserCubit(),
  child: Scaffold(
      backgroundColor: const Color(0xffF3FAF9),
      appBar:AppBar(
          backgroundColor: const Color(0xffF3FAF9),
          elevation: 0,
          leading: IconButton(
              onPressed: (){
                Navigator.pop(context);
              },
              icon:const Icon(Icons.arrow_back_ios , color: Colors.black,)
          )
      ),
      body: SingleChildScrollView(
        child: Form(
          key: formkey,
          child: Column(
            children: [
              const TextSecLogin(
                  header: 'Update User!',
                  para:
                  ' Update user details and give them a new identity.'),
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
                        return null ;
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
                        return null ;
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
                        return null ;
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
                    padding: const EdgeInsets.only(
                        left: 20.0, right: 20.0, bottom: 30),
                    child: TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'please enter your department name';
                        }
                        return null ;
                      },
                      decoration: InputDecoration(
                          enabledBorder: buildOutlineInputBorder(),
                          focusedBorder: buildOutlineInputBorder(),
                          hintText: 'department name'),
                      keyboardType: TextInputType.text,
                      controller: departNameController,
                    ),
                  )
                ],
              ),

              Column(
                children: [
                  BlocConsumer<UpdateUserCubit, UpdateUserState>(
                    listener: (context, state) {
                      if (state is UpdateUserSuccessState) {
                        GoRouter.of(context).push(AppRouter.kHomeAdmin);
                      }
                    },
                    builder: (context, state) {
                      return Column(
                        children: [
                          Row(
                            children: [
                              Expanded(
                                  child: RadioListTile(
                                    value:"admin",
                                    groupValue: UpdateUserCubit.get(context).selectValue,
                                    onChanged: (value) {
                                      UpdateUserCubit.get(context).changeRadio(value!);
                                    },
                                    title:  const Text("admin",style: TextStyle(fontSize: 12),),
                                  )),
                              Expanded(
                                child: RadioListTile(
                                  value: "manager",
                                  groupValue: UpdateUserCubit.get(context).selectValue,
                                  onChanged: (value) {
                                    UpdateUserCubit.get(context).changeRadio(value!);
                                  },
                                  title:  const Text('Manager',style: TextStyle(fontSize: 12)),
                                ),
                              ),
                              Expanded(
                                child: RadioListTile(
                                  value: "user",
                                  groupValue: UpdateUserCubit.get(context).selectValue,
                                  onChanged: (value) {
                                    UpdateUserCubit.get(context).changeRadio(value!);
                                  },
                                  title:  const Text('User',style: TextStyle(fontSize: 12)),
                                ),
                              ),
                            ],
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.9,
                            height: 48,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(6),
                                color: const Color(0xff5A55CA)),
                            child: MaterialButton(
                              onPressed: () {
                                if (formkey.currentState!.validate()) {
                                  UpdateUserCubit.get(context).updateUser(
                                      name: nameController.text,
                                      email: emailController.text,
                                      phone: phoneController.text,
                                      userStatus: "0",
                                     departId: departNameController.text
                                  );
                                }
                              },
                              child: const Text(
                                'Create user',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ],
              ),

            ],
          ),
        ),
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


