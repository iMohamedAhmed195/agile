
import 'package:agile/module/add_user_module/add_user_view.dart';
import 'package:agile/shared/service/app_reouter.dart';
import 'package:agile/shared/service/secure.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';


class HomeView extends StatelessWidget {
   HomeView({super.key});
  @override
  Widget build(BuildContext context) {

    return  Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          IconButton(onPressed: (){
            fun();
            // Navigator.push(context, MaterialPageRoute(builder: (context)=>AddUserView()));
          }, icon: Icon(
              Icons.add
          ))
        ],
      ),

    );
  }
 void fun()async{
   print(await Secure().secureGetData(key: 'token'));
 }
}
