import 'package:flutter/material.dart';

import 'base_state.dart';

abstract class BasePage<S extends BaseState> extends StatefulWidget{


  @override
  S createState() {
    return createBaseState();
  }
  S createBaseState();
}
