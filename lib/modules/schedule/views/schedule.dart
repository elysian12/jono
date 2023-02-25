import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jono/common/constants/colors.dart';

class SchedulePage extends StatelessWidget {
  static const String routeName = '/schedule-page';

  const SchedulePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 27),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              const CustomAppBar(),
              const SizedBox(height: 50),
              const DoctorDetail(),
              const SizedBox(height: 40),
              Text(
                "About",
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 10),
              const Text(
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam... Read more",
                style: TextStyle(color: AppColors.darkGrey),
              ),
              const SizedBox(height: 40),
              const Divider(),
              const SizedBox(height: 40),
              Column(
                children: List.generate(
                  3,
                  (index) => const SlotChip(),
                ),
              ),
              const SizedBox(height: 40),
              Container(
                height: 50.h,
                width: 300.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24),
                  color: AppColors.primaryColor,
                ),
                child: const Center(
                    child: Text(
                  "Book Appointment",
                  style: TextStyle(color: AppColors.whiteColor),
                )),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class SlotChip extends StatelessWidget {
  final bool isSelected = false;

  const SlotChip({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(3.0),
      child: Row(
        children: List.generate(
          3,
          (index) => Padding(
            padding: const EdgeInsets.all(5.0),
            child: Container(
              height: 37.h,
              width: 90.w,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: (isSelected == true)
                      ? AppColors.primaryColor
                      : AppColors.whiteColor,
                  border: Border.all(
                    color: AppColors.darkGrey,
                  )),
              child: const Center(child: Text("10:00 PM")),
            ),
          ),
        ),
      ),
    );
  }
}

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        InkWell(
          child: const Icon(Icons.chevron_left_outlined),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        Text(
          'Doctor Detail',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        const Icon(Icons.more_vert)
      ],
    );
  }
}

class DoctorDetail extends StatelessWidget {
  const DoctorDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
          ),
          height: 115.h,
          width: 115.h,
          child: const Image(image: AssetImage("assets/images/doctor4.png")),
        ),
        const SizedBox(width: 15),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Dr. Marcus Horizon",
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 2),
            Text(
              "Chardiologist",
              style: Theme.of(context).textTheme.labelSmall,
            ),
            const SizedBox(height: 7),
            Container(
              height: 18.h,
              width: 41.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                color: Colors.grey[200],
              ),
              child: Row(
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  const Icon(
                    Icons.star,
                    color: AppColors.primaryColor,
                    size: 18,
                  ),
                  const Text(
                    "4,7",
                    style: TextStyle(color: AppColors.primaryColor),
                  )
                ],
              ),
            ),
            const SizedBox(height: 7),
            Row(
              children: [
                const Icon(
                  Icons.location_on,
                  color: AppColors.darkGrey,
                  size: 18,
                ),
                const Text(
                  "800m away",
                  style: TextStyle(color: AppColors.darkGrey),
                )
              ],
            ),
          ],
        )
      ],
    );
  }
}
