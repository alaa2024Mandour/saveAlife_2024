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
class loadingSignIn extends UserStatus {}

class sucssesSignIn extends UserStatus {}

class errorSignIn extends UserStatus {
  final String errorMessage ;

  errorSignIn(this.errorMessage);
}

class loadingSignUp extends UserStatus {}

class sucssesSignUp extends UserStatus {
  final String message ;

  sucssesSignUp(this.message);
}

class errorSignUp extends UserStatus {
  final String errorMessage ;

  errorSignUp(this.errorMessage);
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