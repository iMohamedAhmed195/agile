import 'package:agile/shared/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'update_tasks_cubit/update_tasks_cubit.dart';

class UpdateTasksView extends StatelessWidget {
  UpdateTasksView({super.key});


  var titleController = TextEditingController();
  var formkey = GlobalKey<FormState>();
  List listo = ['mido','a7a','shit','kaka','fefe','asdasdasd'];
  final int value = 0;
  @override
  Widget build(BuildContext context) {

    return BlocProvider(
      create: (context) => UpdateTasksCubit()..getUsers()..getDepart(),
      child: BlocConsumer<UpdateTasksCubit, UpdateTasksState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          return Scaffold(
            backgroundColor: const Color(0xffF3FAF9),
            appBar: AppBar(
              backgroundColor: const Color(0xffF3FAF9),
              elevation: 0,
              title: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "today",
                    style: TextStyle(color: Colors.black),
                  ),
                  Text("25/10/2000",
                      style: TextStyle(color: Colors.black, fontSize: 9))
                ],
              ),
              actions: [
                CircularPercentIndicator(
                  radius: 25,
                  lineWidth: 8,
                  percent: 0.4,
                  progressColor: Colors.pink,
                  backgroundColor: Colors.pink.shade100,
                  center: const Text('40%'),
                ),
                const SizedBox(
                  width: 20,
                ),
                CircularPercentIndicator(
                  radius: 25,
                  lineWidth: 8,
                  percent: 0.4,
                  progressColor: Colors.purple,
                  backgroundColor: Colors.purple.shade100,
                  center: const Text('40%'),
                ),
                const SizedBox(
                  width: 20,
                ),
                CircularPercentIndicator(
                  radius: 25,
                  lineWidth: 8,
                  percent: 0.4,
                  progressColor: Colors.green,
                  backgroundColor: Colors.green.shade100,
                  center: const Text('40%'),
                ),
                const SizedBox(
                  width: 30,
                ),
              ],
            ),
            drawer: Drawer(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 30.0),
                      child: myDrawerList(),
                    )
                  ],
                ),
              ),
            ),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(bottom: 15),
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
                                      hintText:
                                          'Create a High-Intensity Interval Training (HIIT) Workout Routinetap to edit'),
                                  onTap: () {
                                    UpdateTasksCubit.get(context).changeTitleInTask(true);
                                  },
                                  keyboardType: TextInputType.text,
                                  controller: titleController,
                                  readOnly: UpdateTasksCubit.get(context).readOnly,
                                  maxLines: 2),
                            )
                          ],
                        ),
                        const Text(
                          'tap to edit title',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w700,
                            color: Color(0xff091E4A),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Container(
                      color: Colors.grey[200],
                      width: double.infinity,
                      height: MediaQuery.sizeOf(context).height * 0.33,
                      child: const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Add Photo',
                            style: TextStyle(
                                fontSize: 24, fontWeight: FontWeight.w700),
                          ),
                        ],
                      ),
                    ),
                  ),
                   Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(bottom: 15),
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
                                        hintText: 'Assigned by Creator name'),
                                    keyboardType: TextInputType.text,

                                    readOnly: true,
                                    maxLines: 2),
                              )
                            ],
                          ),
                        ),
                          const SizedBox(width: 20,),
                        Expanded(
                            child:GestureDetector(
                              onTap: (){
                               _selectDate(context) ;
                              },
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                    width:MediaQuery.sizeOf(context).width * 0.5,
                                    height: MediaQuery.sizeOf(context).height * 0.104,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      border: Border.all(color: Colors.grey , width: 2)
                                    ),
                                    child: const Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.symmetric(horizontal: 8.0,vertical: 2),
                                          child: Text('Start : 16/5/2000'),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.symmetric(horizontal: 8.0,vertical: 2),
                                          child: Text('end : 16/5/2000'),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            )
                        ),

                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: RadioListTile(
                          value: 'new',
                          groupValue: value,
                          onChanged: (value) {},
                          title: const Text(
                            "NEW",
                            style: TextStyle(fontSize: 12),
                          ),
                        ),
                      ),
                      Expanded(
                        child: RadioListTile(
                          value: 'PROCESSING',
                          groupValue: value,
                          onChanged: (value) {},
                          title: const Text('PROCESSING',
                              style: TextStyle(fontSize: 12)),
                        ),
                      ),
                      Expanded(
                        child: RadioListTile(
                          value: 'CANCELLED',
                          groupValue: value,
                          onChanged: (value) {},
                          title: const Text('CANCELLED',
                              style: TextStyle(fontSize: 12)),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: RadioListTile(
                          value: 'COMPLETED',
                          groupValue: value,
                          onChanged: (value) {},
                          title: const Text(
                            "COMPLETED",
                            style: TextStyle(fontSize: 11),
                          ),
                        ),
                      ),
                      Expanded(
                        child: RadioListTile(
                          value: 'NOT COMPLETED',
                          groupValue: value,
                          onChanged: (value) {},
                          title: const Text('NOT COMPLETED',
                              style: TextStyle(fontSize: 12)),
                        ),
                      ),
                      Expanded(
                        child: RadioListTile(
                          value: 'EXPIRED',
                          groupValue: value,
                          onChanged: (value) {},
                          title: const Text('EXPIRED',
                              style: TextStyle(fontSize: 8)),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        const Row(
                          children: [
                            Text(
                              'Description',
                              style: TextStyle(fontSize: 20),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Text('tap to edit'),
                          ],
                        ),
                        const SizedBox(height: 10,),
                        Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(bottom: 15),
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
                                      hintText:
                                      'Design a 20-minute HIIT workout routine that includes a warm-up, alternating periods of intense exercise and rest, and a cool-down. Specify the exercises, durations, and intensity levels for each interval.'),
                                  onTap: () {
                                    UpdateTasksCubit.get(context).changeTitleInTask(true);
                                  },
                                  keyboardType: TextInputType.text,
                                  controller: titleController,
                                  readOnly: UpdateTasksCubit.get(context).readOnly,
                                  maxLines: 5),
                            )
                          ],
                        ),
                      ],
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
                        value: UpdateTasksCubit.get(context).userChoose,
                        onChanged: (newValue) {
                          UpdateTasksCubit.get(context).chooseUser(newValue!);
                        },
                        items:
                        UpdateTasksCubit.get(context).userId.map((valueItem) {
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
                        value: UpdateTasksCubit.get(context).departChoose,
                        onChanged: (newValue) {
                          UpdateTasksCubit.get(context).chooseDepart(newValue!);

                        },
                        items:
                        UpdateTasksCubit.get(context).departId.map((valueItem) {
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
                             if (formkey.currentState!.validate()) {

                            }
                          },
                          child: const Text(
                            'Update',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 50,),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget myDrawerList() {
    return Padding(
      padding: const EdgeInsets.only(top: 15),
      child: Column(
        children: [
          menuItem(text: 'Add User', icon: Icons.add),
        ],
      ),
    );
  }

  Widget menuItem({String? text, IconData? icon}) {
    return Material(
      child: InkWell(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Container(
            height: 50,
            color: const Color(0xffF3FAF9),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                    child: Icon(
                  icon!,
                  size: 20,
                  color: Colors.black,
                )),
                Expanded(
                  child: Text(text!),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _selectDate(context)async{
    showDatePicker(
      context:context,
      initialDate: DateTime.now(),
        firstDate: DateTime(2000),
        lastDate: DateTime(2025)
    );
  }

  buildOutlineInputBorder() {
    return OutlineInputBorder(
        borderSide: const BorderSide(color: Styles.kColor),
        borderRadius: BorderRadius.circular(6));
  }
}
