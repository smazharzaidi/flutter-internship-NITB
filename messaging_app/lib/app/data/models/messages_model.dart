import 'package:cloud_firestore/cloud_firestore.dart';

class Message {
  String? docId;
  String? from;
  String? content;
  dynamic at;
  String? status;

  Message({this.docId, this.from, this.content, this.at, this.status});

  Message.fromMap(DocumentSnapshot data) {
    docId = data.id;
    from = data["from"];
    content = data["content"];
    at = data["at"];
    status = data["status"]; 
  }
}
