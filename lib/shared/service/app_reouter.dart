import 'package:agile/module/home_module/home_view.dart';
import 'package:agile/module/login_module/login_view.dart';
import 'package:go_router/go_router.dart';




abstract class AppRouter{
    static const kHome="/home";
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
    ],
  );
}
