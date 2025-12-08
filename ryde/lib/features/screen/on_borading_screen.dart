import 'package:flutter/material.dart';
import 'package:ryde/features/screen/get_started.dart';

class OnboardingPages extends StatefulWidget {
  const OnboardingPages({super.key});

  @override
  State<OnboardingPages> createState() => _OnboardingPagesState();
}

class _OnboardingPagesState extends State<OnboardingPages> {
  final PageController _controller = PageController();
  int pageIndex = 0;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // Skip button
            Align(
              alignment: Alignment.topRight,
              child: TextButton(
                onPressed: () {
                  // e.g. go directly to GetStarted
                  // Navigator.pushReplacement(
                  //   context,
                  //   MaterialPageRoute(builder: (_) => GetStartedPage()),
                  // );
                },
                child: const Text(
                  "Skip",
                  style: TextStyle(color: Colors.black87),
                ),
              ),
            ),

            // ---------- PAGES ----------
            Expanded(
              child: PageView(
                controller: _controller,
                onPageChanged: (index) {
                  setState(() => pageIndex = index);
                },
                children: [
                  // --------------- PAGE 1 ------------------
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          const SizedBox(height: 20),

                          Image.asset(
                            "assets/images/onboarding1.png",
                            // make it responsive instead of fixed 360
                            height: size.height * 0.35,
                          ),

                          const SizedBox(height: 20),

                          RichText(
                            textAlign: TextAlign.center,
                            text: const TextSpan(
                              style: TextStyle(
                                fontSize: 30, // a bit smaller for small screens
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                              children: [
                                TextSpan(
                                  text:
                                      "The best car in your hands with ",
                                ),
                                TextSpan(
                                  text: "Ryde",
                                  style: TextStyle(
                                    color: Colors.blue,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),

                          const SizedBox(height: 12),

                          Text(
                            "Discover the convenience of finding your perfect ride with our Ryde App",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.grey.shade700,
                            ),
                          ),

                          const SizedBox(height: 20),
                        ],
                      ),
                    ),
                  ),

                  // --------------- PAGE 2 ------------------
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          const SizedBox(height: 20),

                          Image.asset(
                            "assets/images/onboarding2.png",
                            height: size.height * 0.35,
                          ),

                          const SizedBox(height: 20),

                          const Text(
                            "The perfect ride is just a tap away!",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          const SizedBox(height: 12),

                          Text(
                            "Your journey begins with Ryde. Find your ideal ride effortlessly.",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.grey.shade700,
                            ),
                          ),

                          const SizedBox(height: 20),
                        ],
                      ),
                    ),
                  ),

                  // --------------- PAGE 3 ------------------
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          const SizedBox(height: 20),

                          Image.asset(
                            "assets/images/onboarding3.png",
                            height: size.height * 0.35,
                          ),

                          const SizedBox(height: 20),

                          const Text(
                            "Your ride, your way.\nLet's get started!",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          const SizedBox(height: 12),

                          Text(
                            "Enter your destination, sit back, and let us take care of the rest.",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.grey.shade700,
                            ),
                          ),

                          const SizedBox(height: 20),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 10),

            // ---------------- PAGE INDICATOR --------------------
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                3,
                (index) => AnimatedContainer(
                  duration: const Duration(milliseconds: 250),
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  width: pageIndex == index ? 22 : 8,
                  height: 8,
                  decoration: BoxDecoration(
                    color: pageIndex == index
                        ? Colors.blue
                        : Colors.blue.shade100,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 20),

            // ---------------- BUTTON --------------------
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: GestureDetector(
                onTap: () {
                  if (pageIndex < 2) {
                    _controller.nextPage(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                    );
                  } else {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const GetStartedPage(),
                      ),
                    );
                  }
                },
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    pageIndex == 2 ? "Get started" : "Next",
                    style: const TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 35),
          ],
        ),
      ),
    );
  }
}
