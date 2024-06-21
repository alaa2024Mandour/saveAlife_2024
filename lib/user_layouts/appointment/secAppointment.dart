import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../shared/components/shared_component.dart';
import '../../shared/style/colors.dart';
import '../user_cubit/userCubit.dart';
import '../user_cubit/userStatus.dart';




class SecAppointment extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var dropDownValue;
    var dropdownBloodMenuValue;
    var dateController = TextEditingController();
    var timeController = TextEditingController();
    return BlocConsumer<UserCubit,UserStatus>(
        listener: (BuildContext context, UserStatus state) {  },
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
                                  controller: cubit.fullNameController,
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
                                controller: cubit.nationalId,
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
                                  controller: cubit.ageController,
                                  type: TextInputType.number,
                                  hintText: 'عمرك',
                                  labelText: ' ',
                                  preFix: Icons.cake),
                              SizedBox(
                                height: 15,
                              ),
                              Row(
                                children: [
                                  Icon(Icons.bloodtype,color: defultColor),
                                  const SizedBox(width: 10,),
                                  const Text(
                                    "زمرة الدم",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w900,
                                        fontSize: 12,
                                        color: Colors.grey
                                    ),
                                  ),
                                  const SizedBox(width: 15,),
                                  DropdownButtonHideUnderline(
                                    child: DropdownButton2<String>(
                                      items: cubit.bloodTypesBookingItems.map((String item) =>
                                          DropdownMenuItem<String>(
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
                                      value: cubit.bloodTypesBookingMenuValue,
                                      onChanged: (value) {
                                        cubit.bloodTypesBookingMenu(value!);
                                      },
                                      buttonStyleData: ButtonStyleData(
                                          padding: const EdgeInsets.only(left: 14, right: 14),
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.circular(14),
                                            boxShadow: kElevationToShadow[2],
                                          ),
                                          width: 100
                                      ),
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
                                ],
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Row(
                                children: [
                                  Icon(Icons.location_on_rounded, color: defultColor,),
                                  Text(
                                    ' المحافظه',
                                    style: TextStyle(color: Color(0xFFADADAD)),
                                  ),
                                  SizedBox(
                                    width: 15,
                                  ),
                                  Container(
                                    child: DropdownButtonHideUnderline(
                                          child: DropdownButton2<String>(
                                            items: cubit.cityBookingItems.map((String item) =>
                                                DropdownMenuItem<String>(
                                                  value: item,
                                                  child: Text(
                                                    item,
                                                    style: const TextStyle(
                                                      fontSize: 10,
                                                      fontWeight: FontWeight.bold,
                                                      color: Colors.grey,
                                                    ),
                                                    overflow: TextOverflow.ellipsis,
                                                  ),
                                                ))
                                                .toList(),
                                            value: cubit.cityBookingValue,
                                            onChanged: (value) {
                                              cubit.cityBookingMenu(value!);
                                            },
                                            buttonStyleData: ButtonStyleData(
                                              padding: const EdgeInsets.only(left:14, right: 14),
                                              decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius: BorderRadius.circular(14),
                                                boxShadow: kElevationToShadow[2],
                                              ),
                                            ),
                                            iconStyleData: const IconStyleData(
                                              icon: Icon(
                                                Icons.menu,
                                              ),
                                              iconSize: 10,
                                              iconEnabledColor: Colors.red,
                                            ),
                                            dropdownStyleData: DropdownStyleData(
                                              maxHeight: 300,
                                              width: 200,
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
                                        )
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Row(
                                children: [
                                  Icon(Icons.location_city, color: defultColor,),
                                  Text(
                                    ' اختار بنك الدم الاقرب ليك',
                                    style: TextStyle(color: Color(0xFFADADAD)),
                                  ),
                                  SizedBox(
                                    width: 15,
                                  ),
                                  Container(
                                    child:ConditionalBuilder(
                                      condition: cubit.cityBookingValue == 'الاسكندريه',
                                      builder: (BuildContext context) {
                                        return DropdownButtonHideUnderline(
                                          child: DropdownButton2<String>(
                                            items: cubit.bloodBanksAlexBookingItems.map((String item) =>
                                                DropdownMenuItem<String>(
                                                  value: item,
                                                  child: Text(
                                                    item,
                                                    style: const TextStyle(
                                                      fontSize: 10,
                                                      fontWeight: FontWeight.bold,
                                                      color: Colors.grey,
                                                    ),
                                                    overflow: TextOverflow.ellipsis,
                                                  ),
                                                ))
                                                .toList(),
                                            value: cubit.bloodBanksAlexBookingValue,
                                            onChanged: (value) {
                                              cubit.bloodBanksAlexBookingMenu(value!);
                                            },
                                            buttonStyleData: ButtonStyleData(
                                              padding: const EdgeInsets.only(left:14, right: 14),
                                              decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius: BorderRadius.circular(14),
                                                boxShadow: kElevationToShadow[2],
                                              ),
                                            ),
                                            iconStyleData: const IconStyleData(
                                              icon: Icon(
                                                Icons.menu,
                                              ),
                                              iconSize: 10,
                                              iconEnabledColor: Colors.red,
                                            ),
                                            dropdownStyleData: DropdownStyleData(
                                              maxHeight: 300,
                                              width: 200,
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
                                        );
                                      },
                                      fallback: (BuildContext context) {
                                        return DropdownButtonHideUnderline(
                                          child: DropdownButton2<String>(
                                            items: cubit.bloodBanksElbihiraBookingItems.map((String item) =>
                                                DropdownMenuItem<String>(
                                                  value: item,
                                                  child: Text(
                                                    item,
                                                    style: const TextStyle(
                                                      fontSize: 10,
                                                      fontWeight: FontWeight.bold,
                                                      color: Colors.grey,
                                                    ),
                                                    overflow: TextOverflow.ellipsis,
                                                  ),
                                                ))
                                                .toList(),
                                            value: cubit.bloodBanksElbihiraBookingValue,
                                            onChanged: (value) {
                                              cubit.bloodBanksElbihiraBookingMenu(value!);
                                            },
                                            buttonStyleData: ButtonStyleData(
                                              padding: const EdgeInsets.only(left: 14, right: 14),
                                              decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius: BorderRadius.circular(14),
                                                boxShadow: kElevationToShadow[2],
                                              ),
                                            ),
                                            iconStyleData: const IconStyleData(
                                              icon: Icon(
                                                Icons.menu,
                                              ),
                                              iconSize: 10,
                                              iconEnabledColor: Colors.red,
                                            ),
                                            dropdownStyleData: DropdownStyleData(
                                              maxHeight: 200,
                                              width: 200,
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
                                        );
                                      },

                                    ),
                                  ),
                                ],
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
                                              dateController.text = formattedDate;
                                          }else{
                                            print("Date is not selected");
                                          }
                                        })),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 25,

                              ),

                              Row(
                                children: [
                                  Text(
                                    '   ميعاد الزيارة',
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
                                        controller: timeController,
                                        //editing controller of this TextField
                                        decoration: const InputDecoration(
                                            icon: Icon(Icons.calendar_today),
                                            //icon of text field
                                            labelText: "أدخل الساعه" //label text of field
                                        ),

                                        // when true user cannot edit text
                                        onTap: () async {
                                         await showTimePicker(
                                             context: context,
                                             initialTime: TimeOfDay.now()).then(
                                                 (value) {
                                               timeController.text=value!.format(context).toString();
                                               print(value.format(context));
                                             });
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
                                  ElevatedButton(onPressed: (){
                                    cubit.Booking(context);
                                  }, child: Text('تأكيد'))
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              )
          );
        }
    );
  }
}
