import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rsa_scan/rsa_scan.dart';

import '../../shared/utils/get_controller.dart';

class ForTestingCtl extends MyCtl {
  var dummy = ''.obs;
  rsaRead(BuildContext context) async {
    print('reading..');
    RsaIdBook idBook = await scanIdBook(context);
    print(idBook.idNumber);
    print(idBook.birthDate);
    print(idBook.gender);
    print(idBook.citizenshipStatus);
  }
}
