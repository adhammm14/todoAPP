import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:table_calendar/table_calendar.dart';

import '../shared/app_cubit/app_cubit.dart';
import '../shared/app_cubit/app_states.dart';
import '../shared/components/components.dart';
import '../shared/styles/colors.dart';
import '../shared/styles/iconsax_icons.dart';

class AddBottomSheet extends StatefulWidget {
  const AddBottomSheet({super.key});

  @override
  State<AddBottomSheet> createState() => _AddBottomSheetState();
}

class _AddBottomSheetState extends State<AddBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => AppCubit(context),
      child: BlocConsumer<AppCubit, AppStates>(
          listener: (context, state) {},
          builder: (context, state) {
            AppCubit cubit = AppCubit.get(context);
            var screenWidth = MediaQuery.of(context).size.width;
            var screenHeight = MediaQuery.of(context).size.height;
            var categorySelected = false;
            TextEditingController taskTitleController = TextEditingController();
            TextEditingController taskDescriptionController = TextEditingController();
            TextEditingController projectTitleController = TextEditingController();
            TextEditingController projectDescriptionController = TextEditingController();
            return Container(
              height: screenHeight - 130,
              decoration: BoxDecoration(
                  color: whiteColor,
                  borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(20),
                      topLeft: Radius.circular(20))),
              child: Center(
                child: DefaultTabController(
                  length: 2, // Number of tabs
                  child: Column(
                    children: [
                      SizedBox(
                        height: 50,
                        child: TabBar(
                          indicatorColor: mainColor,
                          indicatorSize: TabBarIndicatorSize.tab,
                          labelColor: mainColor,
                          labelStyle: GoogleFonts.alata(
                            color: blackColor,
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                          ),
                          tabs: const [
                            Tab(
                              text: 'Task',
                            ),
                            Tab(text: 'Group'),
                          ],
                        ),
                      ),
                      Expanded(
                        child: TabBarView(
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20.0),
                              child: SingleChildScrollView(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                  children: [
                                    TableCalendar(
                                      calendarFormat: CalendarFormat.month,
                                      headerStyle: HeaderStyle(
                                          formatButtonVisible: false,
                                          titleCentered: true,
                                          titleTextStyle: GoogleFonts.alata(
                                            color: blackColor,
                                            fontSize: 20,
                                            fontWeight: FontWeight.w500,
                                          ),
                                          leftChevronIcon: Icon(
                                            Iconsax.arrow_circle_left,
                                            color: mainColor,
                                          ),
                                          rightChevronIcon: Icon(
                                            Iconsax.arrow_circle_right,
                                            color: mainColor,
                                          )),
                                      calendarStyle: CalendarStyle(
                                        todayTextStyle: GoogleFonts.alata(
                                          color: blackColor,
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        todayDecoration: BoxDecoration(
                                          color: secondColor,
                                          shape: BoxShape.circle,
                                        ),
                                        selectedDecoration: BoxDecoration(
                                          color: mainColor,
                                          shape: BoxShape.circle,
                                        ),
                                      ),
                                      selectedDayPredicate: (day) => cubit
                                          .isSameDay(cubit.focusDayAdd, day),
                                      focusedDay: cubit.focusDayAdd,
                                      firstDay: DateTime(2024, 01, 01),
                                      lastDay: DateTime(2030, 01, 01),
                                      onDaySelected: (selcDay, focDay) {
                                        if (!cubit.isSameDay(
                                            cubit.focusDayAdd, selcDay)) {
                                          cubit.onDaySelected(
                                              selcDay, focDay);
                                        }
                                      },
                                    ),
                                    const SizedBox(
                                      height: 15,
                                    ),
                                    Text(
                                      "Title",
                                      style: GoogleFonts.alata(
                                        color: blackColor,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Container(
                                      height: 50,
                                      decoration: BoxDecoration(
                                        color: Colors.grey.withOpacity(0.2),
                                        borderRadius:
                                            BorderRadius.circular(15),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            bottom: 10.0),
                                        child: TextFormField(
                                          controller: taskTitleController,
                                          onChanged: (value) {
                                            print(taskTitleController.text);
                                          },
                                          autocorrect: false,
                                          cursorColor:
                                              Colors.grey.withOpacity(0.8),
                                          decoration: const InputDecoration(
                                            border: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  style: BorderStyle.none,
                                                  width: 0),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  style: BorderStyle.none),
                                            ),
                                            disabledBorder:
                                                OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  style: BorderStyle.none),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            Text(
                                              "Start Time",
                                              style: GoogleFonts.alata(
                                                color: blackColor,
                                                fontSize: 18,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 5,
                                            ),
                                            Container(
                                              height: 50,
                                              width: 165,
                                              decoration: BoxDecoration(
                                                color: Colors.grey
                                                    .withOpacity(0.2),
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                              ),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: [
                                                  Container(
                                                    width: 50,
                                                    child: CupertinoPicker(
                                                        itemExtent: 30,
                                                        scrollController:
                                                            FixedExtentScrollController(
                                                                initialItem:
                                                                    cubit.startHour -
                                                                        1),
                                                        onSelectedItemChanged:
                                                            (h) {
                                                          cubit.changeNumber(
                                                              1, h);
                                                        },
                                                        children: const [
                                                          Text("01"),
                                                          Text("02"),
                                                          Text("03"),
                                                          Text("04"),
                                                          Text("05"),
                                                          Text("06"),
                                                          Text("07"),
                                                          Text("08"),
                                                          Text("09"),
                                                          Text("10"),
                                                          Text("11"),
                                                          Text("12"),
                                                        ]),
                                                  ),
                                                  Container(
                                                    width: 50,
                                                    child: CupertinoPicker(
                                                        itemExtent: 30,
                                                        scrollController:
                                                            FixedExtentScrollController(
                                                                initialItem:
                                                                    cubit.startMinute -
                                                                        1),
                                                        onSelectedItemChanged:
                                                            (h) {
                                                          cubit.changeNumber(
                                                              2, h);
                                                        },
                                                        children: const [
                                                          Text("00"),
                                                          Text("01"),
                                                          Text("02"),
                                                          Text("03"),
                                                          Text("04"),
                                                          Text("05"),
                                                          Text("06"),
                                                          Text("07"),
                                                          Text("08"),
                                                          Text("09"),
                                                          Text("10"),
                                                          Text("11"),
                                                          Text("12"),
                                                          Text("13"),
                                                          Text("14"),
                                                          Text("15"),
                                                          Text("16"),
                                                          Text("17"),
                                                          Text("18"),
                                                          Text("19"),
                                                          Text("20"),
                                                          Text("21"),
                                                          Text("22"),
                                                          Text("23"),
                                                          Text("24"),
                                                          Text("25"),
                                                          Text("26"),
                                                          Text("27"),
                                                          Text("28"),
                                                          Text("29"),
                                                          Text("30"),
                                                          Text("31"),
                                                          Text("32"),
                                                          Text("33"),
                                                          Text("34"),
                                                          Text("35"),
                                                          Text("36"),
                                                          Text("37"),
                                                          Text("38"),
                                                          Text("39"),
                                                          Text("40"),
                                                          Text("41"),
                                                          Text("42"),
                                                          Text("43"),
                                                          Text("44"),
                                                          Text("45"),
                                                          Text("46"),
                                                          Text("47"),
                                                          Text("48"),
                                                          Text("49"),
                                                          Text("50"),
                                                          Text("51"),
                                                          Text("52"),
                                                          Text("53"),
                                                          Text("54"),
                                                          Text("55"),
                                                          Text("56"),
                                                          Text("57"),
                                                          Text("58"),
                                                          Text("59"),
                                                        ]),
                                                  ),
                                                  Container(
                                                    width: 60,
                                                    child: CupertinoPicker(
                                                        itemExtent: 30,
                                                        scrollController:
                                                            FixedExtentScrollController(
                                                                initialItem: cubit
                                                                    .startTimeFormat),
                                                        onSelectedItemChanged:
                                                            (h) {
                                                          cubit.changeNumber(
                                                              5, h);
                                                        },
                                                        children: const [
                                                          Text("AM"),
                                                          Text("PM"),
                                                        ]),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            Text(
                                              "End Time",
                                              style: GoogleFonts.alata(
                                                color: blackColor,
                                                fontSize: 18,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 5,
                                            ),
                                            Container(
                                              height: 50,
                                              width: 165,
                                              decoration: BoxDecoration(
                                                color: Colors.grey
                                                    .withOpacity(0.2),
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                              ),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: [
                                                  Container(
                                                    width: 50,
                                                    child: CupertinoPicker(
                                                        itemExtent: 30,
                                                        scrollController:
                                                            FixedExtentScrollController(
                                                                initialItem:
                                                                    cubit.endHour -
                                                                        1),
                                                        onSelectedItemChanged:
                                                            (h) {
                                                          cubit.changeNumber(
                                                              3, h);
                                                        },
                                                        children: const [
                                                          Text("01"),
                                                          Text("02"),
                                                          Text("03"),
                                                          Text("04"),
                                                          Text("05"),
                                                          Text("06"),
                                                          Text("07"),
                                                          Text("08"),
                                                          Text("09"),
                                                          Text("10"),
                                                          Text("11"),
                                                          Text("12"),
                                                        ]),
                                                  ),
                                                  Container(
                                                    width: 50,
                                                    child: CupertinoPicker(
                                                        itemExtent: 30,
                                                        scrollController:
                                                            FixedExtentScrollController(
                                                                initialItem:
                                                                    cubit.endMinute -
                                                                        1),
                                                        onSelectedItemChanged:
                                                            (h) {
                                                          cubit.changeNumber(
                                                              4, h);
                                                        },
                                                        children: const [
                                                          Text("00"),
                                                          Text("01"),
                                                          Text("02"),
                                                          Text("03"),
                                                          Text("04"),
                                                          Text("05"),
                                                          Text("06"),
                                                          Text("07"),
                                                          Text("08"),
                                                          Text("09"),
                                                          Text("10"),
                                                          Text("11"),
                                                          Text("12"),
                                                          Text("13"),
                                                          Text("14"),
                                                          Text("15"),
                                                          Text("16"),
                                                          Text("17"),
                                                          Text("18"),
                                                          Text("19"),
                                                          Text("20"),
                                                          Text("21"),
                                                          Text("22"),
                                                          Text("23"),
                                                          Text("24"),
                                                          Text("25"),
                                                          Text("26"),
                                                          Text("27"),
                                                          Text("28"),
                                                          Text("29"),
                                                          Text("30"),
                                                          Text("31"),
                                                          Text("32"),
                                                          Text("33"),
                                                          Text("34"),
                                                          Text("35"),
                                                          Text("36"),
                                                          Text("37"),
                                                          Text("38"),
                                                          Text("39"),
                                                          Text("40"),
                                                          Text("41"),
                                                          Text("42"),
                                                          Text("43"),
                                                          Text("44"),
                                                          Text("45"),
                                                          Text("46"),
                                                          Text("47"),
                                                          Text("48"),
                                                          Text("49"),
                                                          Text("50"),
                                                          Text("51"),
                                                          Text("52"),
                                                          Text("53"),
                                                          Text("54"),
                                                          Text("55"),
                                                          Text("56"),
                                                          Text("57"),
                                                          Text("58"),
                                                          Text("59"),
                                                        ]),
                                                  ),
                                                  Container(
                                                    width: 60,
                                                    child: CupertinoPicker(
                                                        itemExtent: 30,
                                                        scrollController:
                                                            FixedExtentScrollController(
                                                                initialItem: cubit
                                                                    .endTimeFormat),
                                                        onSelectedItemChanged:
                                                            (h) {
                                                          cubit.changeNumber(
                                                              6, h);
                                                        },
                                                        children: const [
                                                          Text("AM"),
                                                          Text("PM"),
                                                        ]),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    Text(
                                      "Description",
                                      style: GoogleFonts.alata(
                                        color: blackColor,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Container(
                                      height: 100,
                                      decoration: BoxDecoration(
                                        color: Colors.grey.withOpacity(0.2),
                                        borderRadius:
                                            BorderRadius.circular(15),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            bottom: 10.0),
                                        child: TextFormField(
                                          controller: taskDescriptionController,
                                          onChanged: (value) {
                                            print(taskDescriptionController.text);
                                          },
                                          cursorColor:
                                              Colors.grey.withOpacity(0.8),
                                          minLines: 1,
                                          maxLines: 2,
                                          keyboardType: TextInputType.multiline,
                                          autocorrect: false,
                                          decoration: const InputDecoration(
                                            border: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  style: BorderStyle.none,
                                                  width: 0),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  style: BorderStyle.none),
                                            ),
                                            disabledBorder:
                                                OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  style: BorderStyle.none),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    Text(
                                      "Category",
                                      style: GoogleFonts.alata(
                                        color: blackColor,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Container(
                                        height: 70,
                                        padding: const EdgeInsets.all(10),
                                        decoration: BoxDecoration(
                                          color: Colors.grey.withOpacity(0.2),
                                          borderRadius:
                                              BorderRadius.circular(15),
                                        ),
                                        child: Row(
                                          children: [
                                            Container(
                                              decoration: BoxDecoration(
                                                color: whiteColor,
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 10,
                                                      vertical: 3),
                                              child: Row(
                                                children: [
                                                  InkWell(
                                                    onTap: (){
                                                      setState(() {
                                                        categorySelected = true;
                                                      });
                                                    },
                                                    child: Container(
                                                      width: 10,
                                                      height: 10,
                                                      decoration: BoxDecoration(
                                                          shape:
                                                              BoxShape.circle,
                                                          color:
                                                              heavyGreyColor),
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    width: 4,
                                                  ),
                                                  Text(
                                                    "Personal",
                                                    style: GoogleFonts.alata(
                                                      color: heavyGreyColor,
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            Container(
                                              decoration: BoxDecoration(
                                                color: whiteColor,
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 10,
                                                      vertical: 3),
                                              child: Row(
                                                children: [
                                                  Container(
                                                    width: 10,
                                                    height: 10,
                                                    decoration: BoxDecoration(
                                                        shape:
                                                            BoxShape.circle,
                                                        color: groupColor),
                                                  ),
                                                  const SizedBox(
                                                    width: 4,
                                                  ),
                                                  Text(
                                                    "Group 1",
                                                    style: GoogleFonts.alata(
                                                      color: groupColor,
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                    ),
                                                    maxLines: 1,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                  ),
                                                ],
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            Container(
                                              decoration: BoxDecoration(
                                                color: whiteColor,
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 10,
                                                      vertical: 3),
                                              child: Row(
                                                children: [
                                                  Container(
                                                    width: 10,
                                                    height: 10,
                                                    decoration: BoxDecoration(
                                                        shape:
                                                            BoxShape.circle,
                                                        color:
                                                            groupsColors[3]),
                                                  ),
                                                  const SizedBox(
                                                    width: 4,
                                                  ),
                                                  Text(
                                                    "Group 200",
                                                    style: GoogleFonts.alata(
                                                      color: groupsColors[3],
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                    ),
                                                    maxLines: 1,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    Center(
                                      child: InkWell(
                                        onTap: (){
                                          if(taskTitleController.text.isNotEmpty && categorySelected == true){
                                            cubit.addTask(
                                                cubit.focusDayAdd
                                                    .toString()
                                                    .split(" ")
                                                    .first,
                                                taskTitleController.text,
                                                "${cubit.startHour}:${cubit.startMinute} ${cubit.startTimeFormat}",
                                                "${cubit.endHour}:${cubit.endMinute} ${cubit.endTimeFormat}",
                                                taskDescriptionController.text,
                                                "category");
                                          }else{
                                          }
                                        },
                                        child: AnimatedContainer(
                                          duration: Duration(milliseconds: 500),
                                          height: 50,
                                          width: cubit.cWidth,
                                          decoration: BoxDecoration(
                                            color: mainColor,
                                            borderRadius: BorderRadius.circular(10)
                                          ),
                                          child: Center(
                                            child: state is !ChangeCWidthState ? Text(
                                              "Add",
                                              style: GoogleFonts.alata(
                                                color: whiteColor,
                                                fontSize: 22,
                                                fontWeight: FontWeight.w700,
                                              ),
                                            ) : CircularProgressIndicator(color: whiteColor,),
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 30,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment:
                                CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Owner",
                                    style: GoogleFonts.alata(
                                      color: blackColor,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Center(
                                      child: Column(
                                        children: [
                                          CircleAvatar(
                                            radius: 35,
                                            backgroundImage:
                                            AssetImage("assets/images/${cubit.maleAvatars[2]}"),
                                          ),
                                          SizedBox(height: 2,),
                                          Text(
                                            "Adham Misallam",
                                            style: GoogleFonts.alata(
                                              color: blackColor,
                                              fontSize: 15,
                                              fontWeight: FontWeight.w700,
                                            ),
                                            textAlign: TextAlign.center,
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Text(
                                    "Title",
                                    style: GoogleFonts.alata(
                                      color: blackColor,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Container(
                                    height: 50,
                                    decoration: BoxDecoration(
                                      color: Colors.grey.withOpacity(0.2),
                                      borderRadius:
                                      BorderRadius.circular(15),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          bottom: 10.0),
                                      child: TextFormField(
                                        controller: projectTitleController,
                                        onChanged: (value) {
                                          print(projectTitleController.text);
                                        },
                                        autocorrect: false,
                                        cursorColor:
                                        Colors.grey.withOpacity(0.8),
                                        decoration: const InputDecoration(
                                          border: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                style: BorderStyle.none,
                                                width: 0),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                style: BorderStyle.none),
                                          ),
                                          disabledBorder:
                                          OutlineInputBorder(
                                            borderSide: BorderSide(
                                                style: BorderStyle.none),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Text(
                                    "Description",
                                    style: GoogleFonts.alata(
                                      color: blackColor,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Container(
                                    height: 100,
                                    decoration: BoxDecoration(
                                      color: Colors.grey.withOpacity(0.2),
                                      borderRadius:
                                      BorderRadius.circular(15),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          bottom: 10.0),
                                      child: TextFormField(
                                        controller: projectDescriptionController,
                                        onChanged: (value) {
                                          print(projectDescriptionController.text);
                                        },
                                        cursorColor:
                                        Colors.grey.withOpacity(0.8),
                                        minLines: 1,
                                        maxLines: 2,
                                        keyboardType: TextInputType.multiline,
                                        autocorrect: false,
                                        decoration: const InputDecoration(
                                          border: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                style: BorderStyle.none,
                                                width: 0),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                style: BorderStyle.none),
                                          ),
                                          disabledBorder:
                                          OutlineInputBorder(
                                            borderSide: BorderSide(
                                                style: BorderStyle.none),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const Spacer(),
                                  Center(
                                    child: InkWell(
                                      onTap: (){
                                      },
                                      child: AnimatedContainer(
                                        duration: Duration(milliseconds: 500),
                                        height: 50,
                                        width: cubit.cWidth,
                                        decoration: BoxDecoration(
                                            color: mainColor,
                                            borderRadius: BorderRadius.circular(10)
                                        ),
                                        child: Center(
                                          child: state is !ChangeCWidthState ? Text(
                                            "Add",
                                            style: GoogleFonts.alata(
                                              color: whiteColor,
                                              fontSize: 22,
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ) : CircularProgressIndicator(color: whiteColor,),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }
}
