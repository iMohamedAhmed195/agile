import 'package:agile/module/delete_modules/delete_cubit/delete_cubit.dart';
import 'package:agile/shared/component/custom_text_sec_login.dart';
import 'package:agile/shared/network/remote/logging_interceptor.dart';
import 'package:agile/shared/service/app_reouter.dart';
import 'package:agile/shared/service/show_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class DeleteTasksView extends StatelessWidget {
  const DeleteTasksView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DeleteCubit()..getTasks(),
      child: BlocConsumer<DeleteCubit, DeleteState>(
        listener: (context, state) {

          if (state is DeleteTasksSuccessState) {
            showToast(text: LoggingInterceptor.SuccessMessage, state: ToastState.SUCCESS);
            GoRouter.of(context).push(AppRouter.kHomeAdmin);
          }else if (state is DeleteTasksErrorState) {

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
                          header: 'Delete Tasks!',
                          para:
                          ' Delete some tasks if it\' done now or no user in there .'),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 30),
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey, width: 2)),
                          child: DropdownButton(
                            hint: const Text('Assigned Employee'),
                            isExpanded: true,
                            value: DeleteCubit.get(context).taskChoose,
                            onChanged: (newValue) {
                              DeleteCubit.get(context).chooseTask(newValue!);
                            },
                            items: DeleteCubit.get(context).taskId.map((valueItem) {
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

                                DeleteCubit.get(context).deleteTasks(tasksId: DeleteCubit.get(context).taskChoose);
                              },
                              child: const Text(
                                'Delete Task',
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
