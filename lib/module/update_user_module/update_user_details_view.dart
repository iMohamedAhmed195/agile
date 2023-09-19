import 'package:agile/shared/component/custom_text_sec_login.dart';
import 'package:agile/shared/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'update_user_cubit/update_user_cubit.dart';


class UpdateUserDetailsView extends StatelessWidget {
  UpdateUserDetailsView({super.key});

  var emailController = TextEditingController();
  var nameController = TextEditingController();
  var phoneController = TextEditingController();
  var formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UpdateUserCubit()
        ..getUsers()
        ..getDepart(),
      child: BlocConsumer<UpdateUserCubit, UpdateUserState>(
        listener: (context, state) {
         if(state is UpdateUserSuccessState){

         }
        },
        builder: (context, state) {
          return Scaffold(
            backgroundColor: const Color(0xffF3FAF9),
            appBar: AppBar(
                backgroundColor: const Color(0xffF3FAF9),
                elevation: 0,
                leading: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.arrow_back_ios,
                      color: Colors.black,
                    ))),
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
                              return null;
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
                              return null;
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
                              return null;
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
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey, width: 2)),
                        child: DropdownButton(
                          hint: const Text('Assigned Employee'),
                          isExpanded: true,
                          value: UpdateUserCubit.get(context).userChoose,
                          onChanged: (newValue) {
                            UpdateUserCubit.get(context).chooseUser(newValue!);
                          },
                          items: UpdateUserCubit.get(context)
                              .userId
                              .map((valueItem) {
                            return DropdownMenuItem(
                                value: valueItem, child: Text(valueItem));
                          }).toList(),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey, width: 2)),
                        child: DropdownButton(
                          hint: const Text('Assigned Department'),
                          isExpanded: true,
                          value: UpdateUserCubit.get(context).departChoose,
                          onChanged: (newValue) {
                            UpdateUserCubit.get(context).chooseDepart(newValue!);

                          },
                          items: UpdateUserCubit.get(context)
                              .departId
                              .map((valueItem) {
                            return DropdownMenuItem(
                                value: valueItem, child: Text(valueItem));
                          }).toList(),
                        ),
                      ),
                    ),
                    Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                                child: RadioListTile(
                              value: "admin",
                              groupValue:
                                  UpdateUserCubit.get(context).selectValue,
                              onChanged: (value) {
                                UpdateUserCubit.get(context)
                                    .changeRadio(value!);
                              },
                              title: const Text(
                                "admin",
                                style: TextStyle(fontSize: 12),
                              ),
                            )),
                            Expanded(
                              child: RadioListTile(
                                value: "manager",
                                groupValue:
                                    UpdateUserCubit.get(context).selectValue,
                                onChanged: (value) {
                                  UpdateUserCubit.get(context)
                                      .changeRadio(value!);
                                },
                                title: const Text('Manager',
                                    style: TextStyle(fontSize: 12)),
                              ),
                            ),
                            Expanded(
                              child: RadioListTile(
                                value: "user",
                                groupValue:
                                    UpdateUserCubit.get(context).selectValue,
                                onChanged: (value) {
                                  UpdateUserCubit.get(context)
                                      .changeRadio(value!);
                                },
                                title: const Text('User',
                                    style: TextStyle(fontSize: 12)),
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
                                    departId: UpdateUserCubit.get(context).departChoose,
                                    userId: UpdateUserCubit.get(context).userChoose);
                              }
                            },
                            child: const Text(
                              'Create user',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height : 30)
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  buildOutlineInputBorder() {
    return OutlineInputBorder(
        borderSide: const BorderSide(color: Styles.kColor),
        borderRadius: BorderRadius.circular(6));
  }
}
