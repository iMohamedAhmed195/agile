import 'package:agile/module/home_module/home_admin_view.dart';
import 'package:go_router/go_router.dart';
import '../../module/add_user_module/add_user_view.dart';




abstract class AppRouter{
    static const kHome="/home";
    static const kAddUser="/addUser";
    static final  router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) =>   const HomeAdminView(),
      ),
      GoRoute(
        path: kHome,
        builder: (context, state) =>   const HomeAdminView(),
      ),
      GoRoute(
        path: kAddUser,
        builder: (context, state) =>   AddUserView(),
      ),
    ],
  );
}
