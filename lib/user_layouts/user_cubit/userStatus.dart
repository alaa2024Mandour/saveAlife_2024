import 'package:save_a_life_2024/shared/network/remote/modules/userModel.dart';

abstract class UserStatus{}

class UserInitState extends UserStatus {}

class ShowNotificationState extends UserStatus {}

class TestBloodTypeState extends UserStatus {}

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

class BloodTypesBookingState extends UserStatus {}

//------------------------- for booking -----------------------------------
class BookingGenderState extends UserStatus {}

class BookingHemoglobineState extends UserStatus {}

class BookingTatooState extends UserStatus {}

class BookingdrugsState extends UserStatus {}

class BookingSnizeState extends UserStatus {}

class BookingPregnancyState extends UserStatus {}

class BookingMenstrualState extends UserStatus {}

class BookingCheckboxState extends UserStatus {}

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

//--------------- Get User Data States ---------------
class loadingGetData extends UserStatus {}

class sucssesGetData extends UserStatus { }

class errorGetData extends UserStatus {
  final String errorMessage ;

  errorGetData(this.errorMessage);
}

//--------------- Booking User States ---------------
class BookingAppointmentSuccess extends UserStatus {}

class BookingAppointmentLoading extends UserStatus { }

class BookingAppointmentError extends UserStatus {
  final String errorMessage ;

  BookingAppointmentError(this.errorMessage);
}

//--------------- Get notification States ---------------
class loadingGetNotification extends UserStatus {}

class sucssesGetNotification extends UserStatus {}

class errorGetNotification extends UserStatus {
  final String errorMessage ;

  errorGetNotification(this.errorMessage);
}

//--------------------- Admin connection status ----------------------------
class AdminloadingSignIn extends UserStatus {}

class AdminsucssesSignIn extends UserStatus {}

class AdminerrorSignIn extends UserStatus {
  final String errorMessage ;

  AdminerrorSignIn(this.errorMessage);
}

//--------------- Get Admin Data States ---------------
class loadingAdminGetData extends UserStatus {}

class sucssesAdminGetData extends UserStatus { }

class errorAdminGetData extends UserStatus {
  final String errorMessage ;

  errorAdminGetData(this.errorMessage);
}

//--------------------- Admin send data status ----------------------------
class AdminloadingSendData extends UserStatus {}

class AdminsucssesSendData extends UserStatus {}

class AdminerrorSendData extends UserStatus {
  final String errorMessage ;

  AdminerrorSendData(this.errorMessage);
}


//--------------------- Admin send data status ----------------------------
class AdminloadingGetUsersData extends UserStatus {}

class AdminSucssesGetUsersData extends UserStatus {}

class AdminErrorGetUsersData extends UserStatus {
  final String errorMessage ;

  AdminErrorGetUsersData(this.errorMessage);
}

//--------------------- Admin send users to donors list status ----------------------------
class AdminloadingSendUsersToDonors  extends UserStatus {}

class AdminSucssesSendUsersToDonors extends UserStatus {}

class AdminErrorSendUsersToDonors extends UserStatus {
  final String errorMessage ;

  AdminErrorSendUsersToDonors(this.errorMessage);
}

class SucssesSendingDonors  extends UserStatus {}

//--------------------- Get donors list status ----------------------------
class AdminloadingGetDonorsData  extends UserStatus {}

class AdminSucssesGetDonorsData extends UserStatus {}

class AdminErrorSendGetDonorsData extends UserStatus {
  final String errorMessage ;

  AdminErrorSendGetDonorsData(this.errorMessage);
}

//--------------------- delete donors  status ----------------------------
class AdminloadingDeleteDonorsData  extends UserStatus {}

class AdminSucssesDeleteDonorsData extends UserStatus {}

class AdminErrorSendDeleteDonorsData extends UserStatus {
  final String errorMessage ;

  AdminErrorSendDeleteDonorsData(this.errorMessage);
}