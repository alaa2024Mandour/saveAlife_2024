class EndPoints {
  static String basURL="https://blood-bank.aboomarmediclub.com/",
                logIn = "api/auth/login",
                signUp="api/auth/register",
                adminLogIn = "api/auth/admin/login",
                adminSendData = "api/auth/admin/upload-medical-reports",
                userData = "api/auth/user/profile";
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
                user_id="user_id";

}