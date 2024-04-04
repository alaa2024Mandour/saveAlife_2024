import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../shared/components/shared_component.dart';
import '../user_cubit/userCubit.dart';
import '../user_cubit/userStatus.dart';

class NearestBank extends StatelessWidget {
  const NearestBank({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserCubit,UserStatus>(
      listener: (BuildContext context, state) {  },
      builder: (BuildContext context, state) {
        var cubit = UserCubit.get(context);
        return Scaffold(
          body: Center(
            child: defaultButton(
              width: 300,
                text: 'Location',
                function: () async{
                  cubit.getPosition(context);
                 var currentLocation = await cubit.getLatitudeAndLongitude();
                   print("Altitude ${currentLocation.altitude}");
                 print("Longitude ${currentLocation.longitude}");
                 cubit.getPosition(context);
                }
            ),
          ),
        );
      },
    );
  }
}
