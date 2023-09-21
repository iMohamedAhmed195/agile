import 'package:agile/module/add_department_module/add_depart_cubit/add_depart_cubit.dart';
import 'package:agile/shared/component/custom_text_sec_login.dart';
import 'package:agile/shared/network/remote/logging_interceptor.dart';
import 'package:agile/shared/service/app_reouter.dart';
import 'package:agile/shared/service/show_toast.dart';
import 'package:agile/shared/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';


class AddDepartmentView extends StatelessWidget {
  AddDepartmentView({super.key});

  final TextEditingController nameController = TextEditingController();
  var formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddDepartCubit(),
      child: Scaffold(
        backgroundColor: const Color(0xffF3FAF9),
        appBar: AppBar(
            backgroundColor: const Color(0xffF3FAF9),
            elevation: 0,
            leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back_ios, color: Colors.black,)
            )
        ),
        body: SingleChildScrollView(
          child: SafeArea(
              child: Form(
                key: formkey,
                child: Column(
                  children: [
                    const TextSecLogin(
                        header: 'New Department!',
                        para:
                        'Create a new department now and assign a manager to start the work!'),
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 20.0, right: 20.0, bottom: 30),
                          child: TextFormField(
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'please enter name';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                                enabledBorder: buildOutlineInputBorder(),
                                focusedBorder: buildOutlineInputBorder(),
                                hintText: 'Name'),

                            keyboardType: TextInputType.text,
                            controller: nameController,
                          ),
                        )
                      ],
                    ),

                Column(
                  children: [
                    Container(
                      width: MediaQuery
                          .of(context)
                          .size
                          .width * 0.9,
                      height: 48,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          color: const Color(0xff5A55CA)),
                      child: BlocConsumer<AddDepartCubit, AddDepartState>(
                        listener: (context, state) {
                          if (state is AddDepartSuccessState) {
                            showToast(text: LoggingInterceptor.SuccessMessage, state: ToastState.SUCCESS);
                            GoRouter.of(context).push(AppRouter.kHomeAdmin);
                          }else if (state is AddDepartErrorState) {

                            showToast(text: LoggingInterceptor.errorMessage, state: ToastState.ERORR);
                          }
                        },
                        builder: (context, state) {
                          return MaterialButton(
                            onPressed: () {

                              if(formkey.currentState!.validate()){
                                AddDepartCubit.get(context).addedDepartment(nameDepart: nameController.text);
                              }
                            },
                            child: const Text(
                              'Create',
                              style: TextStyle(color: Colors.white),
                            ),
                          );
                        },
                      ),
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
}

buildOutlineInputBorder() {
  return OutlineInputBorder(
      borderSide: const BorderSide(color: Styles.kColor),
      borderRadius: BorderRadius.circular(6));
}

