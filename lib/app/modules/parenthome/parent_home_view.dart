import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:remindmi/app/modules/signup/signup_controller.dart';

class ParentHomeView extends GetView<SignupController> {
  const ParentHomeView({Key? key}) : super(key: key);

  // await Firebase.initializeApp();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ParentHome(),
    );
  }
}

class ParentHome extends StatefulWidget {
  const ParentHome({super.key});

  @override
  State<ParentHome> createState() => _ParentHomeState();
}

class _ParentHomeState extends State<ParentHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: FutureBuilder(
      builder: (context, snapshot) {
        return const Center(
          // child: CircularProgressIndicator(),
          child: Text('parent home page'),
        );
      },
    ));
  }
}
