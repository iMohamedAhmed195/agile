import 'package:agile/shared/service/app_reouter.dart';
import 'package:agile/shared/service/screen_size.dart';
import 'package:agile/shared/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'update_tasks_cubit/update_tasks_cubit.dart';

class UpdateTasksView extends StatelessWidget {
  UpdateTasksView(
      {super.key,
      required this.taskId,
      required this.taskName,
      required this.taskStartDate,
      required this.taskEndDate,
      required this.taskDescription,
      required this.taskCreatorName});

  var titleController = TextEditingController();
  var descriptionController = TextEditingController();
  var formkey = GlobalKey<FormState>();
  String? taskId;
  String? taskName;
  String? taskStartDate;
  String? taskEndDate;
  String? taskDescription;
  String? taskCreatorName;
  String? name;

  @override
  Widget build(BuildContext context) {
    ScreenSize.init(context);
    return BlocProvider(
      create: (context) => UpdateTasksCubit()
        ..getDepart()
        ..getUsers(),
      child: BlocConsumer<UpdateTasksCubit, UpdateTasksState>(
        listener: (context, state) {
          if(state is GetTasksSuccessState){
          }
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
                padding: const EdgeInsets.only(top: 50.0),
                child: Column(
                  children: [
                    myDrawerList(
                        happened: 'Add User',
                        icon: Icons.add,
                        context: context),
                    myDrawerList(
                        happened: 'Add Department',
                        icon: Icons.house_siding_sharp,
                        context: context),
                    myDrawerList(
                        happened: 'Update User',
                        icon: Icons.update,
                        context: context),
                    myDrawerList(
                        happened: 'Update Department',
                        icon: Icons.receipt_long_outlined,
                        context: context),
                  ],
                ),
              )
            ],
          ),
          ),
          ),
            body: SingleChildScrollView(
              child: Form(
                key:formkey,
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
                                        hintText: taskName),
                                    onTap: () {
                                      UpdateTasksCubit.get(context)
                                          .changeTitleInTask(true);
                                    },
                                    keyboardType: TextInputType.text,
                                    controller: titleController,
                                    readOnly:
                                        UpdateTasksCubit.get(context).readOnly,
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
                    GestureDetector(
                      onTap: () {
                        print('hi');
                        // UpdateTasksCubit.get(context).getImageProfileFromGallery();
                      },
                      child: Padding(
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
                                          enabledBorder:
                                              buildOutlineInputBorder(),
                                          focusedBorder:
                                              buildOutlineInputBorder(),
                                          hintText:
                                              'Assigned by ${taskCreatorName}'),
                                      keyboardType: TextInputType.text,
                                      readOnly: true,
                                      maxLines: 2),
                                )
                              ],
                            ),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Expanded(
                              child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  UpdateTasksCubit.get(context)
                                      .selectStartDate(context);
                                },
                                child: Container(
                                  width: MediaQuery.sizeOf(context).width * 0.5,
                                  height:
                                      MediaQuery.sizeOf(context).height * 0.052,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      border: Border.all(
                                          color: Colors.grey, width: 2)),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 8.0, vertical: 2),
                                        child: UpdateTasksCubit.get(context)
                                                    .splitStartDate !=
                                                null
                                            ? Text(
                                                'Start : ${UpdateTasksCubit.get(context).splitStartDate}')
                                            : const Text('Picked Start Date'),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              GestureDetector(
                                onTap: () {
                                  UpdateTasksCubit.get(context)
                                      .selectEndDate(context);
                                },
                                child: Container(
                                  width: MediaQuery.sizeOf(context).width * 0.5,
                                  height:
                                      MediaQuery.sizeOf(context).height * 0.052,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      border: Border.all(
                                          color: Colors.grey, width: 2)),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 8.0, vertical: 2),
                                        child: UpdateTasksCubit.get(context)
                                                    .splitEndDate !=
                                                null
                                            ? Text(
                                                'end : ${UpdateTasksCubit.get(context).splitEndDate}')
                                            : const Text('Picked End Date'),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          )),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 20.0, right: 20.0, bottom: 20),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: ScreenSize.screenWidth * 0.4,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.white,
                                  border: Border.all(
                                    color: Colors.grey,
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.5),
                                      spreadRadius: 2,
                                      blurRadius: 5,
                                      offset: const Offset(0, 3),
                                    ),
                                  ],
                                ),
                                child: RadioListTile(
                                  title: Text(
                                    'NEW',
                                    style: TextStyle(
                                        color: Colors.grey[800],
                                        fontWeight: FontWeight.w700,
                                        fontSize: 14),
                                  ),
                                  value: 'NEW',
                                  contentPadding: EdgeInsets.zero,
                                  groupValue:
                                      UpdateTasksCubit.get(context).selectValue,
                                  onChanged: (value) {
                                    UpdateTasksCubit.get(context)
                                        .changeRadio(value!);
                                  },
                                  activeColor: Styles.kColor,
                                ),
                              ),
                              SizedBox(width: ScreenSize.screenWidth * 0.01),
                              Container(
                                width: ScreenSize.screenWidth * 0.4,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.white,
                                  border: Border.all(
                                    color: Colors.grey,
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.5),
                                      spreadRadius: 2,
                                      blurRadius: 5,
                                      offset: const Offset(0, 3),
                                    ),
                                  ],
                                ),
                                child: RadioListTile(
                                  title: Text(
                                    'PROCESSING',
                                    style: TextStyle(
                                        color: Colors.grey[800],
                                        fontWeight: FontWeight.w700,
                                        fontSize: 13),
                                  ),
                                  contentPadding: EdgeInsets.zero,
                                  value: 'PROCESSING',
                                  groupValue:
                                      UpdateTasksCubit.get(context).selectValue,
                                  onChanged: (value) {
                                    UpdateTasksCubit.get(context)
                                        .changeRadio(value!);
                                  },
                                  activeColor: Styles.kColor,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: ScreenSize.screenHeight * 0.02,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: ScreenSize.screenWidth * 0.4,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.white,
                                  border: Border.all(
                                    color: Colors.grey,
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.5),
                                      spreadRadius: 2,
                                      blurRadius: 5,
                                      offset: const Offset(0, 3),
                                    ),
                                  ],
                                ),
                                child: RadioListTile(
                                  title: Text(
                                    'CANCELLED',
                                    style: TextStyle(
                                        color: Colors.grey[800],
                                        fontWeight: FontWeight.w700,
                                        fontSize: 14),
                                  ),
                                  value: 'CANCELLED',
                                  contentPadding: EdgeInsets.zero,
                                  groupValue:
                                      UpdateTasksCubit.get(context).selectValue,
                                  onChanged: (value) {
                                    UpdateTasksCubit.get(context)
                                        .changeRadio(value!);
                                  },
                                  activeColor: Styles.kColor,
                                ),
                              ),
                              SizedBox(width: ScreenSize.screenWidth * 0.01),
                              Container(
                                width: ScreenSize.screenWidth * 0.4,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.white,
                                  border: Border.all(
                                    color: Colors.grey,
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.5),
                                      spreadRadius: 2,
                                      blurRadius: 5,
                                      offset: const Offset(0, 3),
                                    ),
                                  ],
                                ),
                                child: RadioListTile(
                                  title: Text(
                                    'COMPLETED',
                                    style: TextStyle(
                                        color: Colors.grey[800],
                                        fontWeight: FontWeight.w700,
                                        fontSize: 14),
                                  ),
                                  contentPadding: EdgeInsets.zero,
                                  value: 'COMPLETED',
                                  groupValue:
                                      UpdateTasksCubit.get(context).selectValue,
                                  onChanged: (value) {
                                    UpdateTasksCubit.get(context)
                                        .changeRadio(value!);
                                  },
                                  activeColor: Styles.kColor,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: ScreenSize.screenHeight * 0.02,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: ScreenSize.screenWidth * 0.4,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.white,
                                  border: Border.all(
                                    color: Colors.grey,
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.5),
                                      spreadRadius: 2,
                                      blurRadius: 5,
                                      offset: const Offset(0, 3),
                                    ),
                                  ],
                                ),
                                child: RadioListTile(
                                  title: Text(
                                    'NOT COMPLETED',
                                    style: TextStyle(
                                        color: Colors.grey[800],
                                        fontWeight: FontWeight.w700,
                                        fontSize: 14),
                                  ),
                                  value: 'NOT COMPLETED',
                                  contentPadding: EdgeInsets.zero,
                                  groupValue:
                                      UpdateTasksCubit.get(context).selectValue,
                                  onChanged: (value) {
                                    UpdateTasksCubit.get(context)
                                        .changeRadio(value!);
                                  },
                                  activeColor: Styles.kColor,
                                ),
                              ),
                              SizedBox(width: ScreenSize.screenWidth * 0.01),
                              Container(
                                width: ScreenSize.screenWidth * 0.4,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.white,
                                  border: Border.all(
                                    color: Colors.grey,
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.5),
                                      spreadRadius: 2,
                                      blurRadius: 5,
                                      offset: const Offset(0, 3),
                                    ),
                                  ],
                                ),
                                child: RadioListTile(
                                  title: Text(
                                    'EXPIRED',
                                    style: TextStyle(
                                        color: Colors.grey[800],
                                        fontWeight: FontWeight.w700,
                                        fontSize: 14),
                                  ),
                                  contentPadding: EdgeInsets.zero,
                                  value: 'EXPIRED',
                                  groupValue:
                                      UpdateTasksCubit.get(context).selectValue,
                                  onChanged: (value) {
                                    UpdateTasksCubit.get(context)
                                        .changeRadio(value!);
                                  },
                                  activeColor: Styles.kColor,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: ScreenSize.screenHeight * 0.01,
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
                          const SizedBox(
                            height: 10,
                          ),
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
                                        hintText: taskDescription),
                                    onTap: () {
                                      UpdateTasksCubit.get(context)
                                          .changeTitleInTask(true);
                                    },
                                    keyboardType: TextInputType.text,
                                    controller: descriptionController,
                                    readOnly:
                                        UpdateTasksCubit.get(context).readOnly,
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
                          items: UpdateTasksCubit.get(context)
                              .userId
                              .map((valueItem) {
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
                          hint: const Text(
                            'Assigned Department',
                            style: TextStyle(color: Colors.black),
                          ),
                          isExpanded: true,
                          value: UpdateTasksCubit.get(context).departChoose,
                          onChanged: (newValue) {
                            UpdateTasksCubit.get(context).chooseDepart(newValue!);
                          },
                          items: UpdateTasksCubit.get(context)
                              .departId
                              .map((valueItem) {
                            return DropdownMenuItem<String>(
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
                              print(titleController.text);
                              print(descriptionController.text);
                              print(UpdateTasksCubit.get(context).departChoose);
                              print(taskId!);
                              print(UpdateTasksCubit.get(context).userChoose);
                              print(UpdateTasksCubit.get(context)
                                  .splitStartDate);
                              print(taskStartDate!);
                              print(UpdateTasksCubit.get(context)
                                  .splitEndDate);
                              print(taskEndDate!);
                              UpdateTasksCubit.get(context).updateUser(
                                  name: titleController.text,
                                  description: descriptionController.text,
                                  departId: UpdateTasksCubit.get(context)
                                      .departChoose,
                                  taskId: taskId!,
                                  userId:
                                  UpdateTasksCubit.get(context).userChoose,
                                  startDate: UpdateTasksCubit.get(context)
                                      .splitStartDate ??
                                      taskStartDate!,
                                  endDate: UpdateTasksCubit.get(context)
                                      .splitEndDate ??
                                      taskEndDate!);
                            },
                            child: const Text(
                              'Update',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget myDrawerList(
      {required String happened,
        required IconData icon,
        required BuildContext context}) {
    return Column(
      children: [
        menuItem(text: happened, icon: icon, context: context),
      ],
    );
  }

  Widget menuItem(
      {required String text,
        required IconData icon,
        required BuildContext context}) {
    return Material(
      child: InkWell(
        onTap: () {
          if (text == 'Add User') {
            GoRouter.of(context).push(AppRouter.kAddUser);
          } else if (text == 'Add Department') {
            GoRouter.of(context).push(AppRouter.kAddDepart);
          } else if (text == 'Update User') {
            GoRouter.of(context).push(AppRouter.kUpdateUser);
          } else if (text == 'Update Department') {
            GoRouter.of(context).push(AppRouter.kUpdateDepart);
          }
        },
        child: Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Container(
            height: 50,
            color: const Color(0xffF3FAF9),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(
                  width: 20,
                ),
                Icon(
                  icon,
                  size: 20,
                  color: Colors.black,
                ),
                const SizedBox(
                  width: 20,
                ),
                Text(text),
              ],
            ),
          ),
        ),
      ),
    );
  }

  buildOutlineInputBorder() {
    return OutlineInputBorder(
        borderSide: const BorderSide(color: Styles.kColor),
        borderRadius: BorderRadius.circular(6));
  }
}
