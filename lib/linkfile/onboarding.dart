import 'package:bankapp/Screens/chooselog.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_preferences/shared_preferences.dart';

class onBoarding extends StatefulWidget {
  const onBoarding({Key? key}) : super(key: key);

  @override
  State<onBoarding> createState() => _onBoardingState();
}

class _onBoardingState extends State<onBoarding> {
  final _controller = PageController();
  bool islastPage = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Container(
            margin: EdgeInsets.only(
              bottom: MediaQuery.of(context).size.height * 0.15,
            ),
            child: PageView(
              controller: _controller,
              onPageChanged: (index) {
                setState(() {
                  islastPage = index == 2;
                });
              },
              children: const [
                buildPage(
                  title: "FAST AND ACCESSIBLE",
                  getImage: "images/trending-up-sharp-svgrepo-com.svg",
                  getImage2: "images/dollar-svgrepo-com.svg",
                  subText:
                      "Trade with zero Capital today.\nStart trading the forex and cypto market today  with zero capital",
                ),
                buildPage1(
                  title: "EASY TO USE",
                  getImage: "images/magnifying-glass-svgrepo-com-2.svg",
                  getImage2: "images/trending-up-sharp-svgrepo-com.svg",
                  subText:
                      "You can trade any instrument available, any lot size you wish at any time.",
                ),
                buildPage2(
                  title: "MANAGE & SAVE YOUR MONEY",
                  getImage: "images/bank-svgrepo-com.svg",
                  subText:
                      "You can trade any instrument available, any lot size you wish at any time.",
                ),
              ],
            ),
          ),
        ),
      ),
      bottomSheet: Container(
        color: Theme.of(context).scaffoldBackgroundColor,
        height: MediaQuery.of(context).size.height * 0.25,
        child: Container(
          //color: Colors.red,
          margin: EdgeInsets.only(
            bottom: 40,
            left: MediaQuery.of(context).size.width * 0.15,
            right: MediaQuery.of(context).size.width * 0.15,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                child: SmoothPageIndicator(
                  controller: _controller,
                  count: 3,
                  onDotClicked: (index) => _controller.animateToPage(index,
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.easeInOut),
                  effect: CustomizableEffect(
                    activeDotDecoration: DotDecoration(
                      width: 23,
                      height: 12,
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.circular(24),
                    ),
                    dotDecoration: DotDecoration(
                      width: 10,
                      height: 10,
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    spacing: 8.0,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () => _controller.jumpToPage(2),
                    child: Text(
                      "Skip",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  islastPage
                      ? ElevatedButton(
                          onPressed: () async {
                            //await storage.write(key: 'showhome', value: 'true');
                            final prefs = await SharedPreferences.getInstance();
                            prefs.setBool("showhome", true);
                            Navigator.pushNamed(context, '/chooselog');
                          },
                          child: Text("Get Started"),
                          style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25),
                              ),
                              backgroundColor: Theme.of(context).primaryColor),
                        )
                      : ElevatedButton(
                          onPressed: () {
                            _controller.nextPage(
                                duration: const Duration(milliseconds: 500),
                                curve: Curves.easeInOut);
                          },
                          child: Icon(Icons.arrow_forward_ios),
                          style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25),
                              ),
                              backgroundColor: Theme.of(context).primaryColor),
                        ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class buildPage extends StatelessWidget {
  const buildPage({
    Key? key,
    required this.title,
    required this.subText,
    required this.getImage,
    required this.getImage2,
  }) : super(key: key);

  final String title;
  final String subText;
  final String getImage;
  final String getImage2;
  @override
  Widget build(BuildContext context) {
    return Container(
      //color: Colors.black,
      child: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.1,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.8,
            height: MediaQuery.of(context).size.height * 0.3,
            child: Center(
              child: Stack(
                children: [
                  Container(
                    //color: Colors.red,
                    height: MediaQuery.of(context).size.height * 0.15,
                    margin: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width * 0.3,
                    ),
                    child: SvgPicture.asset(
                      getImage2,
                      //height: MediaQuery.of(context).size.height * 0.2,
                      width: MediaQuery.of(context).size.height * 0.2,
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Center(
                    child: Container(
                      margin: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.05,
                      ),
                      height: MediaQuery.of(context).size.height * 0.25,
                      width: MediaQuery.of(context).size.height * 0.8,
                      //color: Colors.blue,
                      child: SvgPicture.asset(
                        getImage,
                        color: Color.fromARGB(255, 54, 89, 117),
                        //height: MediaQuery.of(context).size.height * 0.25,
                        //width: MediaQuery.of(context).size.width * 1.5,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.05,
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.65,
            height: MediaQuery.of(context).size.height * 0.05,
            child: FittedBox(
              child: Text(
                title,
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.05,
          ),
          Container(
            //color: Colors.black,
            width: MediaQuery.of(context).size.width * 1.5,
            height: MediaQuery.of(context).size.height * 0.17,
            margin: EdgeInsets.symmetric(horizontal: 30),
            child: Text(
              subText,
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          //SizedBox(height: 40,),
        ],
      ),
    );
  }
}

class buildPage1 extends StatelessWidget {
  const buildPage1({
    Key? key,
    required this.title,
    required this.subText,
    required this.getImage,
    required this.getImage2,
  }) : super(key: key);

  final String title;
  final String subText;
  final String getImage;
  final String getImage2;
  @override
  Widget build(BuildContext context) {
    return Container(
      //color: Colors.black,
      child: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.1,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.8,
            height: MediaQuery.of(context).size.height * 0.3,
            child: Center(
              child: Stack(
                children: [
                  Center(
                    child: Container(
                      // margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.05,),
                      height: MediaQuery.of(context).size.height * 0.20,
                      width: MediaQuery.of(context).size.height * 0.6,
                      //color: Colors.blue,
                      child: SvgPicture.asset(
                        getImage,
                        color: Color.fromARGB(255, 54, 89, 117),
                        //height: MediaQuery.of(context).size.height * 0.25,
                        //width: MediaQuery.of(context).size.width * 1.5,
                      ),
                    ),
                  ),
                  Container(
                    //color: Colors.red,
                    width: MediaQuery.of(context).size.width * 0.6,
                    height: MediaQuery.of(context).size.height * 0.2,
                    margin: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width * 0.1,
                      vertical: MediaQuery.of(context).size.height * 0.04,
                    ),
                    child: FittedBox(
                      child: SvgPicture.asset(
                        getImage2,
                        //height: MediaQuery.of(context).size.height * 0.2,
                        //width: MediaQuery.of(context).size.height * 0.8,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.05,
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.65,
            height: MediaQuery.of(context).size.height * 0.05,
            child: FittedBox(
              child: Text(
                title,
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.05,
          ),
          Container(
            //color: Colors.black,
            width: MediaQuery.of(context).size.width * 1.5,
            height: MediaQuery.of(context).size.height * 0.17,
            margin: EdgeInsets.symmetric(horizontal: 30),
            child: Text(
              subText,
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          //SizedBox(height: 40,),
        ],
      ),
    );
  }
}

class buildPage2 extends StatelessWidget {
  const buildPage2({
    Key? key,
    required this.title,
    required this.subText,
    required this.getImage,
  }) : super(key: key);

  final String title;
  final String subText;
  final String getImage;

  @override
  Widget build(BuildContext context) {
    return Container(
      //color: Colors.black,
      child: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.1,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.8,
            height: MediaQuery.of(context).size.height * 0.3,
            child: Center(
              child: Stack(
                children: [
                  Center(
                    child: Container(
                      // margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.05,),
                      height: MediaQuery.of(context).size.height * 0.20,
                      width: MediaQuery.of(context).size.height * 0.6,
                      //color: Colors.blue,
                      child: SvgPicture.asset(
                        getImage,
                        color: Color.fromARGB(255, 54, 89, 117),
                        //height: MediaQuery.of(context).size.height * 0.25,
                        //width: MediaQuery.of(context).size.width * 1.5,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.05,
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.65,
            height: MediaQuery.of(context).size.height * 0.05,
            child: FittedBox(
              child: Text(
                title,
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.05,
          ),
          Container(
            //color: Colors.black,
            width: MediaQuery.of(context).size.width * 1.5,
            height: MediaQuery.of(context).size.height * 0.17,
            margin: EdgeInsets.symmetric(horizontal: 30),
            child: Text(
              subText,
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          //SizedBox(height: 40,),
        ],
      ),
    );
  }
}
