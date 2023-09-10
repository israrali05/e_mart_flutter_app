import 'package:e_mart_flutter_app/consts/consts.dart';
import 'package:e_mart_flutter_app/view/cart_screen/cart_screen.dart';
import 'package:e_mart_flutter_app/view/categories_screen/category_screen.dart';
import 'package:e_mart_flutter_app/view/chat_screen/chat_screen.dart';
import 'package:e_mart_flutter_app/view/home_screen/home_screen.dart';
import 'package:e_mart_flutter_app/view/profile_screen/profile_screen.dart';
import 'package:get/get.dart';

import '../../controllers/home_controller.dart';
 class Home extends StatelessWidget {
   const Home({Key? key}) : super(key: key);

   @override
   Widget build(BuildContext context) {
     var controller = Get.put(HomeController());
     
     var navbarItems = [
       BottomNavigationBarItem(icon: Image.asset(icHome, width: 20), label: home),
       BottomNavigationBarItem(icon: Image.asset(icCategories, width: 20), label: categories),
       BottomNavigationBarItem(icon: Image.asset(icCart, width: 20), label: cart),
       BottomNavigationBarItem(icon: Image.asset(icChat, width: 20), label: chat),
       BottomNavigationBarItem(icon: Image.asset(icProfile, width: 20), label: account),
     ];

     var navBody = [
       HomeScreen(),
       CategoryScreen(),
       CartScreen(),
       ChatScreen(),
       ProfileScreen(),

     ];

     return Scaffold(
       body:
         Column(
           children: [
             Obx(
                     ()=> Expanded(child: navBody.elementAt(controller.currentNavIndex.value)),
             ),
           ],
         ),
       bottomNavigationBar: Obx(
             ()=> BottomNavigationBar(
               currentIndex: controller.currentNavIndex.value,
           selectedItemColor: redColor,
           selectedLabelStyle: const TextStyle(fontFamily: semibold, fontSize: 12),
           items: navbarItems,
           backgroundColor: whiteColor,
           type: BottomNavigationBarType.fixed,
               onTap: (value){
                 controller.currentNavIndex.value = value;
               },
         ),
       ),
     );
   }
 }
