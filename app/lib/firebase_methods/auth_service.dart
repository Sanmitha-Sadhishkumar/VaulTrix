import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'user_module.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

class AuthService{
  final auth.FirebaseAuth _firebaseAuth = auth.FirebaseAuth.instance;
  User? _userFromFirebase(auth.User? user) {
    if (user == null) {
      return null;
    }
    return User(user.uid, user.email);
  }
  Stream<User?> get user {
    return _firebaseAuth.authStateChanges().map(_userFromFirebase);
  }

  Future<User?> signInWithEmailAndPassword(String email, String password,) async {
    if (RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email)) {
      final crendential = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return _userFromFirebase(crendential.user);
    }
  }

 Future<User?> createuserWithEmailAndPassword(String email, String password,) async{
   if (RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
         .hasMatch(email)) {
     final crendential = await _firebaseAuth.createUserWithEmailAndPassword(
       email: email,
       password: password,
     );
     return _userFromFirebase(crendential.user);
   }
  }

  Future<void> signOut() async{
    return await _firebaseAuth.signOut();
  }
}

void getInfo() async{
  var collection = FirebaseFirestore.instance.collection('users');
  var qcollection = await FirebaseFirestore.instance.collection('users')
                 .doc(auth.FirebaseAuth.instance.currentUser!.uid)
                 .collection('quickaccesslist');

  var dataquery = await collection.where('email',
      isEqualTo: auth.FirebaseAuth.instance.currentUser!.email)
      .get();
  var qdataquery = await qcollection.get();
  var qdata = qdataquery.docs;
  Map<String, dynamic> data = dataquery.docs[0].data();
  currentUser.name = data['name'];
  currentUser.email = data['email'];
  currentUser.mobile = data['mobile'];
  currentUser.location = data['location'];
  currentUser.shriek = data['shriek'];
  currentUser.cry = data['cry'];
  currentUser.radius = data['radius'];
  currentUser.light = data['light'];
  currentUser.userType = data['user_type'];
  if(qdata!=Null) {
    List<Map<String, dynamic>> qal = <Map<String, dynamic>>[];
    List<QuickAccessList> q = <QuickAccessList>[];
    for (var query in qdata) {
      String name = query['name'];
      String mobile = query['mobile'];
      String relation = query['relation'];
      QuickAccessList ql = QuickAccessList();
      ql.name = name;
      ql.mobile = mobile;
      ql.relation = relation;
      q.add(ql);
      print(query);
    }

    currentUser.quickAccessList = q;
  } else {
    currentUser.quickAccessList=[];
  }
  print("Getting info");
}

