import 'package:e_mart_flutter_app/consts/consts.dart';
import 'package:e_mart_flutter_app/widget_common/our_button.dart';

class ItemDetails extends StatelessWidget {
  final String? title;
  const ItemDetails({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightGrey,
      appBar: AppBar(
        title: title!.text.fontFamily(bold).color(darkFontGrey).make(),
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.share)),
          IconButton(onPressed: (){}, icon: Icon(Icons.favorite_border_outlined)),
        ],
      ),
      body: Column(
        children: [
          Expanded(child: Padding(
            padding: const EdgeInsets.all(12),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  VxSwiper.builder(
                      autoPlay: true,
                      height: 350,
                      aspectRatio: 16/9,
                      itemCount: 3, itemBuilder: (context, index){
                    return Image.asset(imgFc5,
                      width: double.infinity,
                    fit: BoxFit.cover,
                    );
                  }),
                  10.heightBox,
                  title!.text.color(fontGrey).size(16).fontFamily(semibold).make(),
                  10.heightBox,
                  VxRating(onRatingUpdate: (value){
                  },
                  normalColor: textfieldGrey,
                    size: 25,
                    count: 5,
                    selectionColor: golden,
                    stepInt: true,
                  ),
                  10.heightBox,
                  "Rs 30,00".text.color(redColor).fontFamily(bold).make(),
                  10.heightBox,
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            "Seller".text.color(whiteColor).fontFamily(semibold).make(),
                            5.heightBox,
                            "In House Brands".text.color(darkFontGrey).fontFamily(semibold).make(),

                          ],
                        ),
                      ),
                      CircleAvatar(
                        backgroundColor:  whiteColor,
                        child: Icon(Icons.message_rounded, color: darkFontGrey,),
                      )
                    ],
                  ).box.color(textfieldGrey).padding(EdgeInsets.symmetric(horizontal: 10)).height(60).make(),
                  10.heightBox,
                  "Descripton".text.color(darkFontGrey).fontFamily(semibold).make(),
                  10.heightBox,
                  "This is a Dumpy Item And Dumpy description here..".text.color(fontGrey).make(),
                  10.heightBox,
                  ListView(
                    physics: BouncingScrollPhysics(),
                    shrinkWrap: true,
                    children: List.generate(

                        itemDetailsButton.length, (index) => ListTile(
                      title: itemDetailsButton[index].text.fontFamily(semibold).color(darkFontGrey).make(),
                      trailing: Icon(Icons.arrow_forward),

                    )),
                  ),
                  10.heightBox,
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: List.generate(5, (index) => Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset(imgB1, width: 100,fit: BoxFit.cover),
                          10.heightBox,
                          "Laptop 4GB/64GB".text.color(fontGrey).size(12).make(),
                          10.heightBox,
                          "\$600".text.color(redColor).fontFamily(bold).size(16).make(),

                        ],
                      ).box.roundedSM.white.margin(EdgeInsets.only(right: 20)).padding(EdgeInsets.all(20)).make()),
                    ),
                  ),
                ],
              ),
            ),
          )),
          SizedBox(
            width:double.infinity,
            height: 60,
            child: ourButton(color: redColor, title: "Add Cart", textColor: whiteColor, onPress: (){}),
          )
        ],
      ),
    );
  }
}
