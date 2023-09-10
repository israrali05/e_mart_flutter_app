import 'package:e_mart_flutter_app/consts/consts.dart';
import 'package:e_mart_flutter_app/controllers/auth_controller.dart';
import 'package:e_mart_flutter_app/view/auth/login_screen/login_screen.dart';
import 'package:e_mart_flutter_app/view/profile_screen/components/details_card.dart';
import 'package:e_mart_flutter_app/widget_common/bg_widget.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return bgWidget(
      SafeArea(child: Scaffold(
        backgroundColor: redColor,
        body: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Align(
                  alignment: Alignment.topRight,
                  child: Icon(Icons.edit,color: whiteColor,)),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Image.asset(imgProfile, width: 80, fit: BoxFit.cover,).box.clip(Clip.antiAlias).roundedFull.make(),
                 10.widthBox,
                 Expanded(child: Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                     "Dumpy Text".text.white.fontFamily(semibold).make(),
                     "Dumpy@gmail.com".text.white.make(),
                   ],
                 )),
                  OutlinedButton(onPressed: () async{
                    await Get.put(AuthController()).signOutMethod(context);
                    Get.offAll(()=>const LoginScreen());
                  },
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(
                          color: whiteColor,
                        )
                      ),
                      child: "Logout".text.fontFamily(semibold).white.make())
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                detailsCard(count: "00", title: "In your Card", width: context.screenWidth/3.5 ),
                detailsCard(count: "32", title: "In your Wishlist", width: context.screenWidth/3.5 ),
                detailsCard(count: "6", title: "In your Orders", width: context.screenWidth/3.5 ),
              ],
            ),
            Expanded(
              child: ListView.separated(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,

                  itemBuilder: (context, index){
                    return ListTile(
                      leading: Image.asset(profileButtonIcon[index], width: 22,),
                      title: profileButtonList[index].text.fontFamily(semibold).color(fontGrey).make(),
                    );
                  },
                  separatorBuilder: (context, index){
                    return const Divider(color: fontGrey,);

              } , itemCount: profileButtonList.length).box.white.padding(const EdgeInsets.all(12)).rounded.shadowSm.make()
              .box.color(redColor).padding(const EdgeInsets.all(12)).make(),
            ),
          ],
        ),
      ))
    );
  }
}
