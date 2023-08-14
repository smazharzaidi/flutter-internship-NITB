import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../../../data/models/messages_model.dart';

class MessageController extends GetxController {
  RxBool showScrollButton = false.obs;

  final ScrollController scrollController = ScrollController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late TextEditingController messageController = TextEditingController();
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  late CollectionReference collectionReference;
  RxList<Message> messages = RxList<Message>([]);
  final String myName = "Syed Mazhar";

  @override
  @override
  void onInit() {
    super.onInit();
    collectionReference = firebaseFirestore.collection("messages");
    messages.bindStream(getAllMessages());
    scrollToBottom();

    scrollController.addListener(() {
      if (scrollController.position.atEdge) {
        if (scrollController.position.pixels !=
            scrollController.position.maxScrollExtent) {
          showScrollButton.value = true;
        } else {
          showScrollButton.value = false;
        }
      } else {
        showScrollButton.value = true;
      }
    });
  }

  Stream<List<Message>> getAllMessages() => collectionReference
      .orderBy('at', descending: false)
      .snapshots()
      .map((query) => query.docs.map((item) => Message.fromMap(item)).toList());

  void scrollToBottom() {
    Future.delayed(Duration(milliseconds: 100), () {
      if (scrollController.hasClients) {
        scrollController.jumpTo(scrollController.position.maxScrollExtent);
        showScrollButton.value = false; 
      }
    });
  }

  void sendMessage(String content) {
    if (content.isEmpty) return;

    String id = DateTime.now().millisecondsSinceEpoch.toString();

    DocumentReference docRef = collectionReference.doc(id);

    docRef.set({
      'id': id,
      'from': myName,
      'content': content,
      'at': FieldValue.serverTimestamp(),
      'status': 'Sent',
    }).then((_) {
      scrollToBottom();
    }).catchError((error) {
      print(error);
    });
  }

  @override
  void onClose() {
    messageController.dispose();
  }
}
