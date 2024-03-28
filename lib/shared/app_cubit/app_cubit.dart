import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:union/models/task_model.dart';
import 'package:union/modules/ProfilePage.dart';
import '../../modules/CalenderPage.dart';
import '../../modules/GroupPages.dart';
import '../../modules/TasksPage.dart';
import '../styles/colors.dart';
import '/shared/app_cubit/app_states.dart';
import 'dart:math';

class AppCubit extends Cubit<AppStates> {
  AppCubit(this.context) : super(AppInitialState());

  final BuildContext context;

  static AppCubit get(context) => BlocProvider.of(context);

  var cWidth = 500.0;

  void changeCWidth(){
    if(cWidth == 500.0){
      cWidth = 50;
    }else if (cWidth == 50.0){
      cWidth = 500;
    }
    emit(ChangeCWidthState());
  }

  void showSnack(String text){
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Container(
          height: 65,
          decoration: BoxDecoration(
            color: Colors.green,
            borderRadius: const BorderRadius.all(Radius.circular(10)),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0,vertical: 5.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Congratulations!",
                  style: GoogleFonts.alata(
                    color: whiteColor,
                    fontSize: 22,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(text),
              ],
            ),
          ),
        ),
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
    );
  }
  void showError(String text){
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Container(
          height: 60,
          decoration: BoxDecoration(
            color: errorColor,
            borderRadius: const BorderRadius.all(Radius.circular(10)),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0,vertical: 5.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Error!",
                  style: TextStyle(
                      color: whiteColor,
                      fontSize: 20,
                      fontFamily: "LeagueSpartan"),
                ),
                Text(text),
              ],
            ),
          ),
        ),
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
    );
  }

  //Navbar Functions..

  int currentIndex = 0;

  var pages = [
    const TasksPage(),
    const GroupsPage(),
    const CalenderPage(),
    const ProfilePage(),
  ];

  var pagesNames = [
    "Tasks",
    "Groups",
    "Calender",
    "Profile",
  ];

  void changeNavigationPage(int value) {
      currentIndex = value;
      emit(ChangeNavigationPageState());
  }
  /////////////////////////

  var maleAvatars = ["male1.png", "male2.png", "male3.png", "male4.png", "male5.png", "male6.png"];
  var femaleAvatars = ["female1.png", "female2.png", "female3.png", "female4.png", "female5.png", "female6.png"];

  //////////////// Pop Up Menu /////////////////
  String status1 = "To Do";
  String status2 = "Doing";
  String status3 = "Done";
  String statusTitle = "To Do";

  void changeMenuStatus(String newValue){
    statusTitle = newValue;
    emit(ChangeNavStatusState());
  }

  /////////////// Calender Functions ///////////////
  DateTime focusDayCalender = DateTime.now();
  DateTime focusDayAdd = DateTime.now();
  String dayString = "Today";

  void onDaySelectedCalender(DateTime selcDay, DateTime focDay){
    focusDayCalender = focDay;
    daySelectedCalender(focDay);
    emit(OnDaySelectedState());
  }

  bool isSameDay(DateTime dayOne, DateTime dayTwo){
    return dayOne == dayTwo;
  }

  void daySelectedCalender(DateTime day){
    if(day.day == DateTime.now().day && day.month == DateTime.now().month && day.year == DateTime.now().year){
      dayString = "Today . ${day.day} ${monthSting(day.month)} ${day.year}";
    }else{
      dayString = "${day.day} ${monthSting(day.month)} ${day.year}";
    }
    emit(DaySelectedState());
  }

  void onDaySelected(DateTime selcDay, DateTime focDay){
    focusDayAdd = focDay;
    emit(OnDaySelectedState());
  }

  String monthSting(int monthInt) {
    switch (monthInt) {
      case 1:
        return "Jan";
      case 2:
        return "Feb";
      case 3:
        return "Mar";
      case 4:
        return "Apr";
      case 5:
        return "May";
      case 6:
        return "Jun";
      case 7:
        return "Jul";
      case 8:
        return "Aug";
      case 9:
        return "Sep";
      case 10:
        return "Oct";
      case 11:
        return "Nov";
      case 12:
        return "Dec";
      default:
        return "Jan";
    }
  }
////////////////////// User /////////////
  String? uID;

  void generateUniqueId() {
    const String _chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
    final Random _rnd = Random.secure();
    String id = '';
    for (int i = 0; i < 8; i++) {
      id += _chars[_rnd.nextInt(_chars.length)];
    }
    uID = id;
    print(uID);
  }

  void setData() async {
    generateUniqueId();
    print(uID);
    var data = {
      'id': "41",
      'name': "Electric Circuits",
      'code': "ECEN 101",
      '2nd code': "",
      'core': "Physics Core",
    };

    await FirebaseFirestore.instance
        .collection("users")
        .doc(uID)
        .collection("tasks")
        .doc()
        .set(data)
        .then((value) {
      print("value added");
    });
  }
  //////////////////Task///////////////////
  var title = "";
  void changeTextPopMenu(String value) {
    title = value;
    emit(EditTextPopMenuSuccessfullyState());
  }

  Future<void> addTask(String date,String title,String startTime,String endTime, String? description, String category,) async {
    emit(AddTaskLoadingState());
    changeCWidth();
    TaskModel task = TaskModel(date: date, title: title, startTime: startTime, endTime: endTime, description: description, category: category);

    await FirebaseFirestore.instance
        .collection("users")
        .doc(uID)
        .collection("tasks")
        .doc()
        .set(task.toMap())
        .then((value) {
          Future.delayed(
              Duration(seconds: 3)).then(
                  (value) {
                    changeCWidth();
                    emit(AddTaskSuccessfullyState());
                    Navigator.pop(context);
                    showSnack("Your new task added successfully!");
                  }
          );
    });
  }
  
  ////////////////// Time Packer //////////////
  int startHour = 0;
  int startMinute = 0;
  int startTimeFormat = 0;

  int endHour = 0;
  int endMinute = 0;
  int endTimeFormat = 0;

  void changeNumber(mainValue, editedValue){
    if(mainValue == 1){
      startHour= editedValue+1;
    }else if(mainValue == 2){
      startMinute= editedValue+1;
    }else if(mainValue == 3){
      endHour= editedValue+1;
    }else if(mainValue == 4){
      endMinute= editedValue+1;
    }else if(mainValue == 5){
      startTimeFormat= editedValue;
      print(startTimeFormat);
    }else if(mainValue == 6){
      endTimeFormat= editedValue;
      print(endTimeFormat);
    }
  }


/////////////////////
}