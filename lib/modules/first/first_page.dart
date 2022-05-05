import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../lang/lang.dart';
import '../../shared/shared.dart';
import '../../shared/utils/get_view.dart';
import 'first_ctl.dart';

class FirstScreen extends View<FirstCtl> {
  FirstScreen({Key? key}) : super(key: key);

  var data = {
    "menu_1": {
      'th': 'หน้าหลัก',
      'en': 'home',
    },
    "menu_2": {
      'th': 'สิทธิ พิเศษ',
      'en': 'special',
    },
  };
  final locale = Get.locale;

  @override
  buildObx() {
    var b = data['menu_1']![locale];
    return SafeArea(
      child: Scaffold(
        appBar: Common.appBar(),
        drawer: Common.drawer(),
        bottomNavigationBar: bottomBar(),
        // persistentFooterButtons: [
        //   const Text('text'),
        // ],
        body: Column(
          children: [
            Text('text ${ctx.show.value} --locale${locale} --ts${Get.locale}'),
          ],
        ),
      ),
    );
  }

  BottomNavigationBar bottomBar() {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed, // Fixed
      selectedItemColor: const Color.fromARGB(255, 38, 38, 38),
      unselectedItemColor: const Color.fromARGB(255, 156, 156, 156),
      currentIndex: ctx.selectedIndex.value,
      onTap: ctx.onItemTapped,
      // ignore: prefer_const_literals_to_create_immutables
      items: [
        const BottomNavigationBarItem(
          icon: FaIcon(FontAwesomeIcons.a),
          label: 'หน้าหลัก',
        ),
        const BottomNavigationBarItem(
          icon: FaIcon(FontAwesomeIcons.a),
          activeIcon: FaIcon(FontAwesomeIcons.a),
          label: 'สิทธิพิเศษ',
        ),
        const BottomNavigationBarItem(
          icon: FaIcon(FontAwesomeIcons.a),
          label: 'ข่าวสาร',
        ),
        const BottomNavigationBarItem(
          icon: FaIcon(FontAwesomeIcons.a),
          label: 'การแจ้งเตือน',
        ),
        const BottomNavigationBarItem(
          icon: FaIcon(FontAwesomeIcons.a),
          label: 'เกี่ยวกับ',
        ),
      ],
    );
  }
}
