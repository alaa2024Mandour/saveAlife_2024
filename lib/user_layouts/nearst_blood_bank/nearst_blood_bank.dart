import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import '../../shared/components/shared_component.dart';
import '../user_cubit/userCubit.dart';
import '../user_cubit/userStatus.dart';
import 'package:geocoding/geocoding.dart';
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
            child: Column(
              children: [
                Container(
                  
                ),
                defaultButton(
                  width: 300,
                    text: 'Location',
                    function: () async{
                      cubit.getPosition(context);
                     var currentLocation = await cubit.getLatitudeAndLongitude();
                       // print("Latitude ${currentLocation.altitude}");
                       // print("Longitude ${currentLocation.longitude}");
                      List<Placemark> placemarks = await placemarkFromCoordinates(31.247909,29.999596);
                      print(placemarks[0].locality);

                      //-----------------------------

                      var distanceBetween = Geolocator.distanceBetween(31.247909,29.999596, 31.193277, 29.906811);
                      var distanceKM = distanceBetween/1000;
                      print(distanceKM);
                    }
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
