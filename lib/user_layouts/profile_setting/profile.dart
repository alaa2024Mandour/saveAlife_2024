import 'package:flutter/material.dart';
import '../../shared/components/shared_component.dart';

class UserProfile extends StatelessWidget {
  const UserProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(110),
          child: Column(
            children: [
              CircleAvatar(
                radius: 90,
                backgroundImage: NetworkImage(
                    'https://p7.hiclipart.com/preview/429/412/870/stock-photography-blood-donation-blood.jpg'),
              ),
              SizedBox(
                height: 5,
              ),
              Text('!! تم التحقق',
                style: TextStyle(
                  fontSize:30,
                  fontWeight: FontWeight.w900,
                ),
              ),
              SizedBox(
                height:3 ,),
              Text('قومت بالتحقق من الحساب بنجاح',
                style: TextStyle(
                  color: Colors.grey,
                ),),
              SizedBox(
                height: 18,),
              Container(
                child: defaultButton(text:'أكتمل',
                    function: (){}),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
