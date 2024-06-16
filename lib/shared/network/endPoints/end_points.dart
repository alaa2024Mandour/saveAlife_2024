class EndPoints {
  static String basURL="https://blood-bank.aboomarmediclub.com/",
                logIn = "api/auth/login",
                signUp="api/auth/register",
                adminLogIn = "api/auth/admin/login",
                adminSendData = "api/auth/admin/upload-medical-reports",
                userData = "api/auth/user/profile",
                AdminData = "api/auth/admin/profile",
                userNotification = "api/auth/user/profile",
                booking_endpoint = "api/auth/user/store-booking"
  ;
  static String getUserDataEndPoint(id){
    return "user/get-user/$id";
}
}


class ApiKeys {
  static String status = "status_code",
                errorMessage="message",
                email="email",
                password="password",
                message="message",
                token="access_token",
                Authorization="Authorization",
                birthday="birthday",
                id="id",
                name="name",
                phone="phone",
                confirmPassword="password_confirmation",
                city="city",
                government="address",
                profilePic="avatar",
                gender="gender",
                avatar="avatar",
                bloodtype="bloodtype",
                report_link="report_link",
                user_id="user_id",
                bank_id="bank_id",
                date_id="date_id",
                time_id="time_id",
                full_name="full_name",
                national_id="national_id",
                hemoglobin_less_than_12="hemoglobin_less_than_12",
                has_tattoo="has_tattoo",
                completed_antibiotic_course="completed_antibiotic_course",
                suffering_from_influenza_or_cough="suffering_from_influenza_or_cough",
                medications="medications",
                diseases="diseases",
                is_pregnant_or_breastfeeding="is_pregnant_or_breastfeeding",
                is_menstruating="is_menstruating",
                age="age"
  ;
}