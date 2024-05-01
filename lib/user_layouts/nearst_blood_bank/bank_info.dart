import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:save_a_life_2024/shared/components/shared_component.dart';
import 'package:save_a_life_2024/shared/style/colors.dart';
import 'package:url_launcher/link.dart';
import '../home_page/home_page.dart';
import '../user_cubit/userCubit.dart';
import '../user_cubit/userStatus.dart';
import 'nearst_blood_bank.dart';
import 'package:flutter_charts/flutter_charts.dart' ;



class BloodChart{
  final String bloodType;
  final int bages;
  final Color color;

  BloodChart({
    required this.bloodType,
    required this.bages,
    this.color = Colors.red ,
});
}

class BankInfo extends StatelessWidget {
   BankInfo({Key? key}) : super(key: key);
  //  List<charts.S>;
  // List<BloodChart> bloodCount = [
  //   BloodChart(
  //       bloodType:"A+",
  //       bages: 15,
  //       ),
  //   BloodChart(
  //     bloodType:"A-",
  //     bages: 15,
  //   ),
  //   BloodChart(
  //     bloodType:"AB+",
  //     bages: 15,
  //   ),
  //   BloodChart(
  //     bloodType:"AB-",
  //     bages: 15,
  //   ),
  //   BloodChart(
  //     bloodType:"B+",
  //     bages: 15,
  //   ),
  //   BloodChart(
  //     bloodType:"B-",
  //     bages: 15,
  //   ),
  //   BloodChart(
  //     bloodType:"O+",
  //     bages: 15,
  //   ),
  //   BloodChart(
  //     bloodType:"O-",
  //     bages: 15,
  //   ),
  //
  // ];

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserCubit,UserStatus>(
      listener: (BuildContext context, state) {  },
      builder: (BuildContext context, state) {
        var cubit = UserCubit.get(context);
        return  Scaffold(
          appBar: AppBar(
            leading: IconButton(
              onPressed: () { navigateTo(context, UserHomePage()); },
              icon: const Icon(Icons.double_arrow_rounded,size: 35,),),
          ),
          body:   Padding(
            padding:  const EdgeInsets.all(20.0),
            child: SizedBox(
              width:double.infinity,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                   Text(
                    "${NearestBank.BankName}",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  const SizedBox(height: 50,),
                  Center(
                    child: Column(
                      children: [
                         Container(
                          width: double.infinity,
                          padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 20),
                          decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(40),
                        boxShadow:[
                          BoxShadow(
                            color: HexColor('#EAEAEA'),
                            blurRadius: 4.0,
                            spreadRadius: 2.0,
                          ),
                        ]
                    ),
                          child: Row(
                            children: [
                              const Text(
                                  "الموقع",
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w900,
                                )
                              ),
                              const Spacer(),
                              Link(
                                target: LinkTarget.blank,
                                uri: Uri.parse(NearestBank.BankLocation),
                                builder: (BuildContext context, Future<void> Function()? followLink) {
                                return IconButton(
                                    onPressed:followLink,
                                    icon:Icon(Icons.keyboard_double_arrow_left_rounded,size: 35,color: defultColor,));
                              },
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}


