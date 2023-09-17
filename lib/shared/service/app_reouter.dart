import 'package:agile/module/home_module/home_view.dart';
import 'package:agile/module/login_module/login_view.dart';
import 'package:go_router/go_router.dart';

import '../../module/add_user_module/add_user_view.dart';




abstract class AppRouter{
    static const kHome="/home";
    static const kAddUser="/addUser";
    static final  router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) =>  LogInView(),
      ),
      GoRoute(
        path: kHome,
        builder: (context, state) =>   HomeView(),
      ),
      GoRoute(
        path: kAddUser,
        builder: (context, state) =>   AddUserView(),
      ),
    ],
  );
}
