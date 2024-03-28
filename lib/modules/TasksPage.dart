import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:union/shared/components/components.dart';
import 'package:union/shared/styles/iconsax_icons.dart';

import '../shared/app_cubit/app_cubit.dart';
import '../shared/app_cubit/app_states.dart';
import '../shared/styles/colors.dart';

class TasksPage extends StatelessWidget {
  const TasksPage({super.key});

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
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        Text(
                          "You Have    Tasks Today",
                          style: GoogleFonts.alata(
                            color: blackColor,
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Positioned(
                          left: 68,
                          child: Text(
                            "0",
                            style: GoogleFonts.alata(
                              color: mainColor,
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20,),
                    SizedBox(
                      height: screenHeight - screenHeight/3.7,
                      width: screenWidth,
                      child: ListView.builder(
                          itemCount: groupsColors.length,
                          itemBuilder: (BuildContext context, int index){
                            return InkWell(
                              onTap: (){
                              },
                              child: Container(
                                width: double.infinity,
                                height: screenHeight/8,
                                margin: const EdgeInsets.only(bottom: 25),
                                padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                                decoration: BoxDecoration(
                                  color: lightGreyColor,
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: [
                                    BoxShadow(
                                      color: heavyGreyColor, // Shadow color
                                      spreadRadius: 2, // Spread radius
                                      blurRadius: 7, // Blur radius
                                      offset: const Offset(3, 3), // Offset (horizontal, vertical)
                                    ),
                                  ],
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Landing page design",
                                          style: GoogleFonts.alata(
                                            color: blackColor,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                          ),
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,),
                                        Row(
                                          children: [
                                            Container(
                                              width: 15,
                                              height: 15,
                                              decoration: BoxDecoration(
                                                  color: groupsColors[index],
                                                  borderRadius: BorderRadius.circular(15)
                                              ),
                                            ),
                                            const SizedBox(width: 10,),
                                            Text(
                                              "Personal",
                                              style: GoogleFonts.alata(
                                                color: semiGreyColor,
                                                fontSize: 13,
                                                fontWeight: FontWeight.w500,
                                              ),
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Icon(Iconsax.calendar_1, size: 20, color: semiGreyColor,),
                                            const SizedBox(width: 10,),
                                            Text(
                                              "17 Jan 2024",
                                              style: GoogleFonts.alata(
                                                color: semiGreyColor,
                                                fontSize: 13,
                                                fontWeight: FontWeight.w500,
                                              ),
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    Container(
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
                                                  cubit.statusTitle,
                                                  style: GoogleFonts.alata(
                                                    color: blackColor,
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                                Icon(Icons.arrow_drop_down_rounded)
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
                                  ],
                                ),
                              ),
                            );
                          }
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
