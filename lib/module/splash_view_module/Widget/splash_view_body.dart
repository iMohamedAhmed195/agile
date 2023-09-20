import 'package:agile/module/splash_view_module/Widget/sliding_text.dart';
import 'package:agile/shared/service/app_reouter.dart';
import 'package:agile/shared/styles/assets.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';


class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Offset> slidingAnimation;

  @override
  void initState() {
    super.initState();
    initSlidingAnimations();
    initNavigateToHomeView();

  }
  @override
  void dispose() {
    super.dispose();
    animationController.dispose();
  }

  void initSlidingAnimations(){
  animationController =
      AnimationController(vsync: this, duration: const Duration(seconds: 1));
  slidingAnimation =
      Tween<Offset>(begin: const Offset(0, 7), end: Offset.zero)
          .animate(animationController);
  animationController.forward();
}

  void initNavigateToHomeView(){
    Future.delayed(const Duration(seconds: 2),(){
      // Get.to(()=>const HomeView() , transition: Transition.leftToRight ,duration: kTransitionAnimation);
       GoRouter.of(context).push(AppRouter.kLogin);
    });
  }


  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            height: 220,
            width: 190,
            child: Image.asset(AssetsData.logo,),
          ),
          const SizedBox(
            height: 15,
          ),
          SlidingText(slidingAnimation: slidingAnimation),
        ]);
  }
}
