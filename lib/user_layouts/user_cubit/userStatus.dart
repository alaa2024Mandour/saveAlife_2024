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