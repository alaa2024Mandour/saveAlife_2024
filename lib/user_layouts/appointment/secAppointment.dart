import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';

import '../../shared/components/shared_component.dart';

final List<String> items = [
  '+A',
  '-A',
  '+AB',
  '-AB',
  '+B',
  '-B',
  '+O',
  '-O',
];
final List<String> banks = [
  'بنك الشاطبي',
  'بنك كوم الدكة',
  'بنك الهلال الأحمر',
];

var fullNameController = TextEditingController();
var nationalId = TextEditingController();

var ageController = TextEditingController();
String? selectedValue;
String? selectedBank;

class SecAppointment extends StatefulWidget {
  @override
  State<SecAppointment> createState() => _SecAppointmentState();
}

class _SecAppointmentState extends State<SecAppointment> {
  @override
  Widget build(BuildContext context) {
    var dropDownValue;
    var dropdownBloodMenuValue;
    var dateController = TextEditingController();
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Hero(
              tag: ' begor_appointment_image',
              child: Container(
                child: Image.asset(
                    'assets/images/cerves pages/before appointment.png'),
              )),
          Positioned(
            right: MediaQuery.of(context).size.width * .355,
            top: MediaQuery.of(context).size.height * .50,
            child: Hero(
              tag: 'Company_logo_1',
              child: Container(
                child: Image.asset(
                    'assets/images/cerves pages/logo-removebg-preview.png'),
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
                      )
                    ]),
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
                        spreadRadius: 0)
                  ]),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Text(
                      'حجز موعد',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: const Color(0xFF0B11A7),
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          height: 0),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Text(
                          '   معلومات شخصية',
                          style: TextStyle(
                            color: const Color(0xFF0B11A7),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        Text(
                          '  الأسم بالكامل',
                          style: TextStyle(color: Color(0xFFADADAD)),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    defaultTextFormField(
                        controller: fullNameController,
                        type: TextInputType.name,
                        hintText: 'الاسم باكامل',
                        labelText: ' ',
                        preFix: Icons.person),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        Text(
                          '  الرقم القومي',
                          style: TextStyle(color: Color(0xFFADADAD)),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    defaultTextFormField(
                      controller: nationalId,
                      type: TextInputType.number,
                      hintText: 'الرقم القومي',
                      labelText: ' ',
                      preFix: Icons.call_to_action,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        Text(
                          '  العمر',
                          style: TextStyle(color: Color(0xFFADADAD)),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    defaultTextFormField(
                        controller: ageController,
                        type: TextInputType.number,
                        hintText: 'عمرك',
                        labelText: ' ',
                        preFix: Icons.cake),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        Text(
                          "  فصيلة دمك",
                          style: TextStyle(color: Color(0xFFADADAD)),
                        )
                      ],
                    ),
                    Container(
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton2<String>(
                          items: items
                              .map((String item) => DropdownMenuItem<String>(
                                    value: item,
                                    child: Text(
                                      item,
                                      style: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.grey,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ))
                              .toList(),
                          value: selectedValue,
                          onChanged: (String? value) {
                            setState(() {
                              selectedValue = value;
                            });
                            ;
                          },
                          buttonStyleData: ButtonStyleData(
                              padding:
                                  const EdgeInsets.only(left: 14, right: 14),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(14),
                                boxShadow: kElevationToShadow[2],
                              ),
                              width: 100),
                          iconStyleData: const IconStyleData(
                            icon: Icon(
                              Icons.menu,
                            ),
                            iconSize: 14,
                            iconEnabledColor: Colors.red,
                          ),
                          dropdownStyleData: DropdownStyleData(
                            maxHeight: 200,
                            width: 80,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(14),
                              color: Colors.white,
                            ),
                            offset: const Offset(-20, 0),
                            scrollbarTheme: ScrollbarThemeData(
                              radius: const Radius.circular(40),
                              thickness: MaterialStateProperty.all(5),
                              thumbVisibility: MaterialStateProperty.all(true),
                            ),
                          ),
                          menuItemStyleData: const MenuItemStyleData(
                            height: 30,
                            padding: EdgeInsets.only(left: 14, right: 14),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        Text(
                          ' اختار بنك الدم الاقرب ليك',
                          style: TextStyle(color: Color(0xFFADADAD)),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton2<String>(
                          items: banks
                              .map((String bank) => DropdownMenuItem<String>(
                                    value: bank,
                                    child: Text(
                                      bank,
                                      style: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.grey,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ))
                              .toList(),
                          value: selectedBank,
                          onChanged: (String? value) {
                            setState(() {
                              selectedBank = value;
                            });
                            ;
                          },
                          buttonStyleData: ButtonStyleData(
                              padding:
                                  const EdgeInsets.only(left: 14, right: 14),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(14),
                                boxShadow: kElevationToShadow[2],
                              ),
                              width: double.infinity),
                          iconStyleData: const IconStyleData(
                            icon: Icon(
                              Icons.menu,
                            ),
                            iconSize: 14,
                            iconEnabledColor: Colors.red,
                          ),
                          dropdownStyleData: DropdownStyleData(
                            maxHeight: 200,
                            width: 450,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(14),
                              color: Colors.white,
                            ),
                            offset: const Offset(-20, 0),
                            scrollbarTheme: ScrollbarThemeData(
                              radius: const Radius.circular(40),
                              thickness: MaterialStateProperty.all(5),
                              thumbVisibility: MaterialStateProperty.all(true),
                            ),
                          ),
                          menuItemStyleData: const MenuItemStyleData(
                            height: 30,
                            padding: EdgeInsets.only(left: 14, right: 14),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        Text(
                          '   تاريخ الزيارة',
                          style: TextStyle(color: Color(0xFFADADAD)),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: (TextFormField(
                              controller: dateController,
                              //editing controller of this TextField
                              decoration: const InputDecoration(
                                  icon: Icon(Icons.calendar_today),
                                  //icon of text field
                                  labelText: "أدخل التاريخ" //label text of field
                                  ),

                              // when true user cannot edit text
                              onTap: () async {
                                DateTime? pickedDate = await showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(), //get today's date
                                    firstDate:DateTime.now(), //DateTime.now() - not to allow to choose before today.
                                    lastDate: DateTime(2101)
                                );
                                //when click we have to show the datepicker


                                if (pickedDate != null) {
                                  String formattedDate =
                                  DateFormat('yyyy-MM-dd').format(pickedDate);
                                  setState(() {
                                    dateController.text = formattedDate;
                                  });

                                  setState(() {
                                    dateController.text = formattedDate;                                   });
                                }else{
                                  print("Date is not selected");
                                }
                              })),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15,

                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(onPressed: (){}, child: Text('تأكيد'))
                      ],
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
