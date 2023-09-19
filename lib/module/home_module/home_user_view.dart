
import 'package:agile/shared/service/secure.dart';
import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
class HomeUserView extends StatefulWidget {
  const HomeUserView({super.key});

  @override
  State<HomeUserView> createState() => _HomeUserViewState();
}

class _HomeUserViewState extends State<HomeUserView> {
  late DateTime _selectedDate;

  @override
  void initState() {
    super.initState();
    _resetSelectedDate();
  }

  void _resetSelectedDate() {
    _selectedDate = DateTime.now().add(const Duration(days: 2));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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

      body: Column(
        children: [
          CalendarTimeline(
            showYears: true,
            initialDate: _selectedDate,
            firstDate: DateTime.now(),
            lastDate: DateTime.now().add(const Duration(days: 365 * 4)),
            onDateSelected: (date) => setState(() => _selectedDate = date),
            leftMargin: 20,
            monthColor: const Color(0xff091E4A),
            dayColor: const Color(0xff091E4A),
            dayNameColor: Colors.white,
            activeDayColor: Colors.white,
            activeBackgroundDayColor: Colors.purple,
            dotsColor: Colors.white,
            locale: 'en',
          ),
          Expanded(

            child: ListView.builder(
              
              itemCount: 10,
                itemBuilder: (context, index)=>cardOfData(context)
            ),
          ),
        ],
      ),
    );
  }

  void fun() async {
    print(await Secure().secureGetData(key: 'token'));
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

  Widget cardOfData(context){
    return Container(
      decoration: const BoxDecoration(
          boxShadow:[

          ]
      ),
      child:  Padding(
        padding: const EdgeInsets.only(top: 20.0,left: 20 ,right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
                height: MediaQuery.of(context).size.height * 0.2,
                width: double.infinity,

                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(18)
                ),
                child:Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('New',style: TextStyle(fontSize: 18,color: Colors.purple),),
                      const SizedBox(height: 7,),
                      Container(
                        width: double.infinity,
                        height: 1,
                        color: Colors.grey[300],
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: Container(
                              width: 4,
                              height: 60
                              ,
                              color: Colors.purple,
                            ),
                          ),
                          const SizedBox(
                            height:60 ,
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(child: Text(
                                    'Create a High-Intensity Interval...',
                                    maxLines: 1,
                                    style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),)),
                                  Spacer(),
                                  Text('Create a High-Intensity Interval...',
                                    maxLines: 1,
                                    style: TextStyle(fontSize: 12),),

                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                      const Spacer(),
                      const Row(
                        children: [
                          Icon(Icons.watch_later_outlined),
                          SizedBox(width: 5,),
                          Text('Start'),
                          SizedBox(width: 3,),
                          Text('25/10/2000'),
                          SizedBox(width: 2,),
                          Text('-'),
                          SizedBox(width: 3,),
                          Text('end'),
                          SizedBox(width: 3,),
                          Text('25/10/2000'),
                        ],
                      )
                    ],
                  ),
                )
            )
          ],
        ),
      ),
    );
  }
}
