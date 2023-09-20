import 'package:agile/module/home_module/home%20_cubit/home_admin_cubit.dart';
import 'package:agile/module/update_tasks_module/update_tasks_view.dart';
import 'package:agile/shared/service/app_reouter.dart';
import 'package:agile/shared/service/screen_size.dart';
import 'package:agile/shared/styles/colors.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {

  TabController? tabController;
  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    tabController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ScreenSize.init(context);
    return BlocProvider(
      create: (context) => HomeAdminCubit()..getTasks(),
      child: BlocConsumer<HomeAdminCubit, HomeAdminState>(
        listener: (context, state) {},
        builder: (context, state) {
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
              bottom: TabBar(
                controller: tabController,
                indicatorColor: Styles.kColor,
                labelColor: Styles.kColor,
                unselectedLabelColor: Color(0xff091E4A),
                tabs: [
                  Tab(text: 'Users', icon: Icon(Icons.person_outline)),
                  Tab(text: 'Tasks', icon: Icon(Icons.newspaper_outlined)),
                ],
              ),
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
            body: TabBarView(
              controller: tabController,
              children: [
                SafeArea(
                  child: SingleChildScrollView(
                    child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: ConditionalBuilder(
                          condition: state is GetTasksSuccessState,
                          builder: (BuildContext context) {
                            return ListView.separated(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemBuilder: (context, index) {
                                  return Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                          height:
                                              ScreenSize.screenHeight * 0.01),
                                      Text(
                                        "",
                                        style: const TextStyle(
                                            color: Color(0xff091E4A),
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20),
                                      ),
                                      SizedBox(
                                          height:
                                              ScreenSize.screenHeight * 0.01),
                                      SizedBox(
                                        width: ScreenSize.screenWidth,
                                        child: GridView.builder(
                                          shrinkWrap: true,
                                          physics:
                                              const NeverScrollableScrollPhysics(),
                                          gridDelegate:
                                              const SliverGridDelegateWithFixedCrossAxisCount(
                                            crossAxisCount: 2,
                                            mainAxisSpacing: 20,
                                            crossAxisSpacing: 30,
                                          ),
                                          itemBuilder: (BuildContext context,
                                              int index) {
                                            return Container(
                                              height:
                                                  ScreenSize.screenHeight * 0.2,
                                              width:
                                                  ScreenSize.screenWidth * 0.3,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                color: Colors.white70,
                                                border: Border.all(
                                                  color: Colors.grey,
                                                ),
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: Colors.grey
                                                        .withOpacity(0.5),
                                                    spreadRadius: 2,
                                                    blurRadius: 5,
                                                    offset: const Offset(0, 3),
                                                  ),
                                                ],
                                              ),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(15.0),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      '',
                                                      maxLines: 1,
                                                      style: const TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color:
                                                              Color(0xff091E4A),
                                                          fontSize: 16,
                                                          overflow: TextOverflow
                                                              .ellipsis),
                                                    ),
                                                    SizedBox(
                                                      height: ScreenSize
                                                              .screenHeight *
                                                          0.01,
                                                    ),
                                                    Container(
                                                      decoration: BoxDecoration(
                                                        color: const Color(
                                                                0xff5A55CA)
                                                            .withOpacity(0.1),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5),
                                                      ),
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(5.0),
                                                        child: Text(
                                                          '',
                                                          style:
                                                              const TextStyle(
                                                                  color: Styles
                                                                      .kColor,
                                                                  fontSize: 16),
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: ScreenSize
                                                              .screenHeight *
                                                          0.01,
                                                    ),
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      children: [
                                                        const Icon(
                                                          Icons.email_outlined,
                                                          color: Colors.grey,
                                                        ),
                                                        SizedBox(
                                                          width: ScreenSize
                                                                  .screenWidth *
                                                              0.005,
                                                        ),
                                                        SizedBox(
                                                          width: ScreenSize
                                                                  .screenWidth *
                                                              0.2,
                                                          child: Text(
                                                            '',
                                                            style: const TextStyle(
                                                                color: Color(
                                                                    0xff091E4A),
                                                                fontSize: 15,
                                                                overflow:
                                                                    TextOverflow
                                                                        .ellipsis),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    SizedBox(
                                                      height: ScreenSize
                                                              .screenHeight *
                                                          0.01,
                                                    ),
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      children: [
                                                        const Icon(
                                                          Icons.call_outlined,
                                                          color: Colors.grey,
                                                        ),
                                                        SizedBox(
                                                          width: ScreenSize
                                                                  .screenWidth *
                                                              0.005,
                                                        ),
                                                        SizedBox(
                                                          width: ScreenSize
                                                                  .screenWidth *
                                                              0.2,
                                                          child: Text(
                                                            '',
                                                            style: const TextStyle(
                                                                color: Color(
                                                                    0xff091E4A),
                                                                fontSize: 15,
                                                                overflow:
                                                                    TextOverflow
                                                                        .ellipsis),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            );
                                          },
                                          itemCount: 5,
                                        ),
                                      ),
                                      SizedBox(
                                          height:
                                              ScreenSize.screenHeight * 0.03),
                                    ],
                                  );
                                },
                                separatorBuilder: (context, index) {
                                  return const Divider(
                                    height: 1,
                                    color: Colors.grey,
                                  );
                                },
                                itemCount: 5);
                          },
                          fallback: (BuildContext context) {
                            return Center(
                              child: CircularProgressIndicator(),
                            );
                          },
                        )),
                  ),
                ),
                SafeArea(
                  child: SingleChildScrollView(
                    child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: ConditionalBuilder(
                          condition: state is GetTasksSuccessState,
                          builder: (BuildContext context) {
                            return GridView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                mainAxisSpacing: 20,
                                crossAxisSpacing: 30,
                              ),
                              itemBuilder: (BuildContext context, int index) {
                                return InkWell(
                                  onTap: () {
                                    AppRouter.taskId = '${HomeAdminCubit.get(context).getAllTasksModel!.data![index].id!}';
                                    AppRouter.taskName = '${HomeAdminCubit.get(context).getAllTasksModel!.data![index].name!}';
                                    AppRouter.taskStartDate = '${HomeAdminCubit.get(context).getAllTasksModel!.data![index].startDate!}';
                                    AppRouter.taskEndDate = '${HomeAdminCubit.get(context).getAllTasksModel!.data![index].endDate!}';
                                    AppRouter.taskDescription = '${HomeAdminCubit.get(context).getAllTasksModel!.data![index].description!}';
                                    AppRouter.taskCreatorName = '${HomeAdminCubit.get(context).getAllTasksModel!.data![index].creator!.name!}';
                                    GoRouter.of(context).push(AppRouter.kUpdateTasks);
                                  },
                                  child: Container(
                                    height: ScreenSize.screenHeight * 0.2,
                                    width: ScreenSize.screenWidth * 0.3,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.white70,
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
                                    child: Padding(
                                      padding: const EdgeInsets.all(15.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            HomeAdminCubit.get(context)
                                                .getAllTasksModel!
                                                .data![index]
                                                .creator!
                                                .name!,
                                            maxLines: 1,
                                            style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Color(0xff091E4A),
                                                fontSize: 16,
                                                overflow:
                                                    TextOverflow.ellipsis),
                                          ),
                                          SizedBox(
                                            height:
                                                ScreenSize.screenHeight * 0.01,
                                          ),
                                          Container(
                                            decoration: BoxDecoration(
                                              color: const Color(0xff5A55CA)
                                                  .withOpacity(0.1),
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                            ),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(5.0),
                                              child: Text(
                                                HomeAdminCubit.get(context)
                                                    .getAllTasksModel!
                                                    .data![index]
                                                    .status!,
                                                style: const TextStyle(
                                                    color: Styles.kColor,
                                                    fontSize: 16),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height:
                                                ScreenSize.screenHeight * 0.01,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              const Icon(
                                                Icons.email_outlined,
                                                color: Colors.grey,
                                              ),
                                              SizedBox(
                                                width: ScreenSize.screenWidth *
                                                    0.005,
                                              ),
                                              SizedBox(
                                                width: ScreenSize.screenWidth *
                                                    0.2,
                                                child: Text(
                                                  HomeAdminCubit.get(context)
                                                      .getAllTasksModel!
                                                      .data![index]
                                                      .creator!
                                                      .email!,
                                                  style: const TextStyle(
                                                      color: Color(0xff091E4A),
                                                      fontSize: 15,
                                                      overflow: TextOverflow
                                                          .ellipsis),
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height:
                                                ScreenSize.screenHeight * 0.01,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              const Icon(
                                                Icons.call_outlined,
                                                color: Colors.grey,
                                              ),
                                              SizedBox(
                                                width: ScreenSize.screenWidth *
                                                    0.005,
                                              ),
                                              SizedBox(
                                                width: ScreenSize.screenWidth *
                                                    0.2,
                                                child: Text(
                                                  '${HomeAdminCubit.get(context).getAllTasksModel!.data![index].creator!.phone!}',
                                                  style: const TextStyle(
                                                      color: Color(0xff091E4A),
                                                      fontSize: 15,
                                                      overflow: TextOverflow
                                                          .ellipsis),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              },
                              itemCount: HomeAdminCubit.get(context)
                                  .getAllTasksModel!
                                  .data!
                                  .length,
                            );
                          },
                          fallback: (BuildContext context) {
                            return Center(
                              child: CircularProgressIndicator(),
                            );
                          },
                        )),
                  ),
                ),
              ],
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
}
