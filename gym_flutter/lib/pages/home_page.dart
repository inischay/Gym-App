import 'package:flutter/material.dart';
import 'package:gym_flutter/pages/auth/signIn_page.dart';
import 'package:gym_flutter/pages/auth/signUp_page.dart';

import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  int _currentPage = 0;

  late AnimationController _animationController;
  late Animation<double> _nextPage;

  PageController controller = PageController(initialPage: 0);
  @override
  void initState() {
    _animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 5));
    _nextPage = Tween(begin: 0.0, end: 1.0).animate(_animationController);
    _animationController.addListener(() {
      if (_animationController.status == AnimationStatus.completed) {
        _animationController.repeat();
        int page = 4; //Number of pages in PageView
        if (_currentPage < page) {
          _currentPage++;
          controller.animateToPage(_currentPage,
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeIn);
        } else {
          _currentPage = 0;
        }
      }
    });

    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    _animationController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _animationController.forward(); //Start controller with widget
    print(_nextPage.value);
    return Scaffold(
        body: Stack(
      children: [
        PageView(
          onPageChanged: (value) {
            //When page change, start the controller
            _animationController.forward();
          },
          // onPageChanged: (value) {
          //   setState(() => islastPage = index == 3);
          // },
          controller: controller,

          children: [
            onBoardingScreen(
                "Welcome",
                "Workout plans designed to help you achieve\nyour fitness goals - whether losing weight or \nbuilding muscle",
                "https://images.unsplash.com/photo-1611672585731-fa10603fb9e0?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=774&q=80"),
            onBoardingScreen(
                "Supplements",
                "Workout plans designed to help you achieve\nyour fitness goals - whether losing weight or \nbuilding muscle",
                "https://images.unsplash.com/photo-1548690312-e3b507d8c110?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=774&q=80"),
            onBoardingScreen(
                "Training",
                "Workout plans designed to help you achieve\nyour fitness goals - whether losing weight or \nbuilding muscle",
                "https://images.unsplash.com/photo-1549476464-37392f717541?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=774&q=80"),
            onBoardingScreen(
                "Excercise",
                "Workout plans designed to help you achieve\nyour fitness goals - whether losing weight or \nbuilding muscle",
                "https://images.unsplash.com/photo-1550345332-09e3ac987658?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=774&q=80"),
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Center(
              child: SmoothPageIndicator(
                onDotClicked: (index) {
                  controller.animateToPage(index,
                      duration: const Duration(microseconds: 500),
                      curve: Curves.ease);
                },
                controller: controller,
                count: 4,
                effect: const WormEffect(
                    activeDotColor: Colors.white, dotColor: Colors.grey),
              ),
            ),
            const SizedBox(
              height: 60,
            ),
            Container(
              margin: const EdgeInsets.only(left: 20, right: 20, bottom: 40),
              alignment: Alignment.bottomCenter,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                      height: 50,
                      width: MediaQuery.of(context).size.width / 2.5,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(width: 2.0, color: Colors.white)),
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.transparent),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const SignInPage()));
                          },
                          child: const Text(
                            "Login",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ))),
                  Container(
                      height: 50,
                      width: MediaQuery.of(context).size.width / 2.5,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const SignUpPage()));
                          },
                          child: const Text(
                            "Sign Up",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          )))
                ],
              ),
            ),
          ],
        )
      ],
    ));
  }

  Container onBoardingScreen(String text1, text2, img) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 70),
      decoration: BoxDecoration(
          image: DecorationImage(image: NetworkImage(img), fit: BoxFit.cover)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            text1,
            style: const TextStyle(
                fontSize: 40, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          const SizedBox(
            height: 13,
          ),
          Text(
            text2,
            // "Workout plans designed to help you achieve \nyour fitness goals - whether losing weight or \nbuilding muscle",
            style: const TextStyle(fontSize: 16, color: Colors.white),
          ),
          const SizedBox(
            height: 150,
          )
        ],
      ),
    );
  }
}
