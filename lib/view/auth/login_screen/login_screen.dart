import 'package:e_mart_flutter_app/consts/consts.dart';
import 'package:e_mart_flutter_app/controllers/auth_controller.dart';
import 'package:e_mart_flutter_app/view/auth/sign_up/signup_screen.dart';
import 'package:e_mart_flutter_app/view/home_screen/home_screen.dart';
import 'package:e_mart_flutter_app/widget_common/applogo_widget.dart';
import 'package:get/get.dart';
import '../../../widget_common/bg_widget.dart';
import '../../../widget_common/custom_textfield.dart';
import '../../../widget_common/our_button.dart';


class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(AuthController());
    return bgWidget(
        Scaffold(
          body: SingleChildScrollView(
            child: Center(
              child: Column(
                children: [
                  (context.screenHeight*0.1).heightBox,
                  applogoWidget(),
                  10.heightBox,
                  'Login to $appname'.text.white.fontFamily(semibold).minFontSize(16).make(),
                  20.heightBox,
                  Obx(
                        ()=> Column(
                      children: [
                        customTextField(title: email,hint: emailHint, controller: controller.emailController),
                        5.heightBox,
                        customTextField(title: password,hint: passwordHint, isPass: true, controller: controller.passController),
                        5. heightBox,
                        Align(
                          alignment: Alignment.centerRight,
                          child: TextButton(
                            onPressed: (){},
                            child: forgetPassword.text.make(),
                          ),
                        ),
                        5.heightBox,
                       controller.laoding.value? const CircularProgressIndicator(
                         valueColor: AlwaysStoppedAnimation(redColor),
                       ) : ourButton(title: login, color: redColor, textColor: whiteColor, onPress: () async{
                         controller.laoding(true);
                          await controller.loginMethod(context: context).then((value){
                          if(value!=null){
                            VxToast.show(context, msg: logIn);
                            Get.offAll(()=>const HomeScreen());
                          }else{
                            controller.laoding(false);
                          }
                          });
                        }
                        ).box.width(context.screenWidth - 50).make(),
                        5.heightBox,
                        createAccount.text.color(fontGrey).make(),
                        5.heightBox,
                        ourButton(title: signup, color: lightGolden, textColor: redColor, onPress: (){
                         Get.to(()=>const SignUpScreen());
                        }
                        ).box.width(context.screenWidth - 50).make(),
                        10.heightBox,
                        loginWith.text.color(fontGrey).make(),
                        10.heightBox,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(3, (index) => Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: CircleAvatar(
                              backgroundColor: lightGrey,
                              radius: 22,
                              child: Image.asset(socialIconList[index],
                              width: 25,),
                            ),
                          )),
                        )

                      ],
                    ).box.padding(const EdgeInsets.all(16)).width(context.screenWidth -70).shadowSm.white.rounded.make(),
                  )
                ],
              )
            ),
          ),
    ));
  }
}