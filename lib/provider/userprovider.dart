// import 'dart:developer';

// import 'package:flutter/widgets.dart';
// import 'package:instagram/model/user.dart';
// import 'package:instagram/resoures/auth_methods.dart';



// class UserProvider with ChangeNotifier {
//   final AuthMethods _authMethods = AuthMethods();
//   bool isdataloading = true;
//   Usermodel? user;
//   Future<Usermodel> refreshUser() async {
//     log("inside");
//     try {
//       user = await AuthMethods().getUserDetails();
//       isdataloading = false;
//     // } catch (e) {
//       isdataloading = true;
//     }
//     return user!;
//   }
//   // User? user;
//   // final AuthMethods _authMethods = AuthMethods();

//   // // User get getUser => _user!;

//   // Future<User> refreshUser() async {
//   //   User user = await _authMethods.getUserDetails();
//   //   user = user;
//   //   notifyListeners();
//   //   return user;
//   // }
// }