import 'package:agile/shared/component/custom_text_sec_login.dart';
import 'package:agile/shared/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class UpdateUserDetailsView extends StatelessWidget {
  UpdateUserDetailsView({super.key});

  int value = 0 ;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController departNameController = TextEditingController();
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
              icon:const Icon(Icons.arrow_back_ios , color: Colors.black,)
          )
      ),
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
                  // CustomTextField(
                  //   hint: 'Name',
                  //   controller: nameController,
                  // ),
                  // CustomTextField(
                  //   hint: 'email',
                  //   controller: emailController,
                  // ),
                  // CustomTextField(
                  //   hint: 'phone',
                  //   controller: phoneController,
                  // ),
                  // CustomTextField(
                  //   hint: 'password',
                  //   controller: passwordController,
                  // ),
                  // CustomTextField(
                  //   hint: 'Department Name',
                  //   controller: departNameController,
                  // ),
                  Row(
                    children: [
                      Expanded(
                          child: RadioListTile(
                            value: 1,
                            groupValue: value,
                            onChanged: (value) {},
                            title:  Text("admin",style: TextStyle(fontSize: 12.sp),),
                          )),
                      Expanded(
                        child: RadioListTile(
                          value: 2,
                          groupValue: value,
                          onChanged: (value) {},
                          title:  Text('Manager',style: TextStyle(fontSize: 12.sp)),
                        ),
                      ),
                      Expanded(
                        child: RadioListTile(
                          value: 3,
                          groupValue: value,
                          onChanged: (value) {},
                          title:  Text('User',style: TextStyle(fontSize: 12.sp)),
                        ),
                      ),
                    ],
                  ),
                  ButtonAndCheckboxSec(
                    name: nameController.text,
                    phone: phoneController.text,
                    email: emailController.text,
                    password: passwordController.text,
                    departName: departNameController.text,
                  )
                ],
              ),
            )),
      ),
    );
  }

  buildOutlineInputBorder() {
    return OutlineInputBorder(
        borderSide: const BorderSide(color: Styles.kColor),
        borderRadius: BorderRadius.circular(6));
  }
}

class ButtonAndCheckboxSec extends StatelessWidget {
  const ButtonAndCheckboxSec(
      {super.key,
        required this.email,
        required this.password,
        required this.name,
        required this.phone,
        required this.departName});

  final String email;
  final String password;
  final String name;
  final String phone;
  final String departName;

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
            onPressed: () {},
            child: const Text(
              'Create',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }
}
