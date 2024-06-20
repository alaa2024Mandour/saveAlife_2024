import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:save_a_life_2024/shared/components/shared_component.dart';
import 'package:save_a_life_2024/shared/style/colors.dart';
import '../../shared/network/remote/modules/bookedUsersModel.dart';
import '../../shared/network/remote/modules/donors_model.dart' as donor;
import '../../user_layouts/user_cubit/userCubit.dart';
import '../../user_layouts/user_cubit/userStatus.dart';
import '../admin_home_page/admin_home_page.dart';

class DonorsScreen extends StatelessWidget {
  const DonorsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserCubit, UserStatus>(
        listener: (BuildContext context, UserStatus state) {},
        builder: (BuildContext context, UserStatus state) {
          var cubit = UserCubit.get(context);
          return AnnotatedRegion<SystemUiOverlayStyle>(
            value: SystemUiOverlayStyle.light.copyWith(
              statusBarColor: Colors.transparent,
            ),
            child: Scaffold(
              appBar: AppBar(
                scrolledUnderElevation: 0.0,
                leading: IconButton(
                    onPressed: () {
                      navigateTo(context, AdminHome());
                    },
                    icon: Icon(
                      Icons.arrow_back_ios,
                    )),
              ),
              body: Column(
                children: [
                  Container(
                    child: Column(
                      children: [
                        CircleAvatar(
                          radius: 35,
                          backgroundColor: Colors.white,
                          child: Image(
                            image: AssetImage('assets/images/icons/splash.png'),
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Row(
                          children: [
                            Spacer(),
                            TextButton(
                                onPressed: () {
                                  cubit.isUser = true;
                                  if (cubit.isUser) {
                                    cubit.isUserColor = defultColor;
                                    cubit.isDonorColor = Colors.grey;
                                  }
                                  cubit.togeleUserDonor();
                                },
                                child: Text(
                                  'المستخدمين',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: cubit.isUserColor,
                                  ),
                                )),
                            Spacer(),
                            TextButton(
                                onPressed: () {
                                  cubit.isUser = false;
                                  if (!cubit.isUser) {
                                    cubit.isDonorColor = defultColor;
                                    cubit.isUserColor = Colors.grey;
                                  }
                                  cubit.togeleUserDonor();
                                },
                                child: Text(
                                  'المتبرعين',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: cubit.isDonorColor,
                                  ),
                                )),
                            Spacer(),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  ),
                  ConditionalBuilder(
                    condition: cubit.isUser,
                    builder: (BuildContext context) {
                      return Expanded(
                        child: Column(
                          children: [
                            Text(
                              'جميع المتبرعين',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: TextFormField(
                                decoration: InputDecoration(
                                  prefixIcon: Icon(Icons.search),
                                  labelText: 'بحث ',
                                  border: OutlineInputBorder(),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Table(
                                border: TableBorder.all(
                                    width: 1, color: Colors.white),
                                children: [
                                  TableRow(children: [
                                    Text(
                                      'الاسم',
                                      style: TextStyle(fontSize: 12),
                                    ),
                                    Text(
                                      'العمر',
                                      style: TextStyle(fontSize: 12),
                                    ),
                                    Text(
                                      'النوع',
                                      style: TextStyle(fontSize: 12),
                                    ),
                                    Text(
                                      'زمره الدم',
                                      style: TextStyle(fontSize: 12),
                                    ),
                                    Text(
                                      'الحدث',
                                      style: TextStyle(fontSize: 12),
                                    ),
                                  ]),
                                ],
                              ),
                            ),
                            Expanded(
                              child: ListView.separated(
                                itemBuilder: (BuildContext context, int index) =>
                                    DonorModelRow(
                                        model: cubit.donorsList!.donors[index],
                                        fun: (){
                                        }),
                                separatorBuilder: (BuildContext context, int index) =>SizedBox(height: 2,),
                                itemCount: cubit.donorsList!.donors.length,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                    fallback: (BuildContext context) {
                      return Expanded(
                        child: Column(
                          children: [
                            Text(
                              'جميع المستخدمين',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: TextFormField(
                                decoration: InputDecoration(
                                  prefixIcon: Icon(Icons.search),
                                  labelText: 'بحث ',
                                  border: OutlineInputBorder(),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Table(
                                border: TableBorder.all(
                                    width: 1, color: Colors.white),
                                children: [
                                  TableRow(children: [
                                    Text(
                                      'الاسم',
                                      style: TextStyle(fontSize: 12),
                                    ),
                                    Text(
                                      'العمر',
                                      style: TextStyle(fontSize: 12),
                                    ),
                                    Text(
                                      'النوع',
                                      style: TextStyle(fontSize: 12),
                                    ),
                                    Text(
                                      'زمره الدم',
                                      style: TextStyle(fontSize: 12),
                                    ),
                                    Text(
                                      'الحدث',
                                      style: TextStyle(fontSize: 12),
                                    ),
                                  ]),
                                ],
                              ),
                            ),
                            Expanded(
                              child: ListView.separated(
                                itemBuilder: (BuildContext context, int index) =>
                                UserModelRow(
                                    model: cubit.usersList!.bookings[index],
                                    fun: (){
                                      cubit.showDonors(cubit.usersList!.bookings[index].booking_id.toString());
                                    }),
                                separatorBuilder: (BuildContext context, int index) =>SizedBox(height: 2,),
                                itemCount: cubit.usersList!.bookings.length,
                              ),
                            ),

                          ],
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          );
        });
  }
}



Widget UserModelRow({required Bookings model,required Function fun}) => Padding(
  padding: const EdgeInsets.all(8.0),
  child: Table(
    border: TableBorder.all(
        width: 1, color: Colors.white),
    children: [
      TableRow(children: [
        Text(
          '${model.name}',
          style: TextStyle(fontSize: 12),
          overflow: TextOverflow.ellipsis,
        ),
        Text(
          '${model.age}',
          style: TextStyle(fontSize: 12),
        ),
        Text(
          '${model.gender}',
          style: TextStyle(fontSize: 12),
        ),
        Text(
          '${model.bloodtype}',
          style: TextStyle(fontSize: 12),
        ),
        defaultButton(
            color: Colors.blue,
            text: "قبول",
            function: () {
              fun();
            },
            radius: 50,
            fontSize: 10),
      ]),
    ],
  ),
);

Widget DonorModelRow({required donor.Donors model ,required Function fun}) => Padding(
  padding: const EdgeInsets.all(8.0),
  child: Table(
    border: TableBorder.all(
        width: 1, color: Colors.white),
    children: [
      TableRow(children: [
        Text(
          '${model.name}',
          style: TextStyle(fontSize: 12),
          overflow: TextOverflow.ellipsis,
        ),
        Text(
          '${model.age}',
          style: TextStyle(fontSize: 12),
        ),
        Text(
          '${model.gender}',
          style: TextStyle(fontSize: 12),
        ),
        Text(
          '${model.bloodtype}',
          style: TextStyle(fontSize: 12),
        ),
        defaultButton(
            color: defultColor,
            text: "حذف",
            function: () {
              fun();
            },
            radius: 50,
            fontSize: 10),
      ]),
    ],
  ),
);
