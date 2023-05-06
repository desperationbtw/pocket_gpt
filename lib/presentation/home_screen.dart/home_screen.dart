import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:animations/animations.dart';
import 'package:flutter/material.dart';

import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';

import '../dialog_screen/dialog_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  late TabController tabController;

  final iconList = <IconData>[
    Icons.person,
    Icons.list_rounded,
    Icons.history_rounded,
    Icons.settings,
  ];

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 4, initialIndex: 0, vsync: this);
    tabController.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: OpenContainer(
          transitionType: ContainerTransitionType.fadeThrough,
          closedColor: const Color(0xfffefefe),
          openColor: const Color(0xff151220),
          openBuilder: (BuildContext context, VoidCallback _) {
            return const DialogScreen();
          },
          closedShape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(46 / 2),
            ),
          ),
          closedBuilder: (BuildContext context, VoidCallback openContainer) {
            return Container(
              color: const Color(0xfffefefe),
              height: 46,
              width: 46,
              child: const Center(
                child: Icon(
                  Icons.add,
                  color: Color(0xff1e1a2b),
                ),
              ),
            );
          },
        ),
        body: TabBarView(
          controller: tabController,
          children: [
            Scaffold(appBar: AppBar(title: const Text('Luckshery'))),
            const Text('1'),
            const Text('2'),
            const Text('3'),
          ],
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
        bottomNavigationBar: AnimatedBottomNavigationBar.builder(
          itemCount: iconList.length,
          tabBuilder: (int index, bool isActive) {
            final color = isActive ? const Color(0xfffefefe) : const Color(0xff7c7693);
            return Icon(
              iconList[index],
              size: 24,
              color: color,
            );
          },
          backgroundColor: const Color(0xff1e1a2b),
          activeIndex: tabController.index,
          splashColor: const Color(0xfffefefe),
          splashSpeedInMilliseconds: 300,
          notchSmoothness: NotchSmoothness.defaultEdge,
          gapLocation: GapLocation.end,
          onTap: (index) => setState(() => tabController.animateTo(index)),
        ),
      ),
    );
  }
}
