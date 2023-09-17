import 'package:agile/shared/component/custom_text_sec_login.dart';
import 'package:agile/shared/styles/colors.dart';
import 'package:flutter/material.dart';




class AddDepartmentView extends StatelessWidget {
   AddDepartmentView({super.key});
  final TextEditingController nameController = TextEditingController();
  var formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
      return Scaffold(
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
                            },
                            decoration: InputDecoration(
                                enabledBorder: buildOutlineInputBorder(),
                                focusedBorder: buildOutlineInputBorder(),
                                hintText: 'Name'),
                            obscureText: true,
                            keyboardType: TextInputType.visiblePassword,
                            controller: nameController,
                          ),
                        )
                      ],
                    ),


                    ButtonAndCheckboxSec(
                      name: nameController.text,

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
        });

  final String name;


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
