import 'dart:async';
import 'dart:io';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:http/http.dart';
import 'package:image_picker/image_picker.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:save_a_life_2024/shared/network/core/API/api_consumer.dart';
import 'package:save_a_life_2024/shared/network/endPoints/end_points.dart';
import 'package:save_a_life_2024/shared/network/core/errors/Exceptions.dart';
import 'package:save_a_life_2024/shared/network/local/cachHelper.dart';
import 'package:save_a_life_2024/shared/network/remote/modules/admin_get_data.dart';
import 'package:save_a_life_2024/shared/network/remote/modules/notefication_model.dart';
import 'package:save_a_life_2024/shared/network/remote/modules/signInModel.dart';
import 'package:save_a_life_2024/shared/network/remote/modules/userModel.dart';
import 'package:save_a_life_2024/user_layouts/user_cubit/userStatus.dart';
import '../../admin_layouts/admin_home_page/admin_home_page.dart';
import '../../shared/components/shared_component.dart';
import '../../shared/network/remote/modules/admin_signIn_model.dart';
import '../../shared/network/remote/modules/bookedUsersModel.dart';
import '../../shared/network/remote/modules/donors_model.dart';
import '../../shared/network/remote/modules/signUpModel.dart';
import '../../shared/style/colors.dart';
import '../appointment/appointment.dart';
import '../home_page/home_page.dart';
import '../home_page/userHome.dart';
import '../nearst_blood_bank/nearst_blood_bank.dart';
import '../profile_setting/profile.dart';
import '../sharingApp/share.dart';

class UserCubit extends Cubit<UserStatus> {
  UserCubit(this.api) : super(UserInitState());

  static UserCubit get(context) => BlocProvider.of(context);

  int currentIndex = 2;

  List<Widget> bottomScreen = [
    NearestBank(),
    Appointment(),
    UserHome(),
    const UserProfile(),
    const SharingApp(),
  ];

  void changeNavBottom(int index) {
    currentIndex = index;
    emit(UserChangeBottomNavState());
  }

  //==============================
  bool haveNotification = true;
  bool showNotification = false;
  void ShowNotification(){
    showNotification =! showNotification;
    emit(ShowNotificationState());
  }

  String bloodTypeValueTest(String value ){
    emit(TestBloodTypeState());
    return value;
  }

  void show (val){
    bloodTypeValueTest(val);

  }

  //---------Choose Gender--------------
  String Gender = "male";
  void ChooseGender(String value) {
    Gender = value;
    emit(UserGenderState());
    print(Gender);
  }




  //--------------Booking Appointment------------------
  String GenderApointment = "male";
  void chooseGenderApointment(String value) {
    GenderApointment = value;
    emit(BookingGenderState());
    print(GenderApointment);
  }

  String himogloben = "0";
  void himoglobenApointment(String value) {
    himogloben = value;
    emit(BookingHemoglobineState());
    print(himogloben);
  }

  String tatoo = "0";
  void tatooApointment(String value) {
    tatoo = value;
    emit(BookingTatooState());
    print(tatoo);
  }


  String drugs = "0";
  void drugsApointment(String value) {
    drugs = value;
    emit(BookingdrugsState());
    print(drugs);
  }

  String snize = "0";
  void snizeApointment(String value) {
    snize = value;
    emit(BookingSnizeState());
    print(snize);
  }

  String pregnancy = "0";
  void pregnancyApointment(String value) {
    pregnancy = value;
    emit(BookingPregnancyState());
    print(pregnancy);
  }

  String menstrual = "0";
  void menstrualApointment(String value) {
    menstrual = value;
    emit(BookingMenstrualState());
    print(menstrual);
  }

  String desises = "None";
  void desisesApointment(String value) {
    desises = value;
    emit(BookingMenstrualState());
    print(desises);
  }


  String have_drugs = "None";
  void have_drugsAppointment(String value) {
    have_drugs = value;
    emit(BookingMenstrualState());
    print(have_drugs);
  }


  final List<String> bloodTypesBookingItems = [
    'A+',
    'A-',
    'AB-',
    'AB+',
    'B+',
    'B+',
    'O+',
    'O-',
  ];
  String bloodTypesBookingMenuValue = 'A+';
  void bloodTypesBookingMenu(String value) {
    bloodTypesBookingMenuValue = value;
    emit(BloodTypesBookingState());
  }

  final List<String> cityBookingItems = [
    'الاسكندريه',
    'البحيره',
  ];
  String cityBookingValue = 'الاسكندريه';
  void cityBookingMenu(String value) {
    cityBookingValue = value;
    emit(BloodTypesBookingState());
  }

  final List<String> bloodBanksAlexBookingItems = [
    'الشاطبي',
    'كوم الدكه',
    'الهلال الاحمر',
  ];
  String bloodBanksAlexBookingValue = 'الشاطبي';
  void bloodBanksAlexBookingMenu(String value) {
    bloodBanksAlexBookingValue = value;
    emit(BloodTypesBookingState());
  }


  final List<String> bloodBanksElbihiraBookingItems = [
    'ابو حمص',
    'كوم حماده',
  ];
  String bloodBanksElbihiraBookingValue = 'ابو حمص';
  void bloodBanksElbihiraBookingMenu(String value) {
    bloodBanksElbihiraBookingValue = value;
    emit(BloodTypesBookingState());
  }


  //---------City Search--------------
  final List<String> donorCityitems = [
    'البحث عن متبرعين في محافظه',
    'الاسكندريه',
    'البحيره',
  ];
  String donorCityMenuValue = 'البحث عن متبرعين في محافظه';
  void donorCityMenu(String value) {
    donorCityMenuValue = value;
    emit(DonorCityState());
  }

  final List<String> bloodBanktems = [
    'الاسكندريه',
    'البحيره',
  ];
  String bloodBankValue = 'الاسكندريه';
  void bloodBankMenu(String value) {
    bloodBankValue = value;
    emit(DonorCityState());
  }

  //---------Choose blood type--------------

  final List<String> items = [
    'A+',
    'A-',
    'AB-',
    'AB+',
    'B+',
    'B+',
    'O+',
    'O-',
  ];
  String dropdownBloodMenuValue = 'A+';
  void BloodTypeMenu(String value) {
    dropdownBloodMenuValue = value;
    emit(UserBloodTypeState());
  }

  //===========password login form =============
  IconData suffixIcon = Icons.visibility_outlined;
  bool isPassword = true;
  void changePasswordVisibility() {
    isPassword = !isPassword;
    suffixIcon =
        isPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined;
    emit(UserChangePassStatus());
  }

//=========== Nearest blood bank =============
//------------- open location ---------------
  Future getPosition(context) async {
    bool services;
    LocationPermission per;
    services = await Geolocator.isLocationServiceEnabled();
    print(services);
    if (!services) {
      AwesomeDialog(
        context: context,
        title: "Services",
        body: Text("Services Not Enable"),
      ).show();
    }

    per = await Geolocator.checkPermission();

    if (per == LocationPermission.denied) {
      per = await Geolocator.requestPermission();
      if (per == LocationPermission.whileInUse ||
          per == LocationPermission.always) {
        getLatitudeAndLongitude();
      }
    }
    print(per);
    emit(UserLocationStatus());
  }

  Future<Position> getLatitudeAndLongitude() async {
    return await Geolocator.getCurrentPosition().then((value) => value);
  }

  var KomEdekaLat = 53.35;
  var KomEdekaLong = 9.6;
  var ElHelalaLat = 53.4833;
  var ElHelalaLong = 10.3667;
  var ElshatbyaLat = 55.5833;
  var ElshatbyLong = 12.95;
  Future<dynamic> getDistance(lat, long) async {
    var currentLocation = await getLatitudeAndLongitude();
    // print("Latitude ${currentLocation.altitude}");
    // print("Longitude ${currentLocation.longitude}");
    List<Placemark> placemarks = await placemarkFromCoordinates(
        currentLocation.altitude, currentLocation.longitude);
    print(placemarks[0].administrativeArea);

    //-----------------------------
    var distanceBetween = Geolocator.distanceBetween(
        currentLocation.altitude, currentLocation.longitude, lat, long);
    dynamic distanceKM = distanceBetween / 1000;
    print(distanceKM);
    return distanceKM;
  }



  // -------------- AdminController ----------------
  // -------------- Upload files controller ----------------
  var donorID = TextEditingController();
  var donorReport = TextEditingController();

  String? fileName;
  Future uploadFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result != null) {
      File file = File(result.files.single.path ?? " ");

      fileName = file.path.split('/').last;
      String filePath = file.path;

      onSendProgress:
      (int send, int total) {
        print("$send , $total");
      };
      emit(UploadResult());
    } else {
      print("Result is null");
    }
  }

// -------------- Togel between user and donor ----------------
  bool isUser = true;
  Color isUserColor = Colors.grey;
  Color isDonorColor = defultColor;
  void togeleUserDonor() {
    isUser = !isUser;
    emit(TogelUserDonor());
  }

// -------------- Blood Pages Control ----------------
  //------------Alex Blood Pages------------
  int selectedIndex = 0;

  List<String> tabs = ["الشاطبي", "كوم الدكة", "الهلال الأحمر"];
  List<double> bloodQuantities = [458, 254, 356, 320, 342, 34, 50];
  List<String> bloodTypes = ['B+', 'B-', 'A+', 'A-', 'AB+', 'O+', 'O-'];

  void onTabPressed(int index) {
    selectedIndex = index;
    emit(selectBloodBank());
  }

  void changeQuantities(index, value) {
    bloodQuantities[index] = value;
    emit(selectAlexBloodPageQuantities());
  }

  void addAlex(index) {
    bloodQuantities[index]++;
    emit(addAlexQuantities());
  }

  void minsAlex(index) {
    bloodQuantities[index]--;
    emit(minsAlexQuantities());
  }

//------------Behira Blood Pages------------
  int bihira_selectedIndex = 0;

  List<String> bihira_tabs = ["بنك دم دمنهور", "بنك دم ابو حمص"];
  List<double> bihira_bloodQuantities = [458, 254, 356, 320, 342, 34, 50];
  List<String> bihira_bloodTypes = ['B+', 'B-', 'A+', 'A-', 'AB+', 'O+', 'O-'];

  void bihira_onTabPressed(int index) {
    bihira_selectedIndex = index;
    emit(bihira_selectBloodBank());
  }

  void bihira_changeQuantities(index, value) {
    bihira_bloodQuantities[index] = value;
    emit(selectBihiraBloodPageQuantities());
  }

  void addBihira(index) {
    bihira_bloodQuantities[index]++;
    emit(addBihiraQuantities());
  }

  void minsBihira(index) {
    bihira_bloodQuantities[index]--;
    emit(minsBihiraQuantities());
  }

  //------------City Blood Pages------------
  final List<String> bloodPagesItems = [
    'الاسكندريه',
    'البحيره',
  ];
  String bloodPagesValue = 'الاسكندريه';
  void bloodPagesMenu(String value) {
    bloodPagesValue = value;
    emit(bloodPagesCity());
  }

  //-------------- signup city and goverment ----------------
  final List<String> regesterCityitems = [
    'الاسكندريه',
    'البحيره',
  ];
  String registerCityMenuValue = 'الاسكندريه';
  void registerCityMenu(String value) {
    registerCityMenuValue = value;
    emit(RegisterCityState());
  }

  final List<String> registerGovernmentAlexItems = [
     'حي العامرية',
     'حي الجمرك',
     'حي المنتزه',
     'حي غرب اسكندرية',
    'حي شرق اسكندرية',
    'حي وسط اسكندرية',
  ];
  String registerGovernmentAlexValue = 'حي العامرية';
  void registerGovernmentAlexMenu(String value) {
    registerGovernmentAlexValue = value;
    emit(RegisterGovernmentAlexState());
  }

  final List<String> registerGovernmentElbihiraItems = [
    'أبو المطامير',
    'أبو حمص',
    'إيتاي البارود',
  'بدر',
  'حوش عيسى',
  'دلنجات',
  'دمنهور',
  'الرحمانية',
  'رشيد',
  'شبراخيت',
  'كفر الدوار',
  'كوم حمادة',
  'المحمودية',
  'وادى النطرون',
  ];
  String registerGovernmentElbihiraValue = 'دمنهور';
  void registerGovernmentElbihiraMenu(String value) {
    registerGovernmentElbihiraValue = value;
    emit(RegisterGovernmentElbihiraState());
  }

  //===============================================================
  //=================== Database connections  ======================
//================================================================
 final ApiConsumer api;
  //===================== SignIn Function ======================
SignInModel? user;
void signIn(String email, String password,context) async{
   try {
     emit(loadingSignIn());
     final response = await api.post(
       EndPoints.logIn,
       data: {
         ApiKeys.email:email,
         ApiKeys.password:password
       },
     );
     user = SignInModel.fromJson(response);
     final decodedToken = JwtDecoder.decode(user!.token);
     CacheHelper().saveData(key: ApiKeys.token, value: user!.token);
     print('==========Error is =${user?.error}==========');
     // CacheHelper().saveData(key: ApiKeys.id, value: decodedToken[ApiKeys.id]);
     emit(sucssesSignIn());
     getUserData(context);
   } on ServerException catch (e) {
     // TODO
     emit(errorSignIn(e.errorModel.ErrorMessage));
   }
}

  //============== UploadProfileImage Function ===============
  XFile? profilePicture;
  uploadImage(XFile image) async {
    profilePicture = image;
    emit(SignUpGetProfileImage());
  }
//========================== uploading image to api networking ==========================
    Future uploadImageToAPI(XFile image) async{
      final file = File(image.path);
      MultipartFile.fromPath(
        'avatar',
        file.path,
        filename: image.path.split('/').last,
      );
  }
  //===================== SignUp Function ======================
  var emailController = TextEditingController();
  var passController = TextEditingController();
  var rePassController = TextEditingController();
  var nameController = TextEditingController();
  var phoneController = TextEditingController();
  var birthDayController = TextEditingController();
  var addressController = TextEditingController();

  SignUpModel ? userSignUp;
  void signUp(context) async{
    try {
      emit(loadingSignUp());
      final response = await api.post(
        EndPoints.signUp,
        isFormData: true,
        data: {
          ApiKeys.name:nameController.text,
          ApiKeys.birthday: birthDayController.text,
          ApiKeys.city: registerCityMenuValue,
          ApiKeys.phone: phoneController.text,
          ApiKeys.bloodtype:dropdownBloodMenuValue,
          ApiKeys.gender:Gender,
          ApiKeys.email:emailController.text,
          ApiKeys.password: passController.text,
          ApiKeys.confirmPassword: rePassController.text,
          ApiKeys.avatar: await uploadImageToAPI(profilePicture!),
          ApiKeys.government: registerCityMenuValue == 'الاسكندريه' ? registerGovernmentAlexValue : registerGovernmentElbihiraValue,
        },
      );
      userSignUp = SignUpModel.fromJson(response);
      final decodedToken = JwtDecoder.decode(user!.token);
      print(decodedToken['id']);
      emit(sucssesSignUp(userSignUp!.message));
    } on ServerException catch (e) {
      // TODO
      emit(errorSignUp(e.errorModel.ErrorMessage));
    }
  }

  //===================== Get User Data Function ======================
  UserModel ? userGet;
 getUserData(context) async{
    try {
      emit(loadingGetData());
       final response = await api.get(
        EndPoints.userData,
      );
      emit(sucssesGetData());
      userGet = UserModel.fromjson(response);
      getUserNotification();
      navigateTo(context, UserHomePage());
    } on ServerException catch (e) {
      emit(errorGetData( e.errorModel.ErrorMessage));
    }}

  NotificationModel ? notification;
  getUserNotification() async{
    try {
      emit(loadingGetNotification());
      final response = await api.get(
        EndPoints.userNotification,
      );
      notification = NotificationModel.fromjson(response);
      emit(sucssesGetNotification());
    } on ServerException catch (e) {
      emit(errorGetNotification( e.errorModel.ErrorMessage));
    }}

  //===================== Booking Function ======================
  var fullNameController = TextEditingController();
  var nationalId = TextEditingController();
  var ageController = TextEditingController();

  void Booking(context) async{
    try {
      emit(BookingAppointmentLoading());
      final response = await api.post(
        EndPoints.booking_endpoint,
        isFormData: true,
        data: {
          ApiKeys.bank_id:"1",
          ApiKeys.date_id:"17",
          ApiKeys.time_id:"36",
          ApiKeys.full_name: fullNameController.text,
          ApiKeys.national_id:nationalId.text,
          ApiKeys.age:ageController.text,
          ApiKeys.gender:GenderApointment,
          ApiKeys.hemoglobin_less_than_12: himogloben,
          ApiKeys.has_tattoo: tatoo,
          ApiKeys.completed_antibiotic_course:drugs,
          ApiKeys.suffering_from_influenza_or_cough: snize,
          ApiKeys.medications: have_drugs,
          ApiKeys.is_pregnant_or_breastfeeding: pregnancy,
          ApiKeys.is_menstruating: menstrual,
          ApiKeys.diseases:desises,
        },
      );
      emit(BookingAppointmentSuccess());
      navigateTo(context, UserHomePage());
    } on ServerException catch (e) {
      // TODO
      emit(BookingAppointmentError(e.errorModel.ErrorMessage));
    }
  }

  //======================== Admin Functions ==========================
  //===================== Admin SignIn Function ======================
  AdminSignInModel? admin;
  void adminSignIn(String email, String password,context) async{
    try {
      emit(AdminloadingSignIn());
      final response = await api.post(
        EndPoints.adminLogIn,
        data:{
          ApiKeys.email:email,
          ApiKeys.password:password
        },
      );
      admin = AdminSignInModel.fromJson(response);
      final decodedToken = JwtDecoder.decode(admin!.token);
      CacheHelper().saveData(key: ApiKeys.token, value: admin!.token);
      CacheHelper().saveData(key: ApiKeys.id, value: decodedToken[ApiKeys.id]);
      emit(AdminsucssesSignIn());
      getAdminData();
      navigateTo(context, AdminHome());
    } on ServerException catch (e) {
      emit(AdminerrorSignIn(e.errorModel.ErrorMessage));
    }
  }

  //-----------------------GetAdmin data----------------------
  AdminModel ? adminGet;
  getAdminData() async{
    try {
      emit(loadingAdminGetData());
      final response = await api.get(
        EndPoints.AdminData,
      );
      emit(sucssesAdminGetData());
      getUsersBookingData();
      getDonorsData();
      adminGet = AdminModel.fromjson(response);
      print("==============${adminGet!.name}==================");
    } on ServerException catch (e) {
      emit(errorAdminGetData( e.errorModel.ErrorMessage));
    }
  }
//===================== Admin send data ======================
  void adminSendDatafun(context) async{
    try {
      emit(AdminloadingSendData());
       api.post(
        EndPoints.adminSendData,
        isFormData: true,
        data: {
          ApiKeys.report_link:donorReport.text,
          ApiKeys.user_id: donorID.text,
                },
      );
      emit(AdminsucssesSendData());
      navigateTo(context, AdminHome());
    } on ServerException catch (e){
      // TODO
      emit(AdminerrorSendData(e.errorModel.ErrorMessage));
    }
  }

  //-----------------------Get Users List data----------------------
  BookingUsersModel ? usersList;
  getUsersBookingData() async{
    try {
      emit(AdminloadingGetUsersData());
      final response = await api.get(
        EndPoints.get_usersBooking,
      );
      emit(AdminSucssesGetUsersData());
      usersList = BookingUsersModel.fromjson(response);
    } on ServerException catch (e) {
      emit(AdminErrorGetUsersData( e.errorModel.ErrorMessage));
    }
  }

  //-----------------------Post Donors List data----------------------
  sendUsers_to_donors_list(booking_id) async{
    try {
      emit(AdminloadingSendUsersToDonors());
      final response = await api.post(
        EndPoints.send_users_to_donors,
        data: {
          ApiKeys.book_id:booking_id,
        },
      );
      emit(AdminSucssesSendUsersToDonors());
    } on ServerException catch (e) {
      emit(AdminErrorSendUsersToDonors( e.errorModel.ErrorMessage));
    } }
  //-----------------------Get Donors List data----------------------
  DonorsModel ? donorsList;
  getDonorsData() async{
    try {
      emit(AdminloadingGetDonorsData());
      final response = await api.get(
        EndPoints.get_donors_donors,
      );
      emit(AdminSucssesGetDonorsData());
      donorsList = DonorsModel.fromjson(response);
    } on ServerException catch (e) {
      emit(AdminErrorSendGetDonorsData( e.errorModel.ErrorMessage));
    } }

  void showDonors(booking_id){
    sendUsers_to_donors_list(booking_id);
    getDonorsData();
    getUsersBookingData();
    emit(SucssesSendingDonors());
  }

  //=====================delete donor======================
  void delete_donor(id) async{
    try {
      emit(AdminloadingDeleteDonorsData());
      final response = await api.delete(
        EndPoints.delete_donor(id),
        data:{
          ApiKeys.userId_delete:id,
        },
      );
      emit(AdminSucssesDeleteDonorsData());
    } on ServerException catch (e) {
      emit(AdminErrorSendDeleteDonorsData(e.errorModel.ErrorMessage));
    }
  }
}

class bloodTypesModel {
  final String bloodType;

  bloodTypesModel({required this.bloodType}) {}
}

List<bloodTypesModel> bloodTypeList = [
  bloodTypesModel(bloodType: '+A'),
  bloodTypesModel(bloodType: '-A'),
  bloodTypesModel(bloodType: '+B'),
  bloodTypesModel(bloodType: '-B'),
  bloodTypesModel(bloodType: '+AB'),
  bloodTypesModel(bloodType: '-AB'),
  bloodTypesModel(bloodType: '+O'),
  bloodTypesModel(bloodType: '-O'),
];

Widget BloodType(bloodTypesModel model) => GestureDetector(
      onTap: () {},
      child: CircleAvatar(
        radius: 25,
        backgroundColor: defultColor,
        child: Center(
          child: Text(
            '${model.bloodType}',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w700,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );

Widget Donors() => Padding(
      padding: EdgeInsetsDirectional.symmetric(horizontal: 5, vertical: 10),
      child: Container(
        padding: EdgeInsetsDirectional.all(10),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(19),
            boxShadow: [
              BoxShadow(
                color: HexColor('#C4C4C4'),
                blurRadius: 4.0,
                spreadRadius: 2.0,
              ),
            ]),
        child: Row(
          children: [
            Container(
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(35)),
              child: Image(
                image: AssetImage('assets/images/icons/male.jpg'),
                width: 70,
                height: 70,
                fit: BoxFit.fill,
              ),
            ),
            Spacer(),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                Text(
                  'Mohammed Ahmad',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                    color: Colors.black,
                  ),
                ),
                Row(
                  children: [
                    Text(
                      'الحاله',
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                        color: Colors.green,
                      ),
                    ),
                    Text(
                      ', النوع,',
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                        color: HexColor("#D9D9D9"),
                      ),
                    ),
                    Text(
                      ' 01112602464',
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                        color: HexColor("#D9D9D9"),
                      ),
                    ),
                  ],
                )
              ],
            ),
            Spacer(),
            Text(
              "+B",
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 24,
                color: defultColor,
              ),
            ),
          ],
        ),
      ),
    );
