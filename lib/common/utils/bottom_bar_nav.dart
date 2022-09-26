import 'package:chat_app/common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BottomBarNav extends ConsumerStatefulWidget {
  const BottomBarNav({super.key});

  @override
  ConsumerState<BottomBarNav> createState() => _BottomBarNavState();
}

class _BottomBarNavState extends ConsumerState<BottomBarNav> {
  // ConnectionUtil connectionStatus = ConnectionUtil.getInstance();

  @override
  void initState() {
    // connectionStatus.initialize();
    super.initState();
  }

  int _currentIndex = 1;
  @override
  Widget build(BuildContext context) {
    // connectionStatus.connectionChange.listen((event) {
    //   setState(() async{
    //     ref.watch(updateStatusProvider
    //       .call(connectionStatus.hasConnection));
    //   });
    // });
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      items: [
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            'assets/icons/Vector.svg',
            color:
                _currentIndex == 0 ? AppColor.blackColor : AppColor.greyColor,
          ),
          label: 'Contacts',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.chat,
            color:
                _currentIndex == 1 ? AppColor.blackColor : AppColor.greyColor,
          ),
          label: 'Chats',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.search,
            color:
                _currentIndex == 2 ? AppColor.blackColor : AppColor.greyColor,
          ),
          label: 'Search',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            'assets/icons/Vector (1).svg',
            color:
                _currentIndex == 3 ? AppColor.blackColor : AppColor.greyColor,
          ),
          label: 'User',
        ),
      ],
      // currentIndex: widget.cIndex == 0 ? _currentIndex : widget.cIndex,
      currentIndex: _currentIndex,
      selectedItemColor: const Color(0xFF002DE3),
      onTap: (int index) {
        setState(() {
          _currentIndex = index;
        });
        // Navigator.pushNamed(context, nav[_currentIndex]);
      },
    );
  }
}