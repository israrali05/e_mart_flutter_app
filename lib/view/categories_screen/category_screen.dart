import 'package:e_mart_flutter_app/consts/consts.dart';
import 'package:e_mart_flutter_app/view/categories_screen/categories_details.dart';
import 'package:e_mart_flutter_app/widget_common/bg_widget.dart';
import 'package:get/get.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return bgWidget(
    Scaffold(
        appBar: AppBar(
          title: categories.text.white.fontFamily(bold).make(),
        ),
      body: Container(
        padding: EdgeInsets.all(12),
        child: GridView.builder(
            shrinkWrap: true,
            itemCount: 9,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
                crossAxisSpacing: 8,
                mainAxisExtent: 200,
                mainAxisSpacing: 8

            ), itemBuilder: (context , index){
              return Column(
                children: [
                 Image.asset(categoriesImg[index], height: 120, width: 200, fit: BoxFit.cover,),
                  10.heightBox,
                  categoriesList[index].text.color(fontGrey).align(TextAlign.center).make(),
                ],
              ).box.white.rounded.outerShadow.clip(Clip.antiAlias).make().onTap(() {
                Get.to(()=>CategoriesDetails(title: categoriesList[index]));
              });
        }),
      ),
      )
    );
  }
}
