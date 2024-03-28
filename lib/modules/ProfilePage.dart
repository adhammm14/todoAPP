import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:union/shared/styles/colors.dart';

import '../shared/app_cubit/app_cubit.dart';
import '../shared/app_cubit/app_states.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

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
            body: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const CircleAvatar(
                        radius: 50,
                        backgroundImage:
                            AssetImage("assets/images/male3.png"),
                      ),
                      const SizedBox(width: 10,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Adham Misallam",
                            style: GoogleFonts.alata(
                            color: blackColor,
                            fontSize: 22,
                            fontWeight: FontWeight.w700,),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: 5,),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                            decoration: BoxDecoration(
                              color: secondColor,
                              borderRadius: BorderRadius.circular(8)
                            ),
                            child: Text(
                              "@H12W21T7",
                              style: GoogleFonts.alata(
                              color: blackColor,
                              fontSize: 15,),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,),
                          )
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Daily XP",
                        style: GoogleFonts.alata(
                          color: blackColor,
                          fontSize: 22,
                          fontWeight: FontWeight.w700,),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 5,vertical: 3),
                        decoration: BoxDecoration(
                          color: secondColor,
                          borderRadius: BorderRadius.circular(5)
                        ),
                        child: Text(
                          "0 XP",
                          style: GoogleFonts.alata(
                            color: blackColor,
                            fontSize: 18,),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
