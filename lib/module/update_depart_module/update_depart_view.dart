import 'package:agile/shared/component/custom_text_sec_login.dart';
import 'package:agile/shared/styles/colors.dart';
import 'package:flutter/material.dart';




class UpdateDepartmentView extends StatelessWidget {
  UpdateDepartmentView({super.key});
  final TextEditingController nameController = TextEditingController();
  final TextEditingController numDepartController = TextEditingController();
  var formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF3FAF9),
      appBar:AppBar(
          backgroundColor: const Color(0xffF3FAF9),
          elevation: 0,
          leading: IconButton(
              onPressed: (){
                Navigator.pop(context);
              },
              icon:const Icon(Icons.arrow_back_ios, color: Colors.black,)
          )
      ),
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
                          validator: (value){
                            if(value!.isEmpty){
                              return 'please enter name';
                            }
                            return null ;
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
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 20.0, right: 20.0, bottom: 30),
                        child: TextFormField(
                          validator: (value){
                            if(value!.isEmpty){
                              return 'please enter Assigned Manager';
                            }
                            return null ;
                          },
                          decoration: InputDecoration(
                              enabledBorder: buildOutlineInputBorder(),
                              focusedBorder: buildOutlineInputBorder(),
                              hintText: 'Assigned Manager'),
                          keyboardType: TextInputType.emailAddress,
                          controller: numDepartController,
                        ),
                      )
                    ],
                  ),




                  ButtonAndCheckboxSec(
                    name: nameController.text,
                    numDepart: numDepartController.text,


                  )
                ],
              ),
            )),
      ),
    );
  }
}
buildOutlineInputBorder() {
  return OutlineInputBorder(
      borderSide: const BorderSide(color: Styles.kColor),
      borderRadius: BorderRadius.circular(6));
}

class ButtonAndCheckboxSec extends StatelessWidget {
  const ButtonAndCheckboxSec(
      {super.key,
        required this.name,
        required this.numDepart
      });

  final String name;
  final String numDepart;


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: MediaQuery.of(context).size.width * 0.9,
          height: 48,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              color: const Color(0xff5A55CA)),
          child: MaterialButton(
            onPressed: () {

            },
            child: const Text(
              'Update',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }
}
