// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jono/common/utils/utils.dart';

class LandingPage extends StatefulWidget {
  static const String routeName = "/landing-page";
  const LandingPage({Key? key}) : super(key: key);

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  late PageController _pageController;

  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    _pageController = PageController(initialPage: 1);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: SafeArea(
        child: Column(
          children: [
            Flexible(
              flex: 5,
              child: PageView(
                physics: const NeverScrollableScrollPhysics(),
                controller: _pageController,
                children: const [
                  ToggleScreenPage(
                    title: "Helper",
                    content:
                        "Help deliver parcels and  earn money,\nquickly and easily.",
                    assetUrl: "assets/toggle/help.svg",
                    requester: false,
                  ),
                  ToggleScreenPage(
                    title: "Choose a Side",
                    content:
                        "Would you like to send a parcel?\nOr help deliver one?",
                    assetUrl: "assets/toggle/middle.svg",
                    requester: false,
                  ),
                  ToggleScreenPage(
                    title: "Requester",
                    content:
                        "Send Your  Parcels easily and quickly,\nin just one click",
                    assetUrl: "assets/toggle/request.svg",
                    requester: true,
                  ),
                ],
              ),
            ),
            const Flexible(
              flex: 2,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                // child: MyToggleSwitch(
                //   pageController: _pageController,
                //   scaffoldKey: _scaffoldKey,
                // ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ToggleScreenPage extends StatelessWidget {
  final String title;
  final String content;
  final String assetUrl;
  final bool requester;
  const ToggleScreenPage({
    Key? key,
    required this.title,
    required this.content,
    required this.assetUrl,
    required this.requester,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final TextTheme textTheme = Theme.of(context).textTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          title,
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.start,
          style: textTheme.headlineLarge!.copyWith(
            color: requester ? Colors.red : Colors.blue,
            fontWeight: FontWeight.w600,
            fontSize: 26,
          ),
        ),
        SizedBox(height: height * 0.01),
        Text(
          content,
          overflow: TextOverflow.ellipsis,
          maxLines: 2,
          textAlign: TextAlign.center,
          style: textTheme.headlineMedium!.copyWith(
            color: requester ? Colors.red : Colors.blue,
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),
        ),
        SizedBox(height: height * 0.04),
        Flexible(
          child: SvgPicture.asset(
            assetUrl,
            fit: BoxFit.contain,
            placeholderBuilder: (context) => CommonUtilities.loading(),
          ),
        ),
      ],
    );
  }
}
