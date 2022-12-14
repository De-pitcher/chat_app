import 'package:chat_app/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../screens/chats_page.dart';
import '../screens/contacts.dart';
import '../screens/search.dart';
import '../screens/user.dart';

class ParentView extends StatefulWidget {
  static const id = '/';
  const ParentView({super.key});

  @override
  State<ParentView> createState() => _ParentViewState();
}

class _ParentViewState extends State<ParentView> {
  int _currentIndex = 0;

  final List<Widget> _navScreen = const [
    Contacts(),
    ChatsPage(),
    Search(),
    User()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _navScreen[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/icons/Vector.svg',
              color:
                  _currentIndex == 0 ? AppColor.blueColor : AppColor.greyColor,
            ),
            label: 'Contacts',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.chat,
              color:
                  _currentIndex == 1 ? AppColor.blueColor : AppColor.greyColor,
            ),
            label: 'Chats',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.search,
              color:
                  _currentIndex == 2 ? AppColor.blueColor : AppColor.greyColor,
            ),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/icons/Vector (1).svg',
              color:
                  _currentIndex == 3 ? AppColor.blueColor : AppColor.greyColor,
            ),
            label: 'User',
          ),
        ],
        // currentIndex: widget.cIndex == 0 ? _currentIndex : widget.cIndex,
        currentIndex: _currentIndex,
        selectedItemColor: AppColor.blueColor,
        onTap: (int index) {
          setState(() => _currentIndex = index);
        },
      ),
    );
  }
}
