import 'package:flutter/material.dart';
import 'package:save_a_life_2024/shared/style/colors.dart';
import '../../shared/components/shared_component.dart';
import '../home_page/home_page.dart';
import 'chatting_page.dart';


class ChatBotIntroScreen extends StatelessWidget {
  const ChatBotIntroScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading:  IconButton(
            onPressed: (){
              navegateAndFinish(context, UserHomePage());
            },
            icon:Icon(Icons.double_arrow_rounded, color: defultColor,) ),
      ),
      body: Container(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(child: Image.asset("assets/images/cerves pages/DOTS APP.png")),
            CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage("assets/images/icons/icons8-robot-60.png"),
              backgroundColor: Colors.transparent,
            ),
            SizedBox(height: 25,),
           Text(
             "رحبا بك .. !",
             style: TextStyle(
               color: defultColor,
               fontSize: 20,
               fontWeight:FontWeight.bold
             ),

           ),
            SizedBox(height: 25,),
            Text(
              "اسمي روبوتو , وانا هنا لمساعدتك ..",
              style: TextStyle(
                  color: Colors.grey,
                  fontSize: 15,
                  fontWeight:FontWeight.bold
              ),

            ),
           SizedBox(height: 25,),
           defaultButton(
               color: defultColor,
               text: "اسال روبوتو",
               width: 180,
               function: (){
                 navegateAndFinish(context, ChatScreen());
               }
           ),

            Expanded(child: Image.asset("assets/images/cerves pages/DOTS APP.png")),
          ],
        ),
      ),
    );
  }
}
