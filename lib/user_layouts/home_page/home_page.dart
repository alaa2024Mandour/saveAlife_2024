
import 'package:curved_labeled_navigation_bar/curved_navigation_bar.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:save_a_life_2024/shared/style/colors.dart';
import 'package:save_a_life_2024/user_layouts/user_cubit/userSubit.dart';
import 'package:save_a_life_2024/user_layouts/user_cubit/userCubitstatus.dart';

class UserHomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: BlocProvider(
        create: (BuildContext context) => UserCubit(),
        child: BlocConsumer<UserCubit,UserStatus>(
          listener: (BuildContext context, UserStatus state) {  },
          builder: (BuildContext context, UserStatus state) {
            var cubit = UserCubit.get(context);
            return Scaffold(
              extendBody: true,
              floatingActionButtonLocation: FloatingActionButtonLocation.miniEndFloat,
              floatingActionButton: FloatingActionButton(
                onPressed: () {  },
                child: Image(image: AssetImage('assets/images/icons/icons8-robot-60.png'),fit: BoxFit.fill,width: 43,),
              ),
              body: cubit.bottomScreen[cubit.currentIndex],
              bottomNavigationBar: Theme(
                data: Theme.of(context).copyWith(
                  iconTheme:IconThemeData(color: Colors.white),
                ),
                child: CurvedNavigationBar(
                  backgroundColor: Colors.transparent,
                  buttonBackgroundColor: defultColor,
                  animationDuration: Duration(milliseconds: 300),
                  color: HexColor('#CDCDCD'),
                  onTap: (index){
                    cubit.changeNavBottom(index);
                  },
                  index: cubit.currentIndex,
                  items: [
                    CurvedNavigationBarItem(
                        child:Icon(Icons.location_on,),
                        label: " بنوك الدم",
                    ),
                    CurvedNavigationBarItem(
                        child: Icon(Icons.date_range_rounded,),
                        label: "للحجز"
                    ),
                    CurvedNavigationBarItem(
                        child: Icon(Icons.bloodtype_sharp,),
                         label: "الرئيسيه"
                     ),
                    CurvedNavigationBarItem(
                        child: Icon(Icons.share,),
                        label: "شارك"
                    ),
                    CurvedNavigationBarItem(
                        child: Icon(Icons.person,),
                        label: "معلوماتك"
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
