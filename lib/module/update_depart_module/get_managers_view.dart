import 'package:agile/module/update_depart_module/update_depart_cubit/update_depart_cubit.dart';
import 'package:agile/module/update_depart_module/update_depart_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class GetManagersView extends StatelessWidget {
   GetManagersView({super.key ,});
   List<String>? managers;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UpdateDepartCubit()..getManagers(),
      child: BlocConsumer<UpdateDepartCubit, UpdateDepartState>(
        listener: (context, state) {
        if(state is GetDepartmentSuccessState){
          UpdateDepartCubit.get(context).listAllManagers();
          managers= UpdateDepartCubit.get(context).managersId;

        }
        },
        builder: (context, state) {
          return Scaffold(
            body: SafeArea(
              child: Column(
                children: [
                  Column(
                    children: [
                      TextButton(
                          onPressed: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context){
                              return UpdateDepartmentView(managers:managers ,);
                            }));
                      }, child: const Text('press to det depart'))
                    ],
                  ),

                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
