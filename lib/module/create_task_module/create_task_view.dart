import 'package:agile/module/create_task_module/create_task_cubit/create_task_cubit.dart';
import 'package:agile/shared/component/custom_text_sec_login.dart';
import 'package:agile/shared/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class CreateTaskView extends StatelessWidget {
  CreateTaskView({super.key});

  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController employeeController = TextEditingController();
  var formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CreateTaskCubit()..getEmployee(),
      child: BlocConsumer<CreateTaskCubit, CreateTaskState>(
        listener: (context, state) {

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
                        header: 'Add New Task!',
                        para:
                            ' Create a new task now and assign it to employees right away.'),
                    Center(
                      child: SizedBox(
                        width: double.infinity,
                        height: MediaQuery.sizeOf(context).height * 0.33,
                        child: SfDateRangePicker(
                          selectionColor: Colors.purple,
                          todayHighlightColor: Colors.purple,
                          startRangeSelectionColor: Colors.purple,
                          endRangeSelectionColor: Colors.purple,
                          rangeSelectionColor: Colors.purple,
                          onSelectionChanged: (date) {
                            CreateTaskCubit.get(context).startDate = date.value.startDate;
                            CreateTaskCubit.get(context).endDate = date.value.endDate;
                          },
                          onCancel: () {},
                          selectionMode:
                              DateRangePickerSelectionMode.extendableRange,
                        ),
                      ),
                    ),
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 20.0, right: 20.0, bottom: 30),
                          child: TextFormField(
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'please enter Title';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                                enabledBorder: buildOutlineInputBorder(),
                                focusedBorder: buildOutlineInputBorder(),
                                hintText: 'Title'),
                            keyboardType: TextInputType.text,
                            controller: titleController,
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
                            maxLines: 5,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'please enter Description';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                                enabledBorder: buildOutlineInputBorder(),
                                focusedBorder: buildOutlineInputBorder(),
                                hintText: 'Description'),
                            keyboardType: TextInputType.text,
                            controller: descriptionController,
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
                          hint: const Text('Assigned Employee'),
                          isExpanded: true,
                          value: CreateTaskCubit.get(context).valueChoose,
                          onChanged: (newValue) {
                            CreateTaskCubit.get(context).valueChoose =
                                newValue!;
                          },
                          items: CreateTaskCubit.get(context)
                              .employeeId
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
                              if(CreateTaskCubit.get(context).startDate == null || CreateTaskCubit.get(context).endDate ==null){
                              }
                              else if (formkey.currentState!.validate()) {

                                CreateTaskCubit.get(context).createTask(
                                    title: titleController.text,
                                    description: descriptionController.text,
                                    employeeId: CreateTaskCubit.get(context).valueChoose,
                                    startDate: DateFormat('yyyy/MM/d').format(CreateTaskCubit.get(context).startDate!),
                                    endDate: DateFormat('yyyy/MM/d').format(CreateTaskCubit.get(context).endDate!));
                              }
                            },
                            child: const Text(
                              'Create',
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

  buildOutlineInputBorder() {
    return OutlineInputBorder(
        borderSide: const BorderSide(color: Styles.kColor),
        borderRadius: BorderRadius.circular(6));
  }
}
