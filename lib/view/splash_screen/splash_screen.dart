import 'package:e_mart_flutter_app/consts/consts.dart';
import 'package:get/get.dart';
import '../../widget_common/applogo_widget.dart';
import '../auth/login_screen/login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  ChangeScreen(){
    Future.delayed(Duration(seconds: 3),(){
      Get.to(()=>LoginScreen());
    });
  }
  @override
  void initState() {
    // TODO: implement initState
    ChangeScreen();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: redColor,
      body: Center(
        child: Column(
          children: [
            Align(
                alignment: Alignment.topLeft, 
                child: Image.asset(icSplashBg, width: 300,),
            ),
            20.heightBox,
            applogoWidget(),
            10.heightBox,
            appname.text.fontFamily(bold).white.size(22).make(),
            5.heightBox,
            appversion.text.white.fontFamily(semibold).make(),
            Spacer(),
            credits.text.white.fontFamily(semibold).make(),
            20.heightBox
          ],
        ),
      ),
    );
  }
}
