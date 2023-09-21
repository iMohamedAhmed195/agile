import 'package:agile/module/delete_modules/delete_cubit/delete_cubit.dart';
import 'package:agile/shared/component/custom_text_sec_login.dart';
import 'package:agile/shared/network/remote/logging_interceptor.dart';
import 'package:agile/shared/service/app_reouter.dart';
import 'package:agile/shared/service/show_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class DeleteUserView extends StatelessWidget {
  const DeleteUserView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DeleteCubit()..getUsers(),
      child: BlocConsumer<DeleteCubit, DeleteState>(
        listener: (context, state) {

      if (state is DeleteUserSuccessState) {
        showToast(text: LoggingInterceptor.SuccessMessage, state: ToastState.SUCCESS);
        GoRouter.of(context).push(AppRouter.kHomeAdmin);
      }else if (state is DeleteUserErrorState) {

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
                  child: Column(
                children: [
                  const TextSecLogin(
                      header: 'Delete User!',
                      para:
                          ' Delete user to fire him from the company if he is loser .'),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey, width: 2)),
                      child: DropdownButton(
                        hint: const Text('Assigned Employee'),
                        isExpanded: true,
                        value: DeleteCubit.get(context).userChoose,
                        onChanged: (newValue) {
                          DeleteCubit.get(context).chooseUser(newValue!);
                        },
                        items: DeleteCubit.get(context).userId.map((valueItem) {
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

                            DeleteCubit.get(context).deleteUsers(userId: DeleteCubit.get(context).userChoose);
                          },
                          child: const Text(
                            'Delete User',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              )),
            ),
          );
        },
      ),
    );
  }
}
