import 'package:flutter/material.dart';
import 'package:ryde/addata.dart';
import 'package:ryde/features/car-screen/view/popularCarpage.dart';
import 'package:ryde/features/home/view/home_content.dart';
import 'package:ryde/features/home/viewmodel/home_viewmodel.dart';
import 'package:ryde/features/home/widgets/bottom_navbar.dart';
import 'package:ryde/features/screen/chat.dart';
import 'package:ryde/features/screen/history.dart';
import 'package:ryde/features/screen/profile.dart';
import '../widgets/home_header.dart';
import '../widgets/search_bar.dart';
import 'location_map.dart';
import '../widgets/recent_rides_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomeViewModel vm = HomeViewModel();

  final List<Widget> screens = const [
    HomeContentScreen(), // index 0
    HistoryScreen(), // index 1
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: screens[vm.navIndex], // Screen switching
      bottomNavigationBar: BottomNavBar(
        selectedIndex: vm.navIndex,
        onTap: (index) {
          setState(() {
            vm.onNavTap(index);
          });
        },
      ),
    );
  }
}
