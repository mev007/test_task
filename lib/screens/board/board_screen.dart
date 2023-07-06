
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:test_task/screens/other/other_screen.dart';

import '../home/home_screen.dart';

class BoardScreen extends StatefulWidget {
  const BoardScreen({super.key});

  @override
  State<BoardScreen> createState() => _BoardScreenState();
}

class _BoardScreenState extends State<BoardScreen> {
  int _selectedTab = 0;

  void onSelectedTab(int index) {
    if (_selectedTab == index) return;
    setState(() => _selectedTab = index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF101113),
      body: IndexedStack(
        index: _selectedTab,
        children: const [
          HomeScreen(),
          OtherScreen('222'),
          OtherScreen('333'),
          OtherScreen('444'),
        ],
      ),
      extendBody: true,
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
        child: Stack(
          alignment: Alignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(32),
              child: Container(
                height: 65,
                color: const Color(0xFF101113),
              ),
            ),
            BottomNavigationBar(
              backgroundColor: Colors.transparent,
              type: BottomNavigationBarType.fixed,
              elevation: 0,
              currentIndex: _selectedTab,
              showSelectedLabels: false,
              showUnselectedLabels: false,
              onTap: onSelectedTab,
              items: [
                _buildCircle(0),
                _buildCircle(1),
                _buildCircle(2),
                _buildCircle(3),
              ],
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(32),
              child: BackdropFilter(
                filter: ImageFilter.blur(
                  sigmaX: 25,
                  sigmaY: 25,
                ),
                child: Container(
                  height: 65,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(32),
                    boxShadow: [
                      CustomBoxShadow(
                        blurRadius: 25,
                        color: Colors.white.withOpacity(.3),
                        offset: const Offset(0, 1),
                        blurStyle: BlurStyle.outer,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            BottomNavigationBar(
              backgroundColor: Colors.transparent,
              type: BottomNavigationBarType.fixed,
              elevation: 0,
              currentIndex: _selectedTab,
              showSelectedLabels: false,
              showUnselectedLabels: false,
              onTap: onSelectedTab,
              items: [
                _buildItem(0, 'runner'),
                _buildItem(1, 'footwear'),
                _buildItem(2, 'reyt'),
                _buildItem(3, 'lightning'),
              ],
            ),
          ],
        ),
      ),
    );
  }

  BottomNavigationBarItem _buildCircle(int i) {
    return BottomNavigationBarItem(
      icon: CircleAvatar(
        backgroundColor:
            _selectedTab == i ? const Color(0xFF8885D4) : Colors.transparent,
        radius: 30,
      ),
      label: '',
    );
  }

  BottomNavigationBarItem _buildItem(int i, String nameIcon) {
    return BottomNavigationBarItem(
      icon: Opacity(
        opacity: _selectedTab == i ? 1 : 0.32,
        child: Image.asset('assets/images/$nameIcon.png'),
      ),
      label: '',
    );
  }
}




class CustomBoxShadow extends BoxShadow {
  final BlurStyle blurStyle;

  const CustomBoxShadow({
    super.color,
    super.offset,
    super.blurRadius,
    this.blurStyle = BlurStyle.normal,
  });

  @override
  Paint toPaint() {
    final Paint result = Paint()
      ..color = color
      ..maskFilter = MaskFilter.blur(blurStyle, blurSigma);
    assert(() {
      if (debugDisableShadows) {
        result.maskFilter = null;
      }
      return true;
    }());
    return result;
  }
}

