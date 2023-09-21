import 'package:agile/module/update_depart_module/update_depart_cubit/update_depart_cubit.dart';
import 'package:agile/shared/component/custom_text_sec_login.dart';
import 'package:agile/shared/network/remote/logging_interceptor.dart';
import 'package:agile/shared/service/app_reouter.dart';
import 'package:agile/shared/service/show_toast.dart';
import 'package:agile/shared/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class UpdateDepartmentView extends StatelessWidget {
  UpdateDepartmentView({super.key});
  final TextEditingController nameController = TextEditingController();

  var formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UpdateDepartCubit()..getManagers()..getUsers(),
      child: BlocConsumer<UpdateDepartCubit, UpdateDepartState>(
        listener: (context, state) {

          if (state is UpdateDepartSuccessState) {
            showToast(text: LoggingInterceptor.SuccessMessage, state: ToastState.SUCCESS);
            GoRouter.of(context).push(AppRouter.kHomeAdmin);
          }else if (state is UpdateDepartErrorState) {

            showToast(text: LoggingInterceptor.errorMessage, state: ToastState.ERORR);
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
              child: SafeArea(
                  child: Form(
                key: formkey,
                child: Column(
                  children: [
                    const TextSecLogin(
                        header: 'Update Department!',
                        para:
                            'Update department details and assign a new manager to continue work!'),
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
                            keyboardType: TextInputType.emailAddress,
                            controller: nameController,
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
                          hint: const Text('Assigned Manager'),
                          isExpanded: true,
                          value: UpdateDepartCubit.get(context).managerChoose,
                          onChanged: (newValue) {
                            UpdateDepartCubit.get(context).chooseManager(newValue!);
                          },
                          items:  UpdateDepartCubit.get(context).managersId.map((valueItem) {
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
                          hint: const Text('Assigned Employee'),
                          isExpanded: true,
                          value: UpdateDepartCubit.get(context).userChoose,
                          onChanged: (newValue) {
                            UpdateDepartCubit.get(context).chooseUser(newValue!);
                          },
                          items: UpdateDepartCubit.get(context)
                              .userId
                              .map((valueItem) {
                            return DropdownMenuItem(
                                value: valueItem, child: Text(valueItem));
                          }).toList(),
                        ),
                      ),
                    ),
                    Column(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width * 0.9,
                          height: 48,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6),
                              color: const Color(0xff5A55CA)),
                          child: MaterialButton(
                            onPressed: () {
                              UpdateDepartCubit.get(context).updateDepartment(
                                  nameDepart: nameController.text,
                                  managerId: UpdateDepartCubit.get(context).managerChoose,
                                  userId: UpdateDepartCubit.get(context).userChoose

                              );
                            },
                            child: const Text(
                              'Update',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              )),
            ),
          );
        },
      ),
    );
  }
}

buildOutlineInputBorder() {
  return OutlineInputBorder(
      borderSide: const BorderSide(color: Styles.kColor),
      borderRadius: BorderRadius.circular(6));
}
