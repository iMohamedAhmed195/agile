import 'package:agile/module/add_department_module/add_depart_view.dart';
import 'package:agile/module/home_module/home_admin_view.dart';
import 'package:agile/module/home_module/home_user_view.dart';
import 'package:agile/module/login_module/login_view.dart';
import 'package:agile/module/update_depart_module/update_depart_view.dart';
import 'package:agile/module/update_user_module/update_user_details_view.dart';
import 'package:go_router/go_router.dart';
import '../../module/add_user_module/add_user_view.dart';




abstract class AppRouter{
    static const kHomeAdmin="/homeAdmin";
    static const kHomeUser="/homeUser";
    static const kAddUser="/addUser";
    static const kAddDepart="/addDepart";
    static const kUpdateUser="/updateUser";
    static const kUpdateDepart="/updateDepart";
    static final  router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) =>     LogInView(),
      ),
      GoRoute(
        path: kHomeAdmin,
        builder: (context, state) =>    const HomeAdminView(),
      ),GoRoute(
        path: kHomeUser,
        builder: (context, state) =>   const HomeUserView(),
      ),
      GoRoute(
        path: kAddUser,
        builder: (context, state) =>   AddUserView(),
      ),GoRoute(
        path: kAddDepart,
        builder: (context, state) =>   AddDepartmentView(),
      ),GoRoute(
        path: kUpdateUser,
        builder: (context, state) =>   UpdateUserDetailsView(),
      ),GoRoute(
        path: kUpdateDepart,
        builder: (context, state) =>   UpdateDepartmentView(),
      ),


    ],
  );
}
