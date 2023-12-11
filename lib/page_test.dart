// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
//
// class PageTest extends StatefulWidget {
//   const PageTest({super.key});
//
//   @override
//   State<PageTest> createState() => _PageTestState();
// }
//
// class _PageTestState extends State<PageTest> {
//   Future<UserCredential?> signInWithFacebook() async {
//    try{
//      final LoginResult loginResult = await FacebookAuth.instance.login();
//      final OAuthCredential facebookAuthCredential =
//      FacebookAuthProvider.credential(loginResult.accessToken!.token);
//      UserCredential? user = await FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
//      return  user;
//    }catch(e){
//      print('$e');
//    }
//    return null;
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: InkWell(
//         onTap: () async {
//           UserCredential? user = await signInWithFacebook();
//           var a = 1;
//         },
//         child: Container(
//           color: Colors.blue,
//           width: 100,
//           height: 50,
//           child: Text("Login"),),
//       ),
//     );
//   }
// }
