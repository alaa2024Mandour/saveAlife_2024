import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:save_a_life_2024/user_layouts/appointment/secAppointment.dart';
import '../../shared/style/colors.dart';
import '../user_cubit/userCubit.dart';
import '../user_cubit/userStatus.dart';

class Appointment extends StatelessWidget  {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserCubit,UserStatus>(
        listener: (BuildContext context, UserStatus state) {
          if(state is BookingAppointmentSuccess){
            ScaffoldMessenger.of(context).showSnackBar( SnackBar(content:Text("تم الحجز بنجاج")));
          }else if(state is BookingAppointmentError){
            ScaffoldMessenger.of(context).showSnackBar( SnackBar(content:Text("خطا في بيانات الحجز")));
          }
        },
        builder: (BuildContext context, UserStatus state) {
          var cubit = UserCubit.get(context);
          return AnnotatedRegion<SystemUiOverlayStyle>(
            value: SystemUiOverlayStyle.light.copyWith(statusBarColor:Colors.transparent,),
            child: Scaffold(
            backgroundColor: Colors.white,
            body: Stack(
              children: [
                Hero(
                  tag: 'appointment_image', // Unique tag for this Hero widget
                  child: Container(
                    child: Image.asset('assets/images/cerves pages/appointment.png'),
                  ),
                ),
                Positioned(
                  right: MediaQuery.of(context).size.width * .355,
                  top: MediaQuery.of(context).size.height * .05,
                  child: Hero(
                    tag: 'company_logo', // Unique tag for this Hero widget
                    child: Container(
                      child: Image.asset(
                        'assets/images/cerves pages/logo-removebg-preview.png',
                      ),
                      width: 111,
                      height: 106.95,
                      decoration: ShapeDecoration(
                        color: Colors.white,
                        shape: const CircleBorder(
                          side: BorderSide(width: 1, color: Colors.white),
                        ),
                        shadows: const [
                          BoxShadow(
                            color: Color(0x3F000000),
                            blurRadius: 4,
                            offset: Offset(0, 4),
                            spreadRadius: 0,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Center(
                  child: Container(
                    width: 344,
                    height: 548,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(23),
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0xB22E64FF),
                          blurRadius: 4,
                          offset: const Offset(4, 4),
                          spreadRadius: 0,
                        ),
                      ],
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Text(
                            'حجز موعد:',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: const Color(0xFF0B11A7),
                              fontSize: 20,
                              fontFamily: 'lemonada',
                              fontWeight: FontWeight.w600,
                              height: 0,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Row(
                            children: const [
                              Text(
                                ' اسئلة هامة:',
                                style: TextStyle(
                                  color: Color(0xFF0B11A7),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Column(
                            children: [
                              Row(
                                children: [
                                  const Text(
                                    "1- ",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w900,
                                        fontSize: 12,
                                        color: Colors.grey
                                    ),
                                  ),
                                  const SizedBox(width: 10,),
                                  const Text(
                                    "النوع",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w900,
                                        fontSize: 12,
                                        color: Colors.grey
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: RadioListTile(
                                        title:const Text(
                                          "ذكر",
                                          style:TextStyle(
                                            fontSize: 12,
                                          ),
                                        ),
                                        activeColor: defultColor,
                                        selected: cubit.GenderApointment == "Male" ? true : false,
                                        value: "Male",
                                        groupValue: cubit.GenderApointment,
                                        onChanged: (val){
                                          cubit.chooseGenderApointment(val!);
                                        }),
                                  ),
                                  Expanded(
                                    child: RadioListTile(
                                        title:const Text(
                                          "انثي",
                                          style:TextStyle(
                                            fontSize: 12,
                                          ),
                                        ),
                                        selected: cubit.GenderApointment == "Female" ? true : false,
                                        activeColor: defultColor,
                                        value: "Female",
                                        groupValue: cubit.GenderApointment,
                                        onChanged: (val){
                                          cubit.chooseGenderApointment(val!);
                                        }),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Row(
                                children: [
                                  const Text(
                                    "2- ",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w900,
                                        fontSize: 12,
                                        color: Colors.grey
                                    ),
                                  ),
                                  const SizedBox(width: 10,),
                                  const Text(
                                    "هل نسبة الهيموجلبين اقل من 12 ؟",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w900,
                                        fontSize: 12,
                                        color: Colors.grey
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: RadioListTile(
                                        title:const Text(
                                          "نعم",
                                          style:TextStyle(
                                            fontSize: 12,
                                          ),
                                        ),
                                        activeColor: defultColor,
                                        selected: cubit.himogloben == "1" ? true : false,
                                        value: "1",
                                        groupValue: cubit.himogloben,
                                        onChanged: (val){
                                          cubit.himoglobenApointment(val!);
                                        }),
                                  ),
                                  Expanded(
                                    child: RadioListTile(
                                        title:const Text(
                                          "لا",
                                          style:TextStyle(
                                            fontSize: 12,
                                          ),
                                        ),
                                        selected: cubit.himogloben == "0" ? true : false,
                                        activeColor: defultColor,
                                        value: "0",
                                        groupValue: cubit.himogloben,
                                        onChanged: (val){
                                          cubit.himoglobenApointment(val!);
                                        }),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Row(
                                children: [
                                  const Text(
                                    "3- ",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w900,
                                        fontSize: 12,
                                        color: Colors.grey
                                    ),
                                  ),
                                  const SizedBox(width: 10,),
                                  const Text(
                                    "هل يحتوي جسمك على اي وشوم ؟ ",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w900,
                                        fontSize: 12,
                                        color: Colors.grey
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: RadioListTile(
                                        title:const Text(
                                          "نعم",
                                          style:TextStyle(
                                            fontSize: 12,
                                          ),
                                        ),
                                        activeColor: defultColor,
                                        selected: cubit.tatoo == "1" ? true : false,
                                        value: "1",
                                        groupValue: cubit.tatoo,
                                        onChanged: (val){
                                          cubit.tatooApointment(val!);
                                        }),
                                  ),
                                  Expanded(
                                    child: RadioListTile(
                                        title:const Text(
                                          "لا",
                                          style:TextStyle(
                                            fontSize: 12,
                                          ),
                                        ),
                                        selected: cubit.tatoo == "0" ? true : false,
                                        activeColor: defultColor,
                                        value: "0",
                                        groupValue: cubit.tatoo,
                                        onChanged: (val){
                                          cubit.tatooApointment(val!);
                                        }),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Row(
                                children: [
                                  const Text(
                                    "4- ",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w900,
                                        fontSize: 12,
                                        color: Colors.grey
                                    ),
                                  ),
                                  const SizedBox(width: 10,),
                                  const Text(
                                    "هل تأخذ اي كورس علاجي هذه الفترة؟ ",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w900,
                                        fontSize: 12,
                                        color: Colors.grey
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: RadioListTile(
                                        title:const Text(
                                          "نعم",
                                          style:TextStyle(
                                            fontSize: 12,
                                          ),
                                        ),
                                        activeColor: defultColor,
                                        selected: cubit.drugs == "1" ? true : false,
                                        value: "1",
                                        groupValue: cubit.drugs,
                                        onChanged: (val){
                                          cubit.drugsApointment(val!);
                                        }),
                                  ),
                                  Expanded(
                                    child: RadioListTile(
                                        title:const Text(
                                          "لا",
                                          style:TextStyle(
                                            fontSize: 12,
                                          ),
                                        ),
                                        selected: cubit.drugs == "0" ? true : false,
                                        activeColor: defultColor,
                                        value: "0",
                                        groupValue: cubit.drugs,
                                        onChanged: (val){
                                          cubit.drugsApointment(val!);
                                        }),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Row(
                                children: [
                                  const Text(
                                    "5- ",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w900,
                                        fontSize: 12,
                                        color: Colors.grey
                                    ),
                                  ),
                                  const SizedBox(width: 10,),
                                  const Text(
                                    "هل تعاني من الأنفلونزا او من الكحة ؟ ",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w900,
                                        fontSize: 12,
                                        color: Colors.grey
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: RadioListTile(
                                        title:const Text(
                                          "نعم",
                                          style:TextStyle(
                                            fontSize: 12,
                                          ),
                                        ),
                                        activeColor: defultColor,
                                        selected: cubit.snize == "1" ? true : false,
                                        value: "1",
                                        groupValue: cubit.snize,
                                        onChanged: (val){
                                          cubit.snizeApointment(val!);
                                        }),
                                  ),
                                  Expanded(
                                    child: RadioListTile(
                                        title:const Text(
                                          "لا",
                                          style:TextStyle(
                                            fontSize: 12,
                                          ),
                                        ),
                                        selected: cubit.snize == "0" ? true : false,
                                        activeColor: defultColor,
                                        value: "0",
                                        groupValue: cubit.snize,
                                        onChanged: (val){
                                          cubit.snizeApointment(val!);
                                        }),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Column(
                            children: [
                              Row(
                                children: [
                                  const Text(
                                    "6- ",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w900,
                                        fontSize: 12,
                                        color: Colors.grey
                                    ),
                                  ),
                                  const SizedBox(width: 10,),
                                  const Text(
                                    "هل تتناول الأدوية تلك الفترة ؟ ",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w900,
                                        fontSize: 12,
                                        color: Colors.grey
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: RadioListTile(
                                        title:const Text(
                                          "نعم",
                                          style:TextStyle(
                                            fontSize: 12,
                                          ),
                                        ),
                                        activeColor: defultColor,
                                        selected: cubit.have_drugs == "1" ? true : false,
                                        value: "1",
                                        groupValue: cubit.have_drugs,
                                        onChanged: (val){
                                          cubit.have_drugsAppointment(val!);
                                        }),
                                  ),
                                  Expanded(
                                    child: RadioListTile(
                                        title:const Text(
                                          "لا",
                                          style:TextStyle(
                                            fontSize: 12,
                                          ),
                                        ),
                                        selected: cubit.have_drugs == "None" ? true : false,
                                        activeColor: defultColor,
                                        value: "None",
                                        groupValue: cubit.have_drugs,
                                        onChanged: (val){
                                          cubit.have_drugsAppointment(val!);
                                        }),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Column(
                            children: [
                              Row(
                                children: [
                                  const Text(
                                    "7- ",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w900,
                                        fontSize: 12,
                                        color: Colors.grey
                                    ),
                                  ),
                                  const SizedBox(width: 10,),
                                  const Text(
                                    "هل تعاني من اي من الأمراض ؟ ",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w900,
                                        fontSize: 12,
                                        color: Colors.grey
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: RadioListTile(
                                        title:const Text(
                                          "نعم",
                                          style:TextStyle(
                                            fontSize: 12,
                                          ),
                                        ),
                                        activeColor: defultColor,
                                        selected: cubit.desises == "1" ? true : false,
                                        value: "1",
                                        groupValue: cubit.desises,
                                        onChanged: (val){
                                          cubit.desisesApointment(val!);
                                        }),
                                  ),
                                  Expanded(
                                    child: RadioListTile(
                                        title:const Text(
                                          "لا",
                                          style:TextStyle(
                                            fontSize: 12,
                                          ),
                                        ),
                                        selected: cubit.desises == "None" ? true : false,
                                        activeColor: defultColor,
                                        value: "None",
                                        groupValue: cubit.desises,
                                        onChanged: (val){
                                          cubit.desisesApointment(val!);
                                        }),
                                  ),
                                ],
                              ),
                            ],
                          ),

                          const SizedBox(height: 10),

                          ConditionalBuilder(
                            condition: cubit.GenderApointment == "female",
                            builder: (BuildContext context) => Column(
                              children: [
                                Row( mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text('للإناث',style: TextStyle(color: Colors.red),)
                                  ],
                                ),
                                const SizedBox(height: 10),

                                Column(
                                  children: [
                                    Row(
                                      children: [
                                        const Text(
                                          "8- ",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w900,
                                              fontSize: 12,
                                              color: Colors.grey
                                          ),
                                        ),
                                        const SizedBox(width: 10,),
                                        const Text(
                                          "هل انتي في فتره الحمل او مرضعة ؟ ",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w900,
                                              fontSize: 12,
                                              color: Colors.grey
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Expanded(
                                          child: RadioListTile(
                                              title:const Text(
                                                "نعم",
                                                style:TextStyle(
                                                  fontSize: 12,
                                                ),
                                              ),
                                              activeColor: defultColor,
                                              selected: cubit.pregnancy == "1" ? true : false,
                                              value: "1",
                                              groupValue: cubit.pregnancy,
                                              onChanged: (val){
                                                cubit.pregnancyApointment(val!);
                                              }),
                                        ),
                                        Expanded(
                                          child: RadioListTile(
                                              title:const Text(
                                                "لا",
                                                style:TextStyle(
                                                  fontSize: 12,
                                                ),
                                              ),
                                              selected: cubit.pregnancy == "0" ? true : false,
                                              activeColor: defultColor,
                                              value: "0",
                                              groupValue: cubit.pregnancy,
                                              onChanged: (val){
                                                cubit.pregnancyApointment(val!);
                                              }),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    Row(
                                      children: [
                                        const Text(
                                          "9- ",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w900,
                                              fontSize: 12,
                                              color: Colors.grey
                                          ),
                                        ),
                                        const SizedBox(width: 10,),
                                        const Text(
                                          "هل انتي حاليا خلال فترة الحيض ؟ ",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w900,
                                              fontSize: 12,
                                              color: Colors.grey
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Expanded(
                                          child: RadioListTile(
                                              title:const Text(
                                                "نعم",
                                                style:TextStyle(
                                                  fontSize: 12,
                                                ),
                                              ),
                                              activeColor: defultColor,
                                              selected: cubit.menstrual == "1" ? true : false,
                                              value: "1",
                                              groupValue: cubit.menstrual,
                                              onChanged: (val){
                                                cubit.menstrualApointment(val!);
                                              }),
                                        ),
                                        Expanded(
                                          child: RadioListTile(
                                              title:const Text(
                                                "لا",
                                                style:TextStyle(
                                                  fontSize: 12,
                                                ),
                                              ),
                                              selected: cubit.menstrual == "0" ? true : false,
                                              activeColor: defultColor,
                                              value: "0",
                                              groupValue: cubit.menstrual,
                                              onChanged: (val){
                                                cubit.menstrualApointment(val!);
                                              }),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            fallback: (BuildContext context) => SizedBox(),

                          ),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ElevatedButton(
                                  onPressed: (){
                                    if(cubit.have_drugs=="None" && cubit.desises=="None" &&
                                        cubit.menstrual == "0" && cubit.pregnancy == "0" && cubit.snize == "0" && cubit.drugs == "0"
                                    && cubit.tatoo == "0" && cubit.himogloben == "0"){
                                      navigateToSecAppointment(context);
                                    }else{
                                      AwesomeDialog(
                                          context: context,
                                          animType: AnimType.scale,
                                          dialogType: DialogType.info,
                                          body: Center(child: Text(
                                            ' لابد ان تكون خالي من الامراض لكي تتبرع بالدم',
                                            style: TextStyle(fontStyle: FontStyle.italic),
                                          ),),
                                          title: 'ملحوظه ',
                                          btnOkOnPress: () {},
                                          btnOkColor: defultColor,
                                          dialogBackgroundColor: Colors.white
                                      )..show();
                                    }

                              }, child: Text('التالي',))
                            ],

                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
          );
        }
    );
  }
}
void navigateToSecAppointment(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => SecAppointment()),
  );
}
