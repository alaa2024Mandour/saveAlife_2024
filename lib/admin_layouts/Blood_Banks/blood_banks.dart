import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:save_a_life_2024/admin_layouts/admin_home_page/admin_home_page.dart';

import '../../shared/components/shared_component.dart';
import '../../user_layouts/user_cubit/userCubit.dart';
import '../../user_layouts/user_cubit/userStatus.dart';

class BloodBanks extends StatelessWidget {
  @override
    Widget build(BuildContext context) {
      return BlocConsumer<UserCubit,UserStatus>(
          listener: (BuildContext context, UserStatus state) { },
          builder: (BuildContext context, UserStatus state) {
            var cubit = UserCubit.get(context);
            return   AnnotatedRegion<SystemUiOverlayStyle>(
              value: SystemUiOverlayStyle.light.copyWith(statusBarColor:Colors.transparent,),
              child: Scaffold(
                body: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Stack(
                      children: [
                        Positioned(
                          left: 0,
                          top: 25,
                          child: IconButton(
                            onPressed: () {
                              navigateTo(context, AdminHome());
                            },
                            icon: Image.asset(
                              'assets/images/icons/icons8-back-100.png',
                              width: 40,
                              height: 50,
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(top:50, bottom: 20, left: 120,right: 120),
                          child: Image.asset(
                            'assets/images/icons/icons8-glucometer-96.png',
                            width: 150,
                            height: 80,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ],
                    ),
                    DropdownButtonHideUnderline(
                      child: DropdownButton2<String>(
                        items: cubit.bloodPagesItems.map((String item) =>
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
                        value: cubit.bloodPagesValue,
                        onChanged: (value) {
                          cubit.bloodPagesMenu(value!);
                        },
                        buttonStyleData: ButtonStyleData(
                          width: 250,
                          padding: const EdgeInsets.only(left: 14, right: 14),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(14),
                            boxShadow: kElevationToShadow[2],
                          ),
                        ),
                        iconStyleData: const IconStyleData(
                          icon: Icon(
                            Icons.search,
                          ),
                          iconSize: 14,
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
                    ),
                    ConditionalBuilder(
                      condition: cubit.bloodPagesValue=="الاسكندريه",
                      builder: (BuildContext context) =>Expanded(
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: List.generate(cubit.tabs.length, (index) {
                                return TextButton(
                                  onPressed: () =>cubit.onTabPressed(index),
                                  child: Text(
                                    cubit.tabs[index],
                                    style: TextStyle(
                                      color:  cubit.selectedIndex == index ? Colors.red : Colors.black,
                                    ),
                                  ),
                                );
                              }),
                            ),
                            Divider(color: Colors.grey),
                            Expanded(
                              child:  cubit.selectedIndex==0 ? ListView.builder(
                                itemCount:  cubit.bloodQuantities.length,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 8.0, horizontal: 16.0),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          cubit.bloodTypes[index],
                                          style: TextStyle(
                                              fontSize: 24,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.red),
                                          textAlign: TextAlign.right,
                                        ),
                                        Row(
                                          children: [
                                            Expanded(
                                              child: SliderTheme(
                                                data: SliderThemeData(
                                                    trackHeight: 40
                                                ),
                                                child: Slider(
                                                  value:  cubit.bloodQuantities[index],
                                                  min: 0,
                                                  max: 500,
                                                  activeColor: Colors.deepPurple,
                                                  inactiveColor: Colors.grey,
                                                  onChanged: (value) {
                                                    cubit.changeQuantities(index,value);
                                                  },
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 50,
                                              child: Text(
                                                cubit.bloodQuantities[index].toInt().toString(),
                                                style: TextStyle(fontSize: 16),
                                                textAlign: TextAlign.right,
                                              ),
                                            ),
                                            Column(
                                              children: [
                                                addMinButton(
                                                    function: (){
                                                      cubit.addAlex(index);
                                                    },
                                                    icon: Icons.add,
                                                ),
                                                SizedBox(height: 10,),
                                                addMinButton(
                                                  function: (){
                                                    cubit.minsAlex(index);
                                                  },
                                                  icon: Icons.remove,
                                                )
                                              ],
                                            )
                                          ],
                                        ),
                                        Text(
                                          'يمكنك تغيير الكمية من الزر أدناه.',
                                          style: TextStyle(fontSize: 12, color: Colors.grey),
                                          textAlign: TextAlign.right,
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              ) :  cubit.selectedIndex==1 ? ListView.builder(
                                itemCount:  cubit.bloodQuantities.length,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 8.0, horizontal: 16.0),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text("كوم الدكه"),
                                        Text(
                                          cubit.bloodTypes[index],
                                          style: TextStyle(
                                              fontSize: 24,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.red),
                                          textAlign: TextAlign.right,
                                        ),
                                        Row(
                                          children: [
                                            Expanded(
                                              child: SliderTheme(
                                                data: SliderThemeData(
                                                    trackHeight: 40
                                                ),
                                                child: Slider(
                                                  value:  cubit.bloodQuantities[index],
                                                  min: 0,
                                                  max: 500,
                                                  activeColor: Colors.deepPurple,
                                                  inactiveColor: Colors.grey,
                                                  onChanged: (value) {
                                                    cubit.changeQuantities(index,value);
                                                  },
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 50,
                                              child: Text(
                                                cubit.bloodQuantities[index].toInt().toString(),
                                                style: TextStyle(fontSize: 16),
                                                textAlign: TextAlign.right,
                                              ),
                                            ),
                                            Column(
                                              children: [
                                                addMinButton(
                                                  function: (){
                                                    cubit.addAlex(index);
                                                  },
                                                  icon: Icons.add,
                                                ),
                                                SizedBox(height: 10,),
                                                addMinButton(
                                                  function: (){
                                                    cubit.minsAlex(index);
                                                  },
                                                  icon: Icons.remove,
                                                )
                                              ],
                                            )
                                          ],
                                        ),
                                        Text(
                                          'يمكنك تغيير الكمية من الزر أدناه.',
                                          style: TextStyle(fontSize: 12, color: Colors.grey),
                                          textAlign: TextAlign.right,
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              ) : ListView.builder(
                                itemCount:  cubit.bloodQuantities.length,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 8.0, horizontal: 16.0),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          cubit.bloodTypes[index],
                                          style: TextStyle(
                                              fontSize: 24,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.red),
                                          textAlign: TextAlign.right,
                                        ),
                                        Row(
                                          children: [
                                            Expanded(
                                              child: SliderTheme(
                                                data: SliderThemeData(
                                                    trackHeight: 40
                                                ),
                                                child: Slider(
                                                  value:  cubit.bloodQuantities[index],
                                                  min: 0,
                                                  max: 500,
                                                  activeColor: Colors.deepPurple,
                                                  inactiveColor: Colors.grey,
                                                  onChanged: (value) {
                                                    cubit.changeQuantities(index,value);
                                                  },
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 50,
                                              child: Text(
                                                cubit.bloodQuantities[index].toInt().toString(),
                                                style: TextStyle(fontSize: 16),
                                                textAlign: TextAlign.right,
                                              ),
                                            ),
                                            Column(
                                              children: [
                                                addMinButton(
                                                  function: (){
                                                    cubit.addAlex(index);
                                                  },
                                                  icon: Icons.add,
                                                ),
                                                SizedBox(height: 10,),
                                                addMinButton(
                                                  function: (){
                                                    cubit.minsAlex(index);
                                                  },
                                                  icon: Icons.remove,
                                                )
                                              ],
                                            )
                                          ],
                                        ),
                                        Text(
                                          'يمكنك تغيير الكمية من الزر أدناه.',
                                          style: TextStyle(fontSize: 12, color: Colors.grey),
                                          textAlign: TextAlign.right,
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      fallback: (BuildContext context) => Expanded(
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: List.generate(cubit.bihira_tabs.length, (index) {
                                return TextButton(
                                  onPressed: () =>cubit.bihira_onTabPressed(index),
                                  child: Text(
                                    cubit.bihira_tabs[index],
                                    style: TextStyle(
                                      color:  cubit.bihira_selectedIndex == index ? Colors.red : Colors.black,
                                    ),
                                  ),
                                );
                              }),
                            ),
                            Divider(color: Colors.grey),
                            Expanded(
                              child:  cubit.bihira_selectedIndex==0 ?
                              ListView.builder(
                                itemCount:  cubit.bihira_bloodQuantities.length,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 8.0, horizontal: 16.0),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          cubit.bloodTypes[index],
                                          style: TextStyle(
                                              fontSize: 24,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.red),
                                          textAlign: TextAlign.right,
                                        ),
                                        Row(
                                          children: [
                                            Expanded(
                                              child: SliderTheme(
                                                data: SliderThemeData(
                                                  trackHeight: 40
                                                ),
                                                child: Slider(
                                                  value:  cubit.bihira_bloodQuantities[index],
                                                  min: 0,
                                                  max: 500,
                                                  activeColor: Colors.deepPurple,
                                                  inactiveColor: Colors.grey,
                                                  onChanged: (value) {
                                                    cubit.bihira_changeQuantities(index,value);
                                                  },
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 50,
                                              child: Text(
                                                cubit.bihira_bloodQuantities[index].toInt().toString(),
                                                style: TextStyle(fontSize: 16),
                                                textAlign: TextAlign.right,
                                              ),
                                            ),
                                            Column(
                                              children: [
                                                addMinButton(
                                                  function: (){
                                                    cubit.addBihira(index);
                                                  },
                                                  icon: Icons.add,
                                                ),
                                                SizedBox(height: 10,),
                                                addMinButton(
                                                  function: (){
                                                    cubit.minsBihira(index);
                                                  },
                                                  icon: Icons.remove,
                                                )
                                              ],
                                            )
                                          ],
                                        ),
                                        Text(
                                          'يمكنك تغيير الكمية من الزر أدناه.',
                                          style: TextStyle(fontSize: 12, color: Colors.grey),
                                          textAlign: TextAlign.right,
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              ) :  ListView.builder(
                                itemCount:  cubit.bihira_bloodQuantities.length,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 8.0, horizontal: 16.0),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          cubit.bihira_bloodTypes[index],
                                          style: TextStyle(
                                              fontSize: 24,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.red),
                                          textAlign: TextAlign.right,
                                        ),
                                        Row(
                                          children: [
                                            Expanded(
                                              child: SliderTheme(
                                                data: SliderThemeData(
                                                    trackHeight: 40
                                                ),
                                                child: Slider(
                                                  value:  cubit.bihira_bloodQuantities[index],
                                                  min: 0,
                                                  max: 500,
                                                  activeColor: Colors.deepPurple,
                                                  inactiveColor: Colors.grey,
                                                  onChanged: (value) {
                                                    cubit.bihira_changeQuantities(index,value);
                                                  },
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 50,
                                              child: Text(
                                                cubit.bihira_bloodQuantities[index].toInt().toString(),
                                                style: TextStyle(fontSize: 16),
                                                textAlign: TextAlign.right,
                                              ),
                                            ),
                                            Column(
                                              children: [
                                                addMinButton(
                                                  function: (){
                                                    cubit.addBihira(index);
                                                  },
                                                  icon: Icons.add,
                                                ),
                                                SizedBox(height: 10,),
                                                addMinButton(
                                                  function: (){
                                                    cubit.minsBihira(index);
                                                  },
                                                  icon: Icons.remove,
                                                )
                                              ],
                                            )
                                          ],
                                        ),
                                        Text(
                                          'يمكنك تغيير الكمية من الزر أدناه.',
                                          style: TextStyle(fontSize: 12, color: Colors.grey),
                                          textAlign: TextAlign.right,
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              )
                            ),
                          ],
                        ),
                      ),
                    ),

                  ],
                ),
              ),
            );
          }
      );

    }
}

// void main() {
//   runApp(MaterialApp(
//     locale: Locale('ar', 'AE'), // Set Arabic locale
//     supportedLocales: [
//       Locale('ar', 'AE'),
//     ],
//     localizationsDelegates: [
//       GlobalMaterialLocalizations.delegate,
//       GlobalWidgetsLocalizations.delegate,
//     ],
//     home: Directionality(
//       textDirection: TextDirection.rtl, // Set text direction to RTL
//       child: BloodBanks(),
//     ),
//   ));
// }
