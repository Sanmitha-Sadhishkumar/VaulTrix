import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:app/firebase_methods/user_module.dart';

Future<void> addUserToFirestore({
  required String name,
  required String mobile,
  required String email,
  required String password,
  required String confPassword,
  required String userType,
  required String uid,
}) async {
  try {
    if (password != confPassword) {
      print("Password and confirm password do not match");
    }

    if(int.parse(mobile)<10000000000 && int.parse(mobile)>600000000){
      if (RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
          .hasMatch(email)){
        if(userType=='Woman') {
          await FirebaseFirestore.instance.collection('users').doc(uid)
              .set({
            'name': name,
            'mobile': mobile,
            'email': email,
            'user type': userType,
            'location': true,
            'shriek': true,
            'light': true,
            'cry':false,
            'radius':false,
            'user id':uid,
          });
          print('added women user');
        } else if (userType=='Child'){
          await FirebaseFirestore.instance.collection('users')
              .doc(uid)
              .set({
            'name': name,
            'mobile': mobile,
            'email': email,
            'user type': userType,
            'location': true,
            'shriek': true,
            'light': true,
            'cry':true,
            'radius':true,
            'user id':uid,
          });
          print('added child user');
        }
      }
    }

  } catch (e) {
    // Handle errors here
    print('Error adding user to Firestore: $e');
    rethrow; // Rethrow the exception for handling in the UI if needed
  }
}

Future<void> addQALToFirestore({
  required String name,
  required String mobile,
  required String relation,
}) async {
  try {
    if(int.parse(mobile)<10000000000 && int.parse(mobile)>6000000000){
          await FirebaseFirestore.instance.collection('users')
              .doc(FirebaseAuth.instance.currentUser!.uid)
              .collection('quickaccesslist').add({
                  'name':name,
                  'mobile':mobile,
                  'relation':relation});
          print('updated QAL');
        }
  } catch (e) {
    print('Error adding user to Firestore: $e');
    rethrow;
  }
}

Future<void> addAlert({
  required String message,
  required dangerLevel,
}) async{
  List<String> numbers = <String>[];
  for(var i in currentUser.quickAccessList!) {
    numbers.add(i.mobile.toString());
  }
  await FirebaseFirestore.instance.collection('alerts').add({
    'serious':(dangerLevel=='suspicious' ? false:true),
    'uid' : currentUser.uid,
    'settled' : false,
    'message' : message,
    'QAL':numbers,
  });
}
