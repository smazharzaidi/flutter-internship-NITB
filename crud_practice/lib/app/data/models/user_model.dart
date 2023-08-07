import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  String? docId;
  String? name;
  String? cnic;
  User({this.docId, this.name, this.cnic});
  User.fromMap(DocumentSnapshot data) {
    docId = data.id;
    name = data["name"];
    cnic = data["cnic"];
  }
}
