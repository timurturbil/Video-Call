import 'package:auto_size_text/auto_size_text.dart';
// import 'package:google_fonts/google_fonts.dart';
import 'package:videocall/pages/authenticate/authenticate.dart';
import 'package:videocall/pages/join_meeting_page.dart';
import 'package:videocall/utils/style/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';

class OnboardingPage extends StatefulWidget {
  OnboardingPage({Key key}) : super(key: key);

  _OnboardingPageState createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final int _totalPages = 4;
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;
  TextEditingController meetingIdController = TextEditingController();
  TextEditingController personalLinkNameController = TextEditingController();
  TextEditingController phoneNameController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      body: Center(
        child: Column(
          children: [
            SizedBox(height: Get.height / 11),
            pageIndicator(),
            SizedBox(height: Get.height / 15),
            pageContent(),
            Container(
                child: Column(
              children: [
                Container(width: Get.width / 1.5, child: joinButton(context)),
                Container(
                  width: Get.width / 1.5,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      signUpButton(),
                      signInButton(),
                    ],
                  ),
                ),
                // SizedBox(height: Get.height / 7)
              ],
            )),
          ],
        ),
      ),
    );
  }

  TextButton signInButton() {
    return TextButton(
        onPressed: () {
          Get.to(Authenticate(isregistered: true));
        },
        child: Container(
            padding: EdgeInsets.all(20),
            child:
                Text("Sign In", style: TextStyle(color: Color(0xFF6979F8)))));
  }

  TextButton signUpButton() {
    return TextButton(
        onPressed: () {
          Get.to(Authenticate(isregistered: false));
        },
        child: Container(
            padding: EdgeInsets.all(20),
            child:
                Text("Sign Up", style: TextStyle(color: Color(0xFF6979F8)))));
  }

  ElevatedButton joinButton(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          Get.to(JoinMeetingPage());
        },
        style: ElevatedButton.styleFrom(
            primary: Color(0xFF6979F8),
            shape: new RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(16.0),
            )),
        child: Container(
          padding: EdgeInsets.only(right: 45, left: 45, top: 15, bottom: 15),
          child: Text(
            "Join a Meeting",
          ),
        ));
  }

  Container pageContent() {
    return Container(
      height: 350,
      child: PageView(
        controller: _pageController,
        onPageChanged: (int page) {
          _currentPage = page;
          setState(() {});
        },
        children: <Widget>[
          _buildPageContent(
              image: 'assets/community.png', title: 'Start or Join a meeting'),
          _buildPageContent(
              image: 'assets/online_collaboration.png',
              title: 'Chat with coworkers and friends'),
          _buildPageContent(
              image: 'assets/real_time_collaboration.png',
              title: 'Collaborate in real-time by screen ...'),
          _buildPageContent(
              image: 'assets/runner_start.png', title: 'Get started'),
        ],
      ),
    );
  }

  Row pageIndicator() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          /* margin: EdgeInsets.only(left: 52, bottom: 77), */
          child: Row(children: [
            for (int i = 0; i < _totalPages; i++)
              i == _currentPage
                  ? _buildPageIndicator(true)
                  : _buildPageIndicator(false)
          ]),
        ),
      ],
    );
  }

  Widget _buildPageIndicator(bool isCurrentPage) {
    return AnimatedContainer(
        duration: Duration(milliseconds: 350),
        margin: EdgeInsets.symmetric(horizontal: 4.0),
        height: isCurrentPage ? 8.0 : 6.0,
        width: isCurrentPage ? 8.0 : 6.0,
        decoration: BoxDecoration(
            color: isCurrentPage ? greyColor(800) : greyColor(300),
            borderRadius: BorderRadius.all(Radius.circular(12))));
  }

  Widget _buildPageContent({
    String image,
    String title,
  }) {
    return SingleChildScrollView(
      child: Container(
        color: whiteColor,
        padding: EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: <Widget>[
            Container(
              alignment: Alignment.center,
              width: Get.width / 1.2,
              child: AutoSizeText(
                title,
                // maxFontSize: 18,
                // minFontSize: 16,
                style: TextStyle(
                    color: blackColor,
                    fontWeight: FontWeight.w500,
                    fontSize: 18),
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            SizedBox(height: Get.height / 40),
            Center(
              child: Image.asset(
                image,
                height: 200,
              ),
            ),
            SizedBox(height: 32),
          ],
        ),
      ),
    );
  }
}
