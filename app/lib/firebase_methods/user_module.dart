class User {
  String? uid;
  String? email;
  String? name;
  String? mobile;
  String? userType;
  bool location=false;
  bool shriek=false;
  bool light=false;
  bool cry=false;
  bool radius=false;
  List<QuickAccessList>? quickAccessList;
  User(
      this.uid,
      this.email
      );
}

User currentUser=User('','');

class QuickAccessList{
  String? name;
  String? mobile;
  String? relation;
}