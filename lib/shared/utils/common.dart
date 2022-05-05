import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class Common {
  static appBar() {
    return AppBar(
      // backgroundColor: ColorConst.lightGray,
      iconTheme: IconThemeData(color: Colors.black),
      centerTitle: true,
      title: TextField(
        maxLines: 1,
        decoration: InputDecoration(
          prefixIcon: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FaIcon(FontAwesomeIcons.searchengin, color: Colors.black),
            ],
          ),
          hintText: 'ค้นหา',
        ),
      ),
      actions: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: InkWell(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: FaIcon(FontAwesomeIcons.message),
                ),
                onTap: () => {
                  Get.defaultDialog(title: 'Message', content: const Text('Next version')),
                },
              ),
            ),
          ],
        ),
      ],
    );
  }

  static drawer() {
    return Drawer(
      // semanticLabel: 'ee',
      // backgroundColor: Colors.black,
      child: ListView(
        children: [
          const CircleAvatar(),
          const Text('ชื่อ นามสกุล'),
          DrawerTile(
            title: 'โปรไฟล์',
            onTap: () {},
          ),
          DrawerTile(
            title: 'สิทธิ พิเศษ',
            onTap: () {},
          ),
          DrawerTile(
            title: 'ส่วนลดร้านอาหาร',
            onTap: () {},
          ),
          DrawerTile(
            title: 'ส่วนลดโรงแรม',
            onTap: () {},
          ),
          DrawerTile(
            title: 'ส่วนลดการใช้บริการสปา',
            onTap: () {},
          ),
          DrawerTile(
            title: 'สิทธิพิเศษการจองอสังหาริมทรัพย์',
            onTap: () {},
          ),
          DrawerTile(
            title: 'ติดต่อไซมิส',
            onTap: () {},
          ),
          DrawerTile(
            title: 'การตั้งค่า',
            onTap: () {},
          ),
          // ElevatedButton(
          //   onPressed: () {
          //     Get.toNamed(Routes.uiTestPage);
          //   },
          //   child: const Text('UI test page'),
          // ),
        ],
      ),
    );
  }

  static SizedBox rowHeight({double height = 30}) {
    return SizedBox(height: height);
  }

  static SizedBox rowWidth({double width = 30}) {
    return SizedBox(width: width);
  }

  static toast(String title) {
    return Get.defaultDialog(title: title);
  }
}
class DrawerTile extends StatelessWidget {
  final String title;

  final Function() onTap;
  DrawerTile({
    Key? key,
    required this.title,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        title,
        // style: TextStyle(color: ColorConst.black),
      ),
      onTap: onTap,
    );
  }
}