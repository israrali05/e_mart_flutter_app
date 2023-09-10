import 'package:e_mart_flutter_app/consts/consts.dart';

Widget detailsCard({String? title, width, String? count}){
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      count!.text.color(darkFontGrey).size(12).fontFamily(bold).make(),
      5.heightBox,
      title!.text.size(12).color(darkFontGrey).make(),

    ],
  ).box.white.padding(EdgeInsets.all(4)).height(70).rounded.width(width).make();
}
