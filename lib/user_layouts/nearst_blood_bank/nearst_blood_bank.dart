import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';

import '../../shared/components/shared_component.dart';
import '../Login_page/signup form.dart';
import '../user_cubit/userCubit.dart';
import '../user_cubit/userStatus.dart';

class NearestBank extends StatelessWidget {
  const NearestBank({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => UserCubit()..getPosition(),
      child: BlocConsumer<UserCubit,UserStatus>(
        listener: (BuildContext context, state) {  },
        builder: (BuildContext context, state) {
          var cubit = UserCubit.get(context);
          return Scaffold(
            body: Center(
              child: defaultButton(
                width: 300,
                  text: 'Location',
                  function: (){
                    cubit.getPosition();
                  }
              ),
            ),
          );
        },
      ),
    );
  }
}
