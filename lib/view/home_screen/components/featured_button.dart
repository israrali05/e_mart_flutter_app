import 'package:e_mart_flutter_app/consts/consts.dart';

Widget featureButton({icon, String? title}){
  return Row(
    children: [
      Image.asset(icon, width: 30, fit: BoxFit.fill,),
      10.widthBox,
      title!.text.fontFamily(semibold).make(),
    ],
  ).box.width(200).margin(EdgeInsets.only(right: 10)).white.padding(EdgeInsets.all(10)).make();
}