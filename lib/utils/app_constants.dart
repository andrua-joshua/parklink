class AppConstants{


  ///API constants
  static const String baseUrl = "https://workplan.uict.ac.ug/api/auth";

  static const String loginStaff = "$baseUrl/loginUser";
  static const String getSingleUser = "$baseUrl/getSingleUser/";
  static const String updateSingleUser = "$baseUrl/updateUser/";
  static const String createAttendance = "$baseUrl/createAttendance";
  static const String updateAttendence = "$baseUrl/updateAttendance/";
  static const String getSingleAttendance = "$baseUrl/getSingleAttendance/";
  static const String getAllAttendance = "$baseUrl/getAllAttendances";
  static const String attendanceExists = "$baseUrl/checkTodayAttendance/"; //followed by the user password
  static const String updatePassword = "$baseUrl/changePasswordUser/"; //followed by the user id
  static const String getAttendancesByStaffId = "$baseUrl/getAttendancesbyStuff/";
  static const String checkNetworkId = "$baseUrl/checkNetworkId";

  



  ////
  ///in app data constants
  ///
  static List<String> supportString = [
    "Request Leave",
    "Training",
    "Salary Advance",
    "Allowances",
    "Anonymous Queries"
  ];


  static List<String> supportImg = [
    "assets/images/x2.jpg",
    "assets/images/x1.jpg",
    "assets/images/x2.jpg",
    "assets/images/x1.jpg",
    "assets/images/x2.jpg"
  ];


  static List<Map<String, String>> carousalItems = [
    {
      "image": "assets/images/img1.jpg",
      "link": "https://www.google.com",
      "title": "Just another shit"
    },
    {
      "image": "assets/images/img2.jpg",
      "link": "https://www.google.com",
      "title": "Just another shit two"
    },
    {
      "image": "assets/images/img3.jpg",
      "link": "https://www.google.com",
      "title": "Just another shit three"
    }
  ];
  
}