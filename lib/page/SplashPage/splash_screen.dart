import 'package:electronic_health_app/page/SplashPage/page.dart';
import 'package:electronic_health_app/signin/signinpage.dart';
import 'package:electronic_health_app/signup/signuppage.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Splash extends StatefulWidget {
  static String routeName = "/splash";
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  final PageController _controller = PageController();

  @override
  void initState() {
    super.initState();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Stack(
          children: [
            PageView(
              controller: _controller,
              children: const [
                Page1(
                  "Bảo vệ sức khỏe tại nhà ",
                  "assets/images/icons.png",
                  Color(0xFF0D47A1),
                ),
                Page1(
                  "Khai báo y tế nhanh chóng",
                  "assets/images/splash1.png",
                  Color(0xFF0D47A1),
                ),
                Page1(
                  "Cập nhật thông tin chính xác",
                  "assets/images/splash.png",
                  Color(0xFF0D47A1),
                ),
              ],
            ),
            SafeArea(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const Spacer(),
                    SmoothPageIndicator(
                      controller: _controller,
                      count: 3,
                    ),
                    const SizedBox(height: 20),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: Stack(
                        children: <Widget>[
                          Positioned.fill(
                            child: Container(
                              decoration: const BoxDecoration(
                                gradient: LinearGradient(
                                  colors: <Color>[
                                    Color(0xFF0F6FC3),
                                    Color(0xFF42A5F5),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          TextButton(
                            style: TextButton.styleFrom(
                              foregroundColor: Colors.white,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 90, vertical: 16),
                              textStyle: const TextStyle(fontSize: 18),
                            ),
                            onPressed: () {
                              Navigator.pushNamed(
                                  context, SignInPage.routeName);
                            },
                            child: const Text('Đăng nhập'),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: Stack(
                        children: <Widget>[
                          Positioned.fill(
                            child: Container(
                              decoration: const BoxDecoration(
                                gradient: LinearGradient(
                                  colors: <Color>[
                                    Colors.red,
                                    Colors.pinkAccent
                                  ],
                                ),
                              ),
                            ),
                          ),
                          TextButton(
                            style: TextButton.styleFrom(
                              foregroundColor: Colors.white,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 102, vertical: 16),
                              textStyle: const TextStyle(fontSize: 18),
                            ),
                            onPressed: () {
                              Navigator.pushNamed(
                                  context, SignUpPage.routeName);
                            },
                            child: const Text('Đăng ký'),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
