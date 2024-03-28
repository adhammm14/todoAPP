import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:union/modules/AddBottomSheet.dart';
import 'package:union/shared/styles/iconsax_icons.dart';

import '../shared/app_cubit/app_cubit.dart';
import '../shared/app_cubit/app_states.dart';
import '../shared/styles/colors.dart';

class HomeLayout extends StatelessWidget {
  const HomeLayout({super.key});

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
              appBar: AppBar(
                scrolledUnderElevation: 0,
                backgroundColor: bgColor,
                leadingWidth: 200,
                leading: Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Text(
                    cubit.pagesNames[cubit.currentIndex],
                    style: GoogleFonts.alata(
                      color: blackColor,
                      fontSize: 30,
                      fontWeight: FontWeight.w700,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                actions: [
                  InkWell(
                    onTap: () {
                      showModalBottomSheet(
                          context: context,
                          isScrollControlled: true,
                          builder: (BuildContext context) {
                            return const AddBottomSheet();
                          });
                    },
                    child: Container(
                      width: 40,
                      height: 70,
                      decoration: BoxDecoration(
                          color: blackColor,
                          borderRadius: BorderRadius.circular(30)),
                      child: Icon(
                        Icons.add,
                        size: 30,
                        color: whiteColor,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  )
                ],
              ),
              body: cubit.pages[cubit.currentIndex],
              bottomNavigationBar: SalomonBottomBar(
                margin:
                    const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                backgroundColor: whiteColor,
                selectedItemColor: mainColor,
                curve: Curves.easeInOut,
                currentIndex: cubit.currentIndex,
                onTap: (i) {
                  cubit.changeNavigationPage(i);
                },
                items: [
                  SalomonBottomBarItem(
                      icon: const Icon(Iconsax.task),
                      title: const Text("Tasks")),
                  SalomonBottomBarItem(
                      icon: const Icon(Iconsax.people),
                      title: const Text("Groups")),
                  SalomonBottomBarItem(
                      icon: const Icon(Iconsax.calendar_1),
                      title: const Text("Calender")),
                  SalomonBottomBarItem(
                      icon: const Icon(Iconsax.profile_circle),
                      title: const Text("Profile")),
                ],
              ),
            );
          }),
    );
  }
}
