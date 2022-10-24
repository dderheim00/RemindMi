import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:remindmi/app/modules/childrenhome/children_home_controller.dart';
import 'package:remindmi/app/modules/signup/signup_controller.dart';

class ChildrenHomeView extends GetView<ChildrenHomeController> {
  const ChildrenHomeView({Key? key}) : super(key: key);

  // await Firebase.initializeApp();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ChildrenHome(),
    );
  }
}

class ChildrenHome extends StatefulWidget {
  const ChildrenHome({super.key});

  @override
  State<ChildrenHome> createState() => _ChildrenHomeState();
}

class _ChildrenHomeState extends State<ChildrenHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: FutureBuilder(
      builder: (context, snapshot) {
        return const Center(
          // child: CircularProgressIndicator(),
          child: Text('children home page'),
        );
      },
    ));
  }
}
