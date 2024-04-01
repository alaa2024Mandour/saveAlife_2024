import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:hexcolor/hexcolor.dart';

import '../user_cubit/userCubit.dart';
import '../user_cubit/userStatus.dart';

class UserProfile extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => UserCubit(),
      child: BlocConsumer<UserCubit,UserStatus>(
        listener: (BuildContext context, UserStatus state) {  },
    builder: (BuildContext context, UserStatus state) {
      var cubit = UserCubit.get(context);
      return Directionality(
        textDirection: TextDirection.rtl,
            child: Text ("Your info"),
      );
    }
      ),
    );
  }
}
