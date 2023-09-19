import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class UpdateTasksView extends StatelessWidget {
  const UpdateTasksView({super.key});

  final String value = '0';
  @override
  Widget build(BuildContext context) {
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
            const Padding(
              padding: EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Create a High-Intensity Interval Training (HIIT) Workout Routinetap to edit',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: Color(0xff091E4A),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'tap to edit',
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
              padding: const EdgeInsets.all(20.0),
              child: Container(
                color: Colors.grey[200],
                width: double.infinity,
                height: MediaQuery.sizeOf(context).height * 0.33,
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Add Photo',
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
                    ),
                  ],
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(20.0),
              child: Row(
                children: [
                  Column(
                    children: [
                      Text(
                        'Assigned by',
                        style: TextStyle(fontSize: 14),
                      ),
                      Text(
                        'Creator name',
                        style: TextStyle(
                            fontWeight: FontWeight.w700, fontSize: 18),
                      ),
                    ],
                  ),
                  Spacer(),
                  Column(
                    children: [
                      Text(
                        'Due date',
                        style: TextStyle(fontSize: 14),
                      ),
                      Text(
                        '16 September',
                        style: TextStyle(
                            fontWeight: FontWeight.w700, fontSize: 18),
                      ),
                    ],
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
                    title:
                        const Text('CANCELLED', style: TextStyle(fontSize: 12)),
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
                    title: const Text('EXPIRED', style: TextStyle(fontSize: 8)),
                  ),
                ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Row(
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
                  Text(
                      'Design a 20-minute HIIT workout routine that includes a warm-up, alternating periods of intense exercise and rest, and a cool-down. Specify the exercises, durations, and intensity levels for each interval.'),
                ],
              ),
            )
          ],
        ),
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
}
