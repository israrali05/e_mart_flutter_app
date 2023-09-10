import 'package:e_mart_flutter_app/consts/consts.dart';
import 'package:e_mart_flutter_app/widget_common/home_buttons.dart';
import 'components/featured_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      color: lightGrey,
      height: context.screenHeight,
      width: context.screenWidth,
      child: SafeArea(
        child: Column(
          children: [
            Container(
              alignment: Alignment.center,
              height: 60,
              color: lightGrey,
              child: TextFormField(
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  filled: true,
                  fillColor: whiteColor,
                  hintText: searchAnything,
                  hintStyle: TextStyle(color: textfieldGrey),
                  suffixIcon: Icon(Icons.search),
                ),
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                  children: [
                    // -- VX Swipper brands
                    VxSwiper.builder(
                        aspectRatio: 21 / 9,
                        autoPlay: true,
                        height: 150,
                        enlargeCenterPage: true,
                        itemCount: slidersList.length,
                        itemBuilder: (context, index) {
                          return Image
                              .asset(slidersList[index],
                            fit: BoxFit.fill,
                          )
                              .box
                              .rounded
                              .clip(Clip.antiAlias)
                              .margin(EdgeInsets.symmetric(horizontal: 5))
                              .make();
                        }),
                    10.heightBox,

                    // -- Deals Buttons
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: List.generate(2, (index) =>
                          homeButtons(
                              height: context.screenHeight * 0.15,
                              width: context.screenWidth / 2.4,
                              icon: index == 0 ? icTodaysDeal : icFlashDeal,
                              title: index == 0 ? todayDeals : flashSale
                          )),
                    ),
                    10.heightBox,
                    VxSwiper.builder(
                        aspectRatio: 21 / 9,
                        autoPlay: true,
                        height: 150,
                        enlargeCenterPage: true,
                        itemCount: secondSlidersList.length,
                        itemBuilder: (context, index) {
                          return Image
                              .asset(secondSlidersList[index],
                            fit: BoxFit.fill,
                          )
                              .box
                              .rounded
                              .clip(Clip.antiAlias)
                              .margin(EdgeInsets.symmetric(horizontal: 5))
                              .make();
                        }),
                    10.heightBox,

                    //  -- brands Three Button

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: List.generate(3, (index) =>
                          homeButtons(
                              height: context.screenHeight * 0.14,
                              width: context.screenWidth / 3.7,
                              icon: index == 0 ? icCategories : index == 1? icBrands : icTopSeller,
                              title: index == 0 ? categories : index == 1? brands : topSeller
                          )),
                    ),
                    10.heightBox,
                    Align(
                      alignment: Alignment.centerLeft,
                      child: featuredCategories.text.color(fontGrey).size(18).fontFamily(semibold).make(),
                    ),
                    10.heightBox,
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: List.generate(3, (index) => Column(

                          children: [
                            featureButton(title: featureTitle1[index], icon: featureImg1[index]),
                            10.heightBox,
                            featureButton(title: featureTitle2[index], icon: featureImg2[index]),

                          ],
                        )).toList(),
                      ),
                    ),
                    20.heightBox,
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: redColor,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          featuredProducts.text.fontFamily(bold).size(18).white.make(),
                          20.heightBox,
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
                    10.heightBox,
                    VxSwiper.builder(
                        aspectRatio: 21/9,
                        autoPlay: true,
                        height: 80,
                        enlargeCenterPage: true,
                        itemCount: secondSlidersList.length,
                        itemBuilder: (context, index) {
                          return Image
                              .asset(secondSlidersList[index],
                            fit: BoxFit.fill,
                          )
                              .box
                              .rounded
                              .clip(Clip.antiAlias)
                              .margin(EdgeInsets.symmetric(horizontal: 5))
                              .make();
                        }),
                    20.heightBox,
                    Align(
                      alignment: Alignment.centerLeft,
                      child: "All Products".text.color(fontGrey).size(18).fontFamily(semibold).make(),
                    ),
                    20.heightBox,
                    GridView.builder(
                      physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 8,
                          mainAxisSpacing: 8,
                          mainAxisExtent: 300

                        ),
                        itemCount: 6,
                        itemBuilder: (context, index){
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.asset(
                                imgP5,
                                height: 200,
                                  width: 200,
                                fit: BoxFit.cover,
                              ),
                              Spacer(),
                              10.heightBox,
                              "Laptop 4GB/64GB".text.color(fontGrey).size(12).make(),
                              10.heightBox,
                              "\$600".text.color(redColor).fontFamily(bold).size(16).make(),
                            ],
                          ).box.white.padding(EdgeInsets.all(20)).make();

                        })
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}