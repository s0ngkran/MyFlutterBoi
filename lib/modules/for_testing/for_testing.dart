import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';

import '../../shared/utils/get_view.dart';
import 'for_testing_ctl.dart';

class ForTesting extends View<ForTestingCtl> {
  ForTesting({Key? key}) : super(key: key);
  phone(context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Text('for testing page ${ctl.dummy}'),
          ElevatedButton(
            onPressed: () {
              ctl.rsaRead(context);
            },
            child: const Text('RSA read'),
          )
        ],
      ),
    );
  }
}
