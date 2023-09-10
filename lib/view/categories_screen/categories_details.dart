import 'package:e_mart_flutter_app/consts/consts.dart';
import 'package:e_mart_flutter_app/view/categories_screen/item_details.dart';
import 'package:e_mart_flutter_app/widget_common/bg_widget.dart';
import 'package:get/get.dart';

class CategoriesDetails extends StatelessWidget {
  final String? title;
  const CategoriesDetails({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return bgWidget(
      Scaffold(
        appBar: AppBar(
          title: title!.text.white.fontFamily(bold).make(),
        ),
        body: Container(
          padding: const EdgeInsets.all(12),
          child: Column(
            children: [
              SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(
                      6, (index) => "baby Clothing"
                      .text
                      .color(fontGrey)
                  .fontFamily(semibold)
                      .makeCentered()
                  .box
                  .white
                  .roundedSM
                  .size(100, 40)
                  .margin(EdgeInsets.symmetric(horizontal: 5))
                  .make()),
                ),
              ),
              20.heightBox,
              Expanded(child: Container(
                color: lightGrey,
                child: GridView.builder(
                    itemCount: 6,
                    shrinkWrap: true,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisExtent: 200,
                  mainAxisSpacing: 8,
                  crossAxisSpacing: 8
                ),

                    itemBuilder: (context, index){
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset(
                        imgP5,
                        height: 80,
                        width: 130,
                        fit: BoxFit.cover,
                      ),                      5.heightBox,
                      "Laptop 4GB/64GB".text.color(fontGrey).size(12).make(),
                      10.heightBox,
                      "\$600".text.color(redColor).fontFamily(bold).size(16).make(),
                    ],
                  ).box.white.padding(EdgeInsets.all(20)).make().onTap(() {
                    Get.to(()=>ItemDetails(title: "Dumpy item"));
                  });
                }),
              ))
            ],
          ),
        ),
      )
    );
  }
}
