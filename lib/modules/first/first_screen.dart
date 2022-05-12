import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../../shared/shared.dart';
import '../../shared/utils/get_view.dart';
import 'first_ctl.dart';

// ignore: must_be_immutable
class FirstScreen extends View<FirstCtl> {
  // FirstScreen({Key? key}) : super(key: key);

  var allTexts = {
    const Locale('en', 'US'): {
      "menu_1": "home",
    },
    const Locale('th', 'TH'): {
      "menu_1": "หน้าหลัก",
      "menu_2": "หน้า2",
    }
  };
  final Locale? locale = Get.locale;
  // final

  FirstScreen({Key? key}) : super(key: key);

  @override
  phone() {
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
            const Text('width'),
            // Text('${ctl.width} width'),
            Text('text ${ctl.show.value} \n--locale${locale} \n--ts${Get.locale}'),
            Form(
              key: ctl.loginKey,
              child: Column(
                children: [
                  InputField(
                    controller: ctl.username,
                    labelText: 'Username',
                    validator: (text) {
                      return 'fail';
                    },
                  ),
                  InputField(
                    controller: ctl.password,
                    obscureText: true,
                    labelText: 'Password',
                    validator: (text) {
                      return null;
                    },
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: const Text('Login'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  BottomNavigationBar bottomBar() {
    final Map<String, String> text = allTexts[Get.locale]!;
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed, // Fixed
      selectedItemColor: const Color.fromARGB(255, 38, 38, 38),
      unselectedItemColor: const Color.fromARGB(255, 156, 156, 156),
      currentIndex: ctl.selectedIndex.value,
      onTap: ctl.onItemTapped,
      // ignore: prefer_const_literals_to_create_immutables
      items: [
        BottomNavigationBarItem(
          icon: const FaIcon(FontAwesomeIcons.a),
          label: text['menu_1'].toString(),
        ),
        BottomNavigationBarItem(
          icon: const FaIcon(FontAwesomeIcons.a),
          activeIcon: const FaIcon(FontAwesomeIcons.a),
          label: text['menu_2'].toString(),
        ),
        BottomNavigationBarItem(
          icon: const FaIcon(FontAwesomeIcons.a),
          label: text['menu_2'].toString(),
        ),
      ],
    );
  }
}
