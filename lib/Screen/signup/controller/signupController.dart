


import 'package:flutter/cupertino.dart';

mixin SignupController<T extends StatefulWidget> on State<T> {
  final nameController = TextEditingController();
  final mobileController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  
}