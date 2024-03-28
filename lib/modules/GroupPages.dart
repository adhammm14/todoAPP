import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:union/shared/styles/iconsax_icons.dart';

import '../shared/app_cubit/app_cubit.dart';
import '../shared/app_cubit/app_states.dart';
import '../shared/components/components.dart';
import '../shared/styles/colors.dart';

class GroupsPage extends StatelessWidget {
  const GroupsPage({super.key});

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
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      Container(
                        height: 50,
                        decoration: BoxDecoration(
                          color: Colors.grey.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(top: 10.0),
                          child: TextFormField(
                            onChanged: (value) {
                              print(value);
                            },
                            cursorColor: Colors.grey.withOpacity(0.8),
                            decoration: InputDecoration(
                              prefixIcon: Padding(
                                padding: const EdgeInsets.only(
                                    left: 14.0, right: 8.0, bottom: 12),
                                child: Icon(Iconsax.search_normal,
                                    color: Colors.grey.withOpacity(0.8)),
                              ),
                              prefixIconConstraints: const BoxConstraints(),
                              hintText: "Enter group id..",
                              hintStyle: TextStyle(
                                  color: Colors.grey.withOpacity(0.8),
                                  fontSize: 16),
                              border: const OutlineInputBorder(
                                borderSide:
                                    BorderSide(style: BorderStyle.none, width: 0),
                              ),
                              focusedBorder: const OutlineInputBorder(
                                borderSide: BorderSide(style: BorderStyle.none),
                              ),
                              disabledBorder: const OutlineInputBorder(
                                borderSide: BorderSide(style: BorderStyle.none),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        height: screenHeight - screenHeight/3.2,
                        width: screenWidth,
                        child: ListView.builder(
                            itemCount: groupsColors.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Container(
                                width: double.infinity,
                                height: screenHeight / 5,
                                margin: const EdgeInsets.only(bottom: 25),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 5, vertical: 5),
                                decoration: BoxDecoration(
                                  color: groupsColors[index],
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: [
                                    BoxShadow(
                                      color: heavyGreyColor, // Shadow color
                                      spreadRadius: 2, // Spread radius
                                      blurRadius: 7, // Blur radius
                                      offset: const Offset(
                                          3, 3), // Offset (horizontal, vertical)
                                    ),
                                  ],
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        Column(
                                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Landing page design",
                                              style: GoogleFonts.alata(
                                                color: whiteColor,
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold,
                                              ),
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                            SizedBox(
                                              width: screenWidth - 70,
                                              child: Row(
                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  Text(
                                                    "Progress",
                                                    style: GoogleFonts.alata(
                                                      color: whiteColor,
                                                      fontSize: 15,
                                                      fontWeight: FontWeight.w500,
                                                    ),
                                                    maxLines: 1,
                                                    overflow: TextOverflow.ellipsis,
                                                  ),
                                                  Stack(
                                                    children: [
                                                      Container(
                                                        width: 200,
                                                        height: 5,
                                                        decoration: BoxDecoration(
                                                          color: whiteColor.withOpacity(0.5),
                                                          borderRadius: BorderRadius.circular(10),
                                                        ),
                                                      ),
                                                      Container(
                                                        width: 100,
                                                        height: 5,
                                                        decoration: BoxDecoration(
                                                          color: whiteColor,
                                                          borderRadius: BorderRadius.circular(10),
                                                        ),
                                                      ),
                                                    ],
                                                  ),

                                                  Text(
                                                    "50%",
                                                    style: GoogleFonts.alata(
                                                      color: whiteColor,
                                                      fontSize: 15,
                                                      fontWeight: FontWeight.w500,
                                                    ),
                                                    maxLines: 1,
                                                    overflow: TextOverflow.ellipsis,
                                                  ),
                                                ],
                                              ),
                                            ),
                                            SizedBox(
                                              width: screenWidth - 70,
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  Row(
                                                    children: [
                                                      Text(
                                                        "Owner:",
                                                        style: GoogleFonts.alata(
                                                          color: whiteColor,
                                                          fontSize: 15,
                                                          fontWeight: FontWeight.normal,
                                                        ),
                                                        maxLines: 1,
                                                        overflow: TextOverflow.ellipsis,
                                                      ),
                                                      const SizedBox(width: 10,),
                                                      const CircleAvatar(
                                                        backgroundImage: AssetImage("assets/images/male1.png"),
                                                        radius: 15,
                                                      ),
                                                    ],
                                                  ),
                                                  Row(
                                                    children: [
                                                      Text(
                                                        "Members:",
                                                        style: GoogleFonts.alata(
                                                          color: whiteColor,
                                                          fontSize: 15,
                                                          fontWeight: FontWeight.normal,
                                                        ),
                                                        maxLines: 1,
                                                        overflow: TextOverflow.ellipsis,
                                                      ),
                                                      const SizedBox(width: 10,),
                                                      SizedBox(
                                                        width: 90,
                                                        child: Stack(
                                                          children: [
                                                            const CircleAvatar(
                                                              backgroundImage: AssetImage("assets/images/male3.png"),
                                                              radius: 15,
                                                            ),
                                                            Positioned(
                                                              left: 18,
                                                              child: SizedBox(
                                                                width: 80,
                                                                child: Stack(
                                                                  children: [
                                                                    const CircleAvatar(
                                                                      backgroundImage: AssetImage("assets/images/female1.png"),
                                                                      radius: 15,
                                                                    ),
                                                                    Positioned(
                                                                      left: 18,
                                                                      child: SizedBox(
                                                                        width: 50,
                                                                        child: Stack(
                                                                          children: [
                                                                            const CircleAvatar(
                                                                              backgroundImage: AssetImage("assets/images/male5.png"),
                                                                              radius: 15,
                                                                            ),
                                                                            Positioned(
                                                                              left: 18,
                                                                              child: CircleAvatar(
                                                                                backgroundColor: secondColor,
                                                                                radius: 15,
                                                                                child: Text(
                                                                                  "+3",
                                                                                  style: GoogleFonts.alata(
                                                                                  color: mainColor,
                                                                                  fontSize: 14,
                                                                                  fontWeight: FontWeight.normal,
                                                                                ),
                                                                                  maxLines: 1,
                                                                                  overflow: TextOverflow.ellipsis,),
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      )
                                                    ],
                                                  )
                                                ],
                                              ),
                                            ),
                                            Row(
                                              children: [
                                                Icon(
                                                  Iconsax.calendar_1,
                                                  size: 20,
                                                  color: whiteColor,
                                                ),
                                                const SizedBox(
                                                  width: 10,
                                                ),
                                                Text(
                                                  "17 Jan 2024",
                                                  style: GoogleFonts.alata(
                                                    color: whiteColor,
                                                    fontSize: 13,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                  maxLines: 1,
                                                  overflow: TextOverflow.ellipsis,
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              );
                            }),
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
