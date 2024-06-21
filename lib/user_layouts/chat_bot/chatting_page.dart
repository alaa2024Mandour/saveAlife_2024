import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../shared/style/colors.dart';
import 'APIServers.dart';

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _controller = TextEditingController();
  final ApiService apiService = ApiService('http://192.168.1.6:5000');

  List<Message> messages = [];

  void _sendMessage() async {
    if (_controller.text.isNotEmpty) {
      messages.add(Message(content: _controller.text, isUserMessage: true));
      try {
        String response = await apiService.sendMessage(_controller.text);
        messages.add(Message(content: response, isUserMessage: false));
      } catch (e) {
        messages.add(Message(content: 'Error - ${e.toString()}', isUserMessage: false));
      }
      _controller.clear();
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection : TextDirection.ltr,
      child: Scaffold(
        appBar: AppBar(
          title: Text('ChatBot'),
        ),
        body: Column(
          children: <Widget>[
            Expanded(
              child: ListView.builder(
                itemCount: messages.length,
                itemBuilder: (context, index) {
                  final message = messages[index];
                  return Align(
                    alignment: message.isUserMessage ? Alignment.topRight : Alignment.topLeft,
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      padding: EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: message.isUserMessage ?  defultColor : Colors.grey,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Text(
                        message.content,
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      controller: _controller,
                      decoration: InputDecoration(
                        hintText: 'Enter message...',
                      ),
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.send, color: Colors.red),
                    onPressed: _sendMessage,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Message {
  final String content;
  final bool isUserMessage;

  Message({required this.content, required this.isUserMessage});
}
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
//
// import 'APIServers.dart';
//
// class ChatScreen extends StatefulWidget {
//   @override
//   _ChatScreenState createState() => _ChatScreenState();
// }
//
// class _ChatScreenState extends State<ChatScreen> {
//   final TextEditingController _controller = TextEditingController();
//   final ApiService apiService = ApiService('http://192.168.1.6:5000'); // Update with your Flask server IP and port
//
//   List<String> messages = [];
//
//   void _sendMessage() async {
//     if (_controller.text.isNotEmpty) {
//       messages.add('You: ${_controller.text}');
//       try {
//         String response = await apiService.sendMessage(_controller.text);
//         messages.add('Bot: $response');
//       } catch (e) {
//         messages.add('Bot: Error - ${e.toString()}');
//       }
//       _controller.clear();
//       setState(() {});
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: Text('ChatBot'),
//         ),
//         body: Column(
//             children: <Widget>[
//               Expanded(
//                 child: ListView.builder(
//                   itemCount: messages.length,
//                   itemBuilder: (context, index) {
//                     return ListTile(
//                       title: Text(messages[index]),
//                     );
//                   },
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Row(
//                   children: <Widget>[
//                     Expanded(
//                       child: TextField(
//                         controller: _controller,
//                         decoration: InputDecoration(
//                           hintText: 'Enter message...',
//                         ),
//                       ),
//                     ),
//                     IconButton(
//                       icon: Icon(Icons.send , color:Colors.red),
//                       onPressed: _sendMessage,
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//             ),
//         );
//     }
// }
// import 'package:chat_gpt_sdk/chat_gpt_sdk.dart';
// import 'package:dash_chat_2/dash_chat_2.dart';
// import 'package:flutter/material.dart';
//
// import '../../shared/components/shared_component.dart';
// import 'intro_screen.dart';
//
// class ChatScreen extends StatefulWidget {
//   const ChatScreen({super.key});
//
//   @override
//   State<ChatScreen> createState() => _ChatScreenState();
// }
//
// class _ChatScreenState extends State<ChatScreen> {
//   final _user = ChatUser(id: '1', firstName: 'Mohab');
//   final _bot = ChatUser(id: '2', firstName: 'Broxi');
//   List<ChatMessage> messages = [];
//   final _chatGpt = OpenAI.instance.build(
//       token: 'your api token',
//       baseOption: HttpSetup(receiveTimeout: const Duration(seconds: 5)));
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text(
//           'روبوتو',
//           style: TextStyle(
//               fontWeight: FontWeight.w900,
//               fontSize: 20
//           ),
//         ),
//         actions: [
//           IconButton(
//               onPressed: (){
//                 navegateAndFinish(context, ChatBotIntroScreen());
//               },
//               icon: Icon(Icons.keyboard_double_arrow_left_sharp,size: 20,weight: 400,))
//         ],
//       ),
//       body: DashChat(currentUser: _user, onSend: onSend, messages: messages),
//     );
//   }
//
//   void onSend(ChatMessage message) async {
//     setState(() {
//       messages.insert(0, message);
//     });
//     List<Map<String, dynamic>> messagesHistory =
//     messages.reversed.map((message) {
//       if (message.user == _user) {
//         return {'role': 'user', 'content': message.text};
//       } else {
//         return {'role': 'assistant', 'content': message.text};
//       }
//     }).toList();
//     var request = ChatCompleteText(
//         model: GptTurbo0301ChatModel(),
//         messages: messagesHistory,
//         maxToken: 200);
//     var response = await _chatGpt.onChatCompletion(request: request);
//     for (var element in response!.choices) {
//       if (element.message != null) {
//         setState(() {
//           messages.insert(
//               0,
//               ChatMessage(
//                   text: element.message!.content,
//                   user: _bot,
//                   createdAt: DateTime.now()));
//         });
//       }
//     }
//   }
// }