import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../data/models/messages_model.dart';
import '../controllers/message_controller.dart';
import 'package:intl/intl.dart';

class MessageView extends StatelessWidget {
  final MessageController controller = Get.find<MessageController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Chat')),
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(
                child: Obx(() {
                  if (controller.messages.isNotEmpty) {
                    controller.scrollToBottom();
                  }
                  return ListView.builder(
                    controller: controller.scrollController,
                    itemCount: controller.messages.length,
                    itemBuilder: (context, index) {
                      Message message = controller.messages[index];
                      bool isMine = message.from == controller.myName;
                      return _buildMessage(message, isMine);
                    },
                  );
                }),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: controller.messageController,
                        decoration: InputDecoration(
                          labelText: 'Type a message',
                        ),
                      ),
                    ),
                    IconButton(
                      icon: Icon(Icons.send),
                      onPressed: () {
                        controller
                            .sendMessage(controller.messageController.text);
                        controller.messageController.clear();
                      },
                    ),
                  ],
                ),
              )
            ],
          ),
          Positioned(
            right: 15,
            bottom: 80, 
            child: Obx(() {
              return controller.showScrollButton.isTrue
                  ? FloatingActionButton(
                      child: Icon(Icons.arrow_downward),
                      onPressed: controller.scrollToBottom,
                    )
                  : SizedBox.shrink();
            }),
          )
        ],
      ),
    );
  }

  Widget _buildMessage(Message message, bool isMine) {
    final dateFormat = DateFormat('MMM d, HH:mm');
    return Column(
      crossAxisAlignment:
          isMine ? CrossAxisAlignment.end : CrossAxisAlignment.start,
      children: [
        if (!isMine)
          Padding(
            padding: const EdgeInsets.only(left: 12.0, top: 8),
            child: Text(
              message.from!,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
            ),
          ),
        Container(
          width: 140,
          margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
          padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
          decoration: BoxDecoration(
            color: isMine ? Colors.blue[100] : Colors.grey[200],
            borderRadius: isMine
                ? BorderRadius.only(
                    topLeft: Radius.circular(15.0),
                    bottomLeft: Radius.circular(15.0),
                  )
                : BorderRadius.only(
                    topRight: Radius.circular(15.0),
                    bottomRight: Radius.circular(15.0),
                  ),
          ),
          child: Column(
            crossAxisAlignment:
                isMine ? CrossAxisAlignment.end : CrossAxisAlignment.start,
            children: [
              Text(
                message.content!,
                style: TextStyle(fontSize: 16),
              ),
              if (message.at != null)
                Text(
                  dateFormat.format(message.at.toDate()), 
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                ),
              if (isMine)
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Icon(
                      Icons.check,
                      size: 12,
                      color: Colors.blue,
                    ),
                  ],
                ),
            ],
          ),
        ),
      ],
    );
  }
}
