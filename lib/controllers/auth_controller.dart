import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_mart_flutter_app/consts/consts.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class AuthController extends GetxController{

  // laoding indicator
  var  laoding = false.obs;

  // Text Editing Controllers
  var emailController = TextEditingController();
  var passController = TextEditingController();

  Future<UserCredential?>  loginMethod({context}) async{
    UserCredential? userCredential;
    try{
      await auth.signInWithEmailAndPassword(email: emailController.text, password: passController.text);
    }on FirebaseAuthException catch(e){
      VxToast.show(context, msg: e.toString());
    }
    return userCredential;
  }
  // Store User Data in FireStore

  storeUserData({name, email, password}) async{
    DocumentReference store =   firestore.collection(userCollection).doc(currentUser!.uid);
    store.set({
      'name': name,
      'password': password,
      'email': email,
      'imageUrl': '',
      'id': currentUser!.uid
    });
  }


   // signUp Method
  Future<UserCredential?>  signUpMethod({email,password, context}) async{
    UserCredential? userCredential;
    try{
      await auth.createUserWithEmailAndPassword(email: email, password: password);
    }on FirebaseAuthException catch(e){
      VxToast.show(context, msg: e.toString());
    }
    return userCredential;
  }
   // SignOut Method
 signOutMethod(context)  async{
    try{
      await auth.signOut();
    } catch(e){
      VxToast.show(context, msg: e.toString());
    }
}
}

