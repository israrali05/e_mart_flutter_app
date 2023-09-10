import 'package:e_mart_flutter_app/consts/consts.dart';

Widget homeButtons({icon, String? title, onPress, height, width}){
  return Expanded(child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Image.asset(icon, width: 26,),
      10.heightBox,
      title!.text.fontFamily(semibold).color(darkFontGrey).make(),
    ],
  )).box.rounded.white.width(width).height(height).make();
}