import 'package:e_mart_flutter_app/consts/consts.dart';
import 'package:e_mart_flutter_app/controllers/auth_controller.dart';
import 'package:e_mart_flutter_app/view/home_screen/home_screen.dart';
import 'package:get/get.dart';
import '../../../widget_common/applogo_widget.dart';
import '../../../widget_common/bg_widget.dart';
import '../../../widget_common/custom_textfield.dart';
import '../../../widget_common/our_button.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool? isCheck = false;
  var controller = Get.put(AuthController());

  // text Controllers
  var nameController = TextEditingController();
  var passController = TextEditingController();
  var emailController = TextEditingController();
  var passRetypeController = TextEditingController();

  @override
 Widget build(BuildContext context) {
    return bgWidget(
        Scaffold(
          body: SingleChildScrollView(
            child: Center(
                child: Column(
                  children: [
                    (context.screenHeight*0.1).heightBox,
                    applogoWidget(),
                    10.heightBox,
                    'Join to $appname'.text.white.fontFamily(semibold).minFontSize(16).make(),
                    20.heightBox,
                    Obx(()=>
                       Column(
                        children: [
                          customTextField(title: name,hint: nameHint, controller: nameController, isPass: false),
                          10.heightBox,
                          customTextField(title: email,hint: emailHint,controller: emailController,  isPass: false),
                          10.heightBox,
                          customTextField(title: password,hint: passwordHint,controller: passController, isPass: true),
                          10. heightBox,
                          customTextField(title: retypePassword,hint: passwordHint, controller: passRetypeController,  isPass: true),
                          10. heightBox,
                          Align(
                            alignment: Alignment.centerRight,
                            child: TextButton(
                              onPressed: (){},
                              child: forgetPassword.text.make(),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Checkbox(
                                activeColor: redColor,
                                checkColor: whiteColor,
                                value: isCheck,
                                  onChanged: (newValue){
                                  setState(() {
                                    isCheck = newValue;
                                  });
                                  }),
                              Expanded(
                                child: RichText(text: const TextSpan(
                                  children: [
                                    TextSpan(
                                      text: 'I agreed to the ',
                                      style: TextStyle(
                                        fontFamily: regular,
                                        color: fontGrey
                                      )
                                    ),
                                    TextSpan(
                                        text: privacyPolicy,
                                        style: TextStyle(
                                            fontFamily: regular,
                                            color: redColor
                                        )
                                    ),
                                    TextSpan(
                                        text: " & ",
                                        style: TextStyle(
                                            fontFamily: regular,
                                            color: fontGrey
                                        )
                                    ),
                                    TextSpan(
                                        text: termAndCond,
                                        style: TextStyle(
                                            fontFamily: regular,
                                            color: redColor
                                        )
                                    ),
                                  ]
                                )),
                              )
                            ],
                          ),
                          5.heightBox,
                          controller.laoding.value? const CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation(redColor),
                          ) : ourButton(title: signup,  color: isCheck==false? fontGrey : redColor, textColor: whiteColor, onPress: () async{
                            if(isCheck != false){
                              controller.laoding(true);
                              try{
                                await controller.signUpMethod(context: context, email: emailController.text, password: passController.text)
                                    .then((value) {
                                      return controller.storeUserData(
                                        password: passController.text,
                                        email: emailController.text,
                                        name: nameController.text
                                      );
                                }).then((value) {
                                  VxToast.show(context, msg: logIn);
                                  return Get.offAll(()=>const HomeScreen());
                                });
                              } catch(e){
                                controller.laoding(false);
                                auth.signOut();
                                VxToast.show(context, msg: e.toString());

                              }
                            }
                          }
                          ).box.width(context.screenWidth - 50).make(),
                          5.heightBox,

                          // --  Wrapping With Gesture Detector Velocity X
                          RichText(text: const TextSpan(
                            children: [
                              TextSpan(
                                text: alreadyHaveAcc,
                                style: TextStyle(
                                  fontFamily: regular,
                                  color: fontGrey
                                )
                              ),
                              TextSpan(
                                  text: login,
                                  style: TextStyle(
                                      fontFamily: regular,
                                      color: redColor
                                  )
                              ),
                            ]
                          )).onTap(() {
                            Get.back();
                          })
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
