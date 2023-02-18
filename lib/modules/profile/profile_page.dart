import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:jono/common/constants/colors.dart';

class ProfilePage extends StatelessWidget {
  static const String routeName = '/profile-page';

  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          PopupMenuButton(
              itemBuilder: (BuildContext context) => <PopupMenuItem<int>>[])
        ],
      ),
      body: Column(
        children: [
          Container(
              height: 270.h,
              color: Colors.transparent,
              child: Column(
                children: [
                  ProfileImage(),
                  SizedBox(
                    height: 15.h,
                  ),
                  Text(
                    "Profile Name",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(
                    height: 25.h,
                  ),
                  HealthData(),
                ],
              )),
          CustomBottomSheet(),
        ],
      ),
    );
  }
}

class ProfileImage extends StatelessWidget {
  const ProfileImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CircleAvatar(
          radius: 40,
          backgroundImage: AssetImage('assets/images/profiledummy.png'),
        ),
        Positioned(
          left: 45.w,
          top: 50.h,
          child: CircleAvatar(
            backgroundColor: Colors.white,
            radius: 15,
            child: Icon(
              size: 18,
              color: AppColors.primaryColor,
              Icons.camera_alt_outlined,
            ),
          ),
        )
      ],
    );
  }
}

class CustomBottomSheet extends StatelessWidget {
  const CustomBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 438.h,
      color: Colors.transparent,
      child: Container(
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40.0),
                topRight: Radius.circular(40.0),
              )),
          child: Column(
            children: [
              SizedBox(
                height: 30.h,
              ),
              optionsRow(
                  Icon(
                    Icons.heart_broken_rounded,
                    color: Color(0xff199A8E),
                  ),
                  "My Saved"),
              optionsRow(
                  Icon(
                    Icons.notes,
                    color: Color(0xff199A8E),
                  ),
                  "Appointment"),
              optionsRow(
                  Icon(
                    Icons.account_balance_wallet_outlined,
                    color: Color(0xff199A8E),
                  ),
                  "Payment method"),
              optionsRow(
                  Icon(
                    Icons.message_outlined,
                    color: Color(0xff199A8E),
                  ),
                  "FAQs"),
              Container(
                height: 70.h,
                padding: EdgeInsets.only(left: 20, right: 15),
                child: Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: Color(0xffE8F3F1),
                      child: Icon(
                        Icons.error_outline,
                        color: Colors.red,
                      ),
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    Text(
                      "Logout",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.red),
                    ),
                    Spacer(),
                    Icon(
                      Icons.arrow_forward_ios_sharp,
                    ),
                  ],
                ),
              )
            ],
          )),
    );
  }
}

optionsRow(
  Icon iconz,
  String text,
) {
  return Container(
    height: 70.h,
    padding: EdgeInsets.only(left: 20, right: 15),
    child: Row(
      children: [
        CircleAvatar(
          backgroundColor: Color(0xffE8F3F1),
          child: iconz,
        ),
        SizedBox(
          width: 10.w,
        ),
        Text(
          "$text",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ),
        Spacer(),
        Icon(
          Icons.arrow_forward_ios_sharp,
        ),
      ],
    ),
  );
}

class HealthData extends StatelessWidget {
  const HealthData({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25, right: 25),
      child: IntrinsicHeight(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            details(
                Icon(
                  Icons.heart_broken_outlined,
                  color: Colors.white,
                  size: 45,
                ),
                "Heart Rate",
                "215bpm"),
            const VerticalDivider(
              color: Colors.white,
              width: 30,
              thickness: 1,
            ),
            details(
                Icon(
                  Icons.fitbit_rounded,
                  size: 45,
                  color: Colors.white,
                ),
                "Calories",
                "715cal"),
            const VerticalDivider(
              color: Colors.white,
              width: 30,
              thickness: 1,
            ),
            details(
                Icon(
                  Icons.sports_gymnastics,
                  size: 45,
                  color: Colors.white,
                ),
                "Weight",
                "103lbs"),
          ],
        ),
      ),
    );
  }

  details(Icon icon, String text, String text2) {
    return Padding(
      padding: EdgeInsets.all(13),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          icon,
          Text(
            text,
            style: TextStyle(fontSize: 10, color: Colors.white),
          ),
          Text(
            text2,
            style: TextStyle(fontSize: 16, color: Colors.white),
          ),
        ],
      ),
    );
  }
}
