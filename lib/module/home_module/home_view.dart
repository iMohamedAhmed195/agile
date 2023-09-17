
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
   HomeView({super.key});
final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  @override
  Widget build(BuildContext context) {

    return  Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: (){
          if(scaffoldKey.currentState!.isDrawerOpen == false){
            scaffoldKey.currentState!.openDrawer();
          }else{
            scaffoldKey.currentState!.openEndDrawer();
          }
        }, icon: const Icon(Icons.menu)),
      ),
      body:  Scaffold(
        drawer: const Drawer(),
        key: scaffoldKey,
        body: const Text(
          'eh feh'
        ),
      ),
    );
  }
}
