import 'package:agile/module/login_module/login_view.dart';
import 'package:go_router/go_router.dart';




abstract class AppRouter{

  final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) =>  LogInView(),
      ),
    ],
  );
}
