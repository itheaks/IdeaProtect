import 'package:flutter/material.dart';
import 'package:kommunicate_flutter/kommunicate_flutter.dart';

class ChatBotPage extends StatefulWidget {
  @override
  _ChatBotPageState createState() => _ChatBotPageState();
}

class _ChatBotPageState extends State<ChatBotPage> {
  @override
  void initState() {
    super.initState();
    _initiateConversation();
  }

  _initiateConversation() async {
    try {
      dynamic conversationObject = {
        'appId': '3dfa880bc2d2cf0b9fcbad8f94b89d11',
      };

      dynamic result = await KommunicateFlutterPlugin.buildConversation(conversationObject);
      print("Conversation builder success : " + result.toString());
    } catch (e) {
      print("Conversation builder error occurred : " + e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Chatbot"),
      ),
      body: Center(
        child: Text("Chatbot will be displayed here."),
      ),
    );
  }
}
