
import 'package:flutter/material.dart';

class HomeAdminView extends StatelessWidget {
  const HomeAdminView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF3FAF9),
      appBar: AppBar(
        backgroundColor: const Color(0xffF3FAF9),
        elevation: 0,
        title: const Column(
          mainAxisAlignment: MainAxisAlignment.start,
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
          const SizedBox(
            width: 60,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.purple,
                  borderRadius: BorderRadius.circular(12)),
              width: 40,
              child: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.add,
                    size: 25,
                  )),
            ),
          )
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
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Row(
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.person,
                      color: Colors.purple,
                      size: 24,
                    ),
                    SizedBox(
                      width: 3,
                    ),
                    Text(
                      'User',
                      style: TextStyle(
                          fontSize: 15,
                          color: Colors.purple,
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
                SizedBox(
                  width: 20,
                ),
                Row(
                  children: [
                    Icon(Icons.menu_book),
                    SizedBox(
                      width: 5,
                    ),
                    Text('Tasks',
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w600)),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 2,
            ),
            Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: 1,
                  color: Colors.grey[300],
                ),
                Container(
                  width: 70,
                  height: 2,
                  color: Colors.purple,
                ),
              ],
            ),
            Expanded(
              child: GridView.builder(
                  shrinkWrap: true,
                  padding: EdgeInsets.zero,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisSpacing: 20,
                      crossAxisSpacing:20,
                      crossAxisCount: 2,
                    childAspectRatio: 2/1.7

                  ),
                  itemBuilder: (context , index){
                    return  Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.white,
                        ),
                        height: 20,
                        width: 50,

                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 15.0, horizontal: 8),
                              child: Container(
                                width: 3,
                                height: double.infinity,
                                color: Colors.purple,
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Padding(
                                  padding: EdgeInsets.only(top: 20.0,bottom: 10),
                                  child: Text('Employee'),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(6),
                                    color: Colors.purple.shade50,
                                  ),
                                  width: 60,
                                  height: 20,
                                  child: const Padding(
                                    padding: EdgeInsets.all(2.0),
                                    child: Text(
                                      'ADMIN',
                                      style: TextStyle(color: Color(0xff5A55CA)),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                const Row(
                                  children: [
                                    Icon(
                                      Icons.email,
                                      size: 17,
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text('user email'),
                                  ],
                                ),
                                const Row(
                                  children: [
                                    Icon(Icons.phone, size: 17),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text('user phone'),
                                  ],
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                itemCount: 5,
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
