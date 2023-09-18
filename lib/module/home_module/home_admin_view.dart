
import 'package:agile/shared/service/app_reouter.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

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
                padding: const EdgeInsets.only(top: 50.0),
                child: Column(
                  children: [
                    myDrawerList(happened: 'Add User' , icon:  Icons.add ,context: context),
                    myDrawerList(happened: 'Add Department' , icon:  Icons.house_siding_sharp ,context: context),
                    myDrawerList(happened: 'Update User' , icon:  Icons.update ,context: context),
                    myDrawerList(happened: 'Update Department' , icon:  Icons.receipt_long_outlined ,context: context),

                  ],
                ),
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

  Widget myDrawerList({required String happened ,required IconData icon , required BuildContext context }) {
    return Column(
      children: [
        menuItem(text: happened, icon: icon ,context: context),
      ],
    );
  }

  Widget menuItem({required String text,required IconData icon , required BuildContext context}) {

    return Material(
      child: InkWell(
        onTap: (){
          if(text == 'Add User') {
            GoRouter.of(context).push(AppRouter.kAddUser);
          }else if(text == 'Add Department'){
            GoRouter.of(context).push(AppRouter.kAddDepart);
          }else if(text == 'Update User'){
            GoRouter.of(context).push(AppRouter.kUpdateUser);
          }else if(text =='Update Department'){
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
                const SizedBox(width: 20,),
                Icon(
                  icon,
                  size: 20,
                  color: Colors.black,
                ),
                const SizedBox(width: 20,),
                Text(text),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
