

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:remindmi/app/modules/home/widget/home_page_task_card.dart';
import 'package:remindmi/constants/images.dart';

class DashboardView extends StatefulWidget {
  const DashboardView({super.key});

  @override
  State<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 228, 226, 226),
      floatingActionButton: FloatingActionButton(
        onPressed: (){},
        backgroundColor: CupertinoColors.activeGreen,
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.white,
        toolbarHeight: 100,
        elevation: 0,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Hi',
              style: TextStyle(
                fontSize: 20,
                color: Colors.black,
                fontWeight: FontWeight.w600,
              ),
            ),
            Row(
              children: [
                Image.asset(
                  Images.remindmiIcon,
                  height: 14,
                  width: 14,
                  fit: BoxFit.cover,
                ),
                SizedBox(
                  width: 4,
                ),
                Text(
                  'Running Tasks',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.purple,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ],
        ),
        
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: SizedBox(
              height: 16,
            ),
          ),
          SliverList(delegate: SliverChildBuilderDelegate(
            (context,index){
              return HomePageTaskCard();
            },
            childCount: 20
          )
          
          ,)
        ],
      ),
    );
  }
}