import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:save_a_life_2024/user_layouts/appointment/secAppointment.dart';

class Appointment extends StatefulWidget {
  @override
  State<Appointment> createState() => _AppointmentState();
}

class _AppointmentState extends State<Appointment> {
  Gender? selectedGender;
  Answer? selectedAnswer;
  Answer3? selectedAnswer3;
  Answer4? selectedAnswer4;
  Answer5? selectedAnswer5;
  Answer6? selectedAnswer6;
  Answer7? selectedAnswer7;

  Map<String, bool> booleanMap = {
    'med1': false,
    'med2': false,
    'med3': false,
    'med4': false,
    'med5': false,
    'des1': false,
    'des2': false,
    'des3': false,
    'des4': false,
    'des5': false,
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                          '   اسئلة هامة:',
                          style: TextStyle(
                            color: Color(0xFF0B11A7),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Text(
                          '   1      -   النوع :  ',
                          style: TextStyle(color: Color(0xFFADADAD)),
                        ),
                        Text(
                          'ذكر',
                          style: TextStyle(color: Color(0xFFADADAD)),
                        ),
                        Radio<Gender>(
                          value: Gender.male,
                          groupValue: selectedGender,
                          onChanged: (value) {
                            setState(() {
                              selectedGender = value;
                            });
                          },
                        ),
                        SizedBox(width: 20),
                        Text(
                          'أنثى',
                          style: TextStyle(color: Color(0xFFADADAD)),
                        ),
                        Radio<Gender>(
                          value: Gender.female,
                          groupValue: selectedGender,
                          onChanged: (value) {
                            setState(() {
                              selectedGender = value;
                            });
                          },
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Text(
                          '   2 -هل نسبة الهيموجلبين اقل من 12 ؟',
                          style: TextStyle(color: Color(0xFFADADAD)),
                        ) //السؤال التاني
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Text('                           نعم'),
                        Radio<Answer>(
                          value: Answer.yes,
                          groupValue: selectedAnswer,
                          onChanged: (value) {
                            setState(() {
                              selectedAnswer = value;
                            });
                          },
                        ),
                        Text("        لا"),
                        Radio<Answer>(
                          value: Answer.no,
                          groupValue: selectedAnswer,
                          onChanged: (value) {
                            setState(() {
                              selectedAnswer = value;
                            });
                          },
                        ),
                        SizedBox(width: 20),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Text('    3  - هل يحتوي جسمك على اي وشوم ؟ ',
                            style: TextStyle(color: Color(0xFFADADAD))),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Text('                           نعم'),
                        Radio<Answer3>(
                          value: Answer3.yes3,
                          groupValue: selectedAnswer3,
                          onChanged: (value) {
                            setState(() {
                              selectedAnswer3 = value;
                            });
                          },
                        ),
                        Text("        لا"),
                        Radio<Answer3>(
                          value: Answer3.no3,
                          groupValue: selectedAnswer3,
                          onChanged: (value) {
                            setState(() {
                              selectedAnswer3 = value;
                            });
                          },
                        ),
                        SizedBox(width: 20),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Text('    4-هل تأخذ اي كورس علاجي هذه الفترة؟  ',
                            style: TextStyle(color: Color(0xFFADADAD)))
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Text('                           نعم'),
                        Radio<Answer4>(
                          value: Answer4.yes4,
                          groupValue: selectedAnswer4,
                          onChanged: (value) {
                            setState(() {
                              selectedAnswer4 = value;
                            });
                          },
                        ),
                        Text("        لا"),
                        Radio<Answer4>(
                          value: Answer4.no4,
                          groupValue: selectedAnswer4,
                          onChanged: (value) {
                            setState(() {
                              selectedAnswer4 = value;
                            });
                          },
                        ),
                        SizedBox(width: 20),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Text('    5- هل تعاني من الأنفلونزا او من الكحة ؟  ',
                            style: TextStyle(color: Color(0xFFADADAD)))
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Text('                           نعم'),
                        Radio<Answer5>(
                          value: Answer5.yes5,
                          groupValue: selectedAnswer5,
                          onChanged: (value) {
                            setState(() {
                              selectedAnswer5 = value;
                            });
                          },
                        ),
                        Text("        لا"),
                        Radio<Answer5>(
                          value: Answer5.no5,
                          groupValue: selectedAnswer5,
                          onChanged: (value) {
                            setState(() {
                              selectedAnswer5 = value;
                            });
                          },
                        ),
                        SizedBox(width: 20),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Text('6-ما هي الأدوية التي كنت تتناولها تلك الفترة ؟',
                            style: TextStyle(color: Color(0xFFADADAD)))
                      ],
                    ),
                    const SizedBox(height: 10),
                    Column(
                      children: [
                        Row(
                          children: [
                            Text('    مسكنات الألام'),
                            Spacer(),
                            Checkbox(
                                value: booleanMap['med1'],
                                onChanged: (newValue) {
                                  setState(() {
                                    booleanMap['med1'] = newValue!;
                                  });
                                })
                          ],
                        ),
                        Row(
                          children: [
                            Text('    مميعات الدم'),
                            Spacer(),
                            Checkbox(
                                value: booleanMap['med2'],
                                onChanged: (newValue) {
                                  setState(() {
                                    booleanMap['med2'] = newValue!;
                                  });
                                })
                          ],
                        ),
                        Row(
                          children: [
                            Text('    مضادات حيوية'),
                            Spacer(),
                            Checkbox(
                                value: booleanMap['med3'],
                                onChanged: (newValue) {
                                  setState(() {
                                    booleanMap['med3'] = newValue!;
                                  });
                                })
                          ],
                        ),
                        Row(
                          children: [
                            Text('    أدوية نفسية'),
                            Spacer(),
                            Checkbox(
                                value: booleanMap['med4'],
                                onChanged: (newValue) {
                                  setState(() {
                                    booleanMap['med4'] = newValue!;
                                  });
                                })
                          ],
                        ),
                        Row(
                          children: [
                            Text('  لا شئ مما سبق'),
                            Spacer(),
                            Checkbox(
                                value: booleanMap['med5'],
                                onChanged: (newValue) {
                                  setState(() {
                                    booleanMap['med5'] = newValue!;
                                  });
                                })
                          ],
                        )
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Text('    5- هل تعاني من اي من الأمراض التالية؟  ',
                            style: TextStyle(color: Color(0xFFADADAD)))
                      ],
                    ),
                    const SizedBox(height: 10),
                    Column(
                      children: [
                        Row(
                          children: [
                            Text('    الإيدز'),
                            Spacer(),
                            Checkbox(
                                value: booleanMap['des1'] ?? false,
                                onChanged: (newValue) {
                                  setState(() {
                                    booleanMap['des1'] = newValue!;
                                  });
                                })
                          ],
                        ),
                        Row(
                          children: [
                            Text('    مرض الزهري'),
                            Spacer(),
                            Checkbox(
                                value: booleanMap['des2'] ?? false,
                                onChanged: (newValue) {
                                  setState(() {
                                    booleanMap['des2'] = newValue!;
                                  });
                                })
                          ],
                        ),
                        Row(
                          children: [
                            Text('    التهاب الكبد الفيروسي'),
                            Spacer(),
                            Checkbox(
                                value: booleanMap['des3'] ?? false,
                                onChanged: (newValue) {
                                  setState(() {
                                    booleanMap['des3'] = newValue!;
                                  });
                                })
                          ],
                        ),
                        Row(
                          children: [
                            Text('    مالاريا'),
                            Spacer(),
                            Checkbox(
                                value: booleanMap['des4'] ?? false,
                                onChanged: (newValue) {
                                  setState(() {
                                    booleanMap['des4'] = newValue!;
                                  });
                                })
                          ],
                        ),
                        Row(
                          children: [
                            Text('  الأنيميا'),
                            Spacer(),
                            Checkbox(
                                value: booleanMap['des5'] ?? false,
                                onChanged: (newValue) {
                                  setState(() {
                                    booleanMap['des5'] = newValue!;
                                  });
                                })
                          ],
                        )
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row( mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('إذا كنتي انثي',style: TextStyle(color: Colors.red),)
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Row(
                          children: [
                            Text('    5- هل انتي حامل او مرضعة ؟  ',
                                style: TextStyle(color: Color(0xFFADADAD)))
                          ],
                        ),


                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Text('                           نعم'),
                        Radio<Answer6>(
                          value: Answer6.yes6,
                          groupValue: selectedAnswer6,
                          onChanged: (value) {
                            setState(() {
                              selectedAnswer6 = value;
                            });
                          },
                        ),
                        Text("        لا"),
                        Radio<Answer6>(
                          value: Answer6.no6,
                          groupValue: selectedAnswer6,
                          onChanged: (value) {
                            setState(() {
                              selectedAnswer6 = value;
                            });
                          },
                        ),
                        SizedBox(width: 20),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Row(
                          children: [
                            Text('    5- هل انتي جاليا خلال فترة الحيض ؟  ',
                                style: TextStyle(color: Color(0xFFADADAD)))
                          ],
                        ),



                      ],
                    ),
                    const SizedBox(height: 10),

                    Row(
                      children: [
                        Text('                           نعم'),
                        Radio<Answer7>(
                          value: Answer7.yes7,
                          groupValue: selectedAnswer7,
                          onChanged: (value) {
                            setState(() {
                              selectedAnswer7 = value;
                            });
                          },
                        ),
                        Text("        لا"),
                        Radio<Answer7>(
                          value: Answer7.no7,
                          groupValue: selectedAnswer7,
                          onChanged: (value) {
                            setState(() {
                              selectedAnswer7 = value;
                            });
                          },
                        ),
                        SizedBox(width: 20),
                      ],
                    ),
                   const SizedBox(height: 10,)
                   , Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(onPressed: (){
                          navigateToSecAppointment(context);
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
    );
  }
}
void navigateToSecAppointment(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => SecAppointment()),
  );
}



enum Gender { male, female }

enum Answer { yes, no, yes3, no3 }

enum Answer3 { yes3, no3 }

enum Answer4 { yes4, no4 }

enum Answer5 { yes5, no5 }
enum Answer6 { yes6, no6 }
enum Answer7 { yes7, no7 }