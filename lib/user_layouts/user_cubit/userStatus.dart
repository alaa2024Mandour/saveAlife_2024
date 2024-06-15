import 'package:save_a_life_2024/shared/network/remote/modules/userModel.dart';

abstract class UserStatus{}

class UserInitState extends UserStatus {}

class UserChangeBottomNavState extends UserStatus {}

class UserShoeNotificationState extends UserStatus {}

class DonorCityState extends UserStatus {}

class RegisterCityState extends UserStatus {}

class RegisterGovernmentAlexState extends UserStatus {}

class RegisterGovernmentElbihiraState extends UserStatus {}

class UserGenderState extends UserStatus {}

class UserBloodTypeState extends UserStatus {}

class UserChangePassStatus extends UserStatus {}

class UserLocationStatus extends UserStatus {}

class SignUpGetProfileImage extends UserStatus {}

class UploadResult extends UserStatus {}

class TogelUserDonor extends UserStatus {}

class selectBloodBank extends UserStatus {}

class bihira_selectBloodBank extends UserStatus {}

class selectAlexBloodPageQuantities extends UserStatus {}

class selectBihiraBloodPageQuantities extends UserStatus {}

class bloodPagesCity extends UserStatus {}

class addAlexQuantities extends UserStatus {}

class minsAlexQuantities extends UserStatus {}

class addBihiraQuantities extends UserStatus {}

class minsBihiraQuantities extends UserStatus {}
//------------------------- for booking -----------------------------------
class BookingGenderState extends UserStatus {}

class BookingHemoglobineState extends UserStatus {}

class BookingTatooState extends UserStatus {}

class BookingdrugsState extends UserStatus {}

class BookingSnizeState extends UserStatus {}
//--------------------- connection status ----------------------------
//--------------- SignIn States ---------------
class loadingSignIn extends UserStatus {}

class sucssesSignIn extends UserStatus {}

class errorSignIn extends UserStatus {
  final String errorMessage ;

  errorSignIn(this.errorMessage);
}

//--------------- Sign Up States ---------------
class loadingSignUp extends UserStatus {}

class sucssesSignUp extends UserStatus {
  final String message ;

  sucssesSignUp(this.message);
}

class errorSignUp extends UserStatus {
  final String errorMessage ;

  errorSignUp(this.errorMessage);
}

//--------------- Sign Up States ---------------
class loadingGetData extends UserStatus {}

class sucssesGetData extends UserStatus {
  // final UserModel user ;
  //
  // sucssesGetData({required this.user});
}

class errorGetData extends UserStatus {
  final String errorMessage ;

  errorGetData(this.errorMessage);
}


//--------------------- Admin connection status ----------------------------
class AdminloadingSignIn extends UserStatus {}

class AdminsucssesSignIn extends UserStatus {}

class AdminerrorSignIn extends UserStatus {
  final String errorMessage ;

  AdminerrorSignIn(this.errorMessage);
}

//--------------------- Admin send data status ----------------------------
class AdminloadingSendData extends UserStatus {}

class AdminsucssesSendData extends UserStatus {}

class AdminerrorSendData extends UserStatus {
  final String errorMessage ;

  AdminerrorSendData(this.errorMessage);
}