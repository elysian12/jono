import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jono/common/constants/colors.dart';

class ScheduledAppointments extends StatelessWidget {
  static const String routeName = '/scheduled-page';
  const ScheduledAppointments({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              const _CustomAppBar(),
              SizedBox(height: 35.h),
              const _CustomTab(),
              SizedBox(height: 25.h),
              Expanded(
                child: ListView(
                  children: [
                    Column(
                      children: List.generate(
                        2,
                        (index) {
                          return const Docdetail();
                        },
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
  }
}

class _CustomTab extends StatelessWidget {
  const _CustomTab({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Container(
        height: 45,
        decoration: BoxDecoration(
            color: AppColors.lightGrey,
            borderRadius: BorderRadius.circular(12.0)),
        child: TabBar(
          indicator: BoxDecoration(
              color: AppColors.primaryColor,
              borderRadius: BorderRadius.circular(8.0)),
          labelColor: Colors.white,
          unselectedLabelColor: AppColors.blackColor,
          tabs: const [
            Tab(
              text: 'Upcoming ',
            ),
            Tab(
              text: 'Completed',
            ),
            Tab(
              text: 'Cancelled',
            ),
          ],
        ),
      ),
    );
  }
}

class Docdetail extends StatelessWidget {
  const Docdetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Container(
        height: 179,
        width: 335,
        decoration: BoxDecoration(
            color: AppColors.whiteColor,
            border: Border.all(color: AppColors.lightGrey),
            borderRadius: BorderRadius.circular(12)),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Dr. Marcus Horizon",
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      SizedBox(height: 2.h),
                      Text(
                        "Chardiologist",
                        style: Theme.of(context).textTheme.labelSmall,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 46.h,
                    width: 46.h,
                    child: const CircleAvatar(
                      child:
                          Image(image: AssetImage("assets/images/doctor5.png")),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 25.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(Icons.calendar_month, color: Colors.grey[700]),
                  Text("26/06/2022", style: TextStyle(color: Colors.grey[700])),
                  Icon(Icons.watch_later_outlined, color: Colors.grey[700]),
                  Text("10:30 AM", style: TextStyle(color: Colors.grey[700])),
                  const Icon(Icons.circle, size: 8, color: Colors.green),
                  Text("Confirmed", style: TextStyle(color: Colors.grey[700])),
                ],
              ),
              SizedBox(
                height: 12.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 46.h,
                    width: 130.w,
                    decoration: BoxDecoration(
                      color: AppColors.lightGrey,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Center(
                      child: Text("Cancel"),
                    ),
                  ),
                  Container(
                    height: 46.h,
                    width: 130.w,
                    decoration: BoxDecoration(
                      color: AppColors.primaryColor,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Center(
                      child: Text(
                        "ReSchedule",
                        style: TextStyle(color: AppColors.whiteColor),
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class _CustomAppBar extends StatelessWidget {
  const _CustomAppBar();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Schedule',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        const Icon(Icons.notifications_none_outlined)
      ],
    );
  }
}
