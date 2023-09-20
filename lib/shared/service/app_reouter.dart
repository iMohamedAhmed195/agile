import 'package:agile/module/add_department_module/add_depart_view.dart';
import 'package:agile/module/create_task_module/create_task_view.dart';
import 'package:agile/module/home_module/home_admin_view.dart';

import 'package:agile/module/login_module/login_view.dart';
import 'package:agile/module/splash_view_module/splash_view.dart';
import 'package:agile/module/update_depart_module/update_depart_view.dart';
import 'package:agile/module/update_tasks_module/update_tasks_view.dart';
import 'package:agile/module/update_user_module/update_user_details_view.dart';
import 'package:go_router/go_router.dart';
import '../../module/add_user_module/add_user_view.dart';

abstract class AppRouter {
  static const kLogin = "/logIn";
  static const kHomeAdmin = "/homeAdmin";
  static const kHomeUser = "/homeUser";
  static const kAddUser = "/addUser";
  static const kAddDepart = "/addDepart";
  static const kUpdateUser = "/updateUser";
  static const kUpdateDepart = "/updateDepart";
  static const kCreateTasks = "/createTasks";
  static const kUpdateTasks = "/updateTasks";
  static String  taskId = ' ';
  static String  taskName= ' ';
  static String  taskStartDate= ' ';
  static String  taskEndDate= ' ';
  static String  taskDescription= ' ';
  static String  taskCreatorName= ' ';
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) =>   const SplashView(),
      ),
      GoRoute(
        path: kLogin,
        builder: (context, state) =>  LogInView(),
      ),GoRoute(
        path: kHomeAdmin,
        builder: (context, state) => const HomeScreen(),
      ),

      GoRoute(
        path: kAddUser,
        builder: (context, state) => AddUserView(),
      ),
      GoRoute(
        path: kAddDepart,
        builder: (context, state) => AddDepartmentView(),
      ),
      GoRoute(
        path: kUpdateUser,
        builder: (context, state) => UpdateUserDetailsView(),
      ),
      GoRoute(
        path: kUpdateDepart,
        builder: (context, state) => UpdateDepartmentView(),
      ),
      GoRoute(
        path: kCreateTasks,
        builder: (context, state) => CreateTaskView(),
      ),
      GoRoute(
        path: kUpdateTasks,
        builder: (context, state) => new UpdateTasksView(
          taskId: taskId, taskName: taskName, taskStartDate: taskStartDate, taskEndDate: taskEndDate, taskDescription: taskDescription, taskCreatorName: taskCreatorName
          ,),
      ),
    ],
  );
}
