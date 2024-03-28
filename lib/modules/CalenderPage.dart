import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:union/shared/components/components.dart';

import '../shared/app_cubit/app_cubit.dart';
import '../shared/app_cubit/app_states.dart';
import '../shared/styles/colors.dart';
import '../shared/styles/iconsax_icons.dart';

class CalenderPage extends StatelessWidget {
  const CalenderPage({super.key});

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
            return Scaffold(
              backgroundColor: bgColor,
              body: Column(
                children: [
                  TableCalendar(
                    calendarFormat: CalendarFormat.week,
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
                    selectedDayPredicate: (day) =>
                        cubit.isSameDay(cubit.focusDayCalender, day),
                    focusedDay: cubit.focusDayCalender,
                    firstDay: DateTime(2024, 01, 01),
                    lastDay: DateTime(2030, 01, 01),
                    onDaySelected: (selcDay, focDay) {
                      if (!cubit.isSameDay(cubit.focusDayCalender, selcDay)) {
                        cubit.onDaySelectedCalender(selcDay, focDay);
                      }
                    },
                  ),
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.only(top: 10),
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: whiteColor,
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(25),
                            topRight: Radius.circular(25)),
                        boxShadow: [
                          BoxShadow(
                            color: heavyGreyColor, // Shadow color
                            spreadRadius: 2, // Spread radius
                            blurRadius: 7, // Blur radius
                            offset: const Offset(
                                0, -2), // Offset (horizontal, vertical)
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            cubit.dayString,
                            style: GoogleFonts.alata(
                              color: blackColor,
                              fontSize: 25,
                              fontWeight: FontWeight.w700,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Icon(Icons.check_circle, color: Colors.green),
                              const SizedBox(
                                width: 5,
                              ),
                              Text(
                                "0/5",
                                style: GoogleFonts.alata(
                                  color: blackColor,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Expanded(
                            child: ListView.builder(
                                itemCount: 5,
                                itemBuilder: (context, index) {
                                  return InkWell(
                                    onTap: (){
                                      print(cubit.uID);
                                    },
                                    child: Container(
                                      margin: const EdgeInsets.symmetric(vertical: 8),
                                      width: double.infinity,
                                      height: 75,
                                      decoration: BoxDecoration(
                                          color: lightGreyColor,
                                          boxShadow: [
                                            BoxShadow(
                                              color: heavyGreyColor,
                                              // Shadow color
                                              spreadRadius: 1,
                                              // Spread radius
                                              blurRadius: 3,
                                              // Blur radius
                                              offset: const Offset(1, 2), // Offset (horizontal, vertical)
                                            ),
                                          ],
                                          borderRadius: BorderRadius.circular(15),
                                      ),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              Container(
                                                width: 10,
                                                height: double.infinity,
                                                decoration: BoxDecoration(
                                                  color: groupsColors[index],
                                                  borderRadius: const BorderRadius.only(topLeft: Radius.circular(15),bottomLeft: Radius.circular(15))
                                                ),
                                              ),
                                              const SizedBox(width: 10,),
                                              Column(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    "Landing page design",
                                                    style: GoogleFonts.alata(
                                                      color: blackColor,
                                                      fontSize: 18,
                                                      fontWeight: FontWeight.bold,
                                                    ),
                                                    maxLines: 1,
                                                    overflow: TextOverflow.ellipsis,
                                                  ),
                                                  Text(
                                                    "08:00 AM - 10:00 AM",
                                                    style: GoogleFonts.alata(
                                                      color: blackColor.withOpacity(0.6),
                                                      fontSize: 12,
                                                    ),
                                                    maxLines: 1,
                                                    overflow: TextOverflow.ellipsis,),
                                                ],
                                              ),
                                            ],
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(right: 10.0),
                                            child: Container(
                                              height: 30,
                                              width: 70,
                                              decoration: BoxDecoration(
                                                  color: progressColors[index].withOpacity(0.4),
                                                  borderRadius: BorderRadius.circular(5)
                                              ),
                                              child: Center(
                                                child: PopupMenuButton(
                                                  child: Row(
                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                    children: [
                                                      Text(
                                                        progressColors[index] == const Color(0xffbb0c13) ? cubit.status1 : progressColors[index] == const Color(0xffffcc00) ? cubit.status2 : cubit.status3,
                                                        style: GoogleFonts.alata(
                                                          color: blackColor,
                                                          fontSize: 12,
                                                          fontWeight: FontWeight.w500,
                                                        ),
                                                      ),
                                                      const Icon(Icons.arrow_drop_down_rounded)
                                                    ],
                                                  ),
                                                  onSelected: (value){
                                                    cubit.changeMenuStatus(value);
                                                  },
                                                  itemBuilder: (context) => [
                                                    PopupMenuItem(
                                                      value: cubit.status1,
                                                      child: Text(
                                                        cubit.status1,
                                                        style: GoogleFonts.alata(
                                                          color: blackColor,
                                                          fontSize: 12,
                                                          fontWeight: FontWeight.w500,
                                                        ),
                                                      ),
                                                    ),
                                                    PopupMenuItem(
                                                      value: cubit.status2,
                                                      child: Text(
                                                        cubit.status2,
                                                        style: GoogleFonts.alata(
                                                          color: blackColor,
                                                          fontSize: 12,
                                                          fontWeight: FontWeight.w500,
                                                        ),
                                                      ),
                                                    ),
                                                    PopupMenuItem(
                                                      value: cubit.status3,
                                                      child: Text(
                                                        cubit.status3,
                                                        style: GoogleFonts.alata(
                                                          color: blackColor,
                                                          fontSize: 12,
                                                          fontWeight: FontWeight.w500,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                }),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          }),
    );
  }
}
