import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:remindmi/app/components/dependent_task_view.dart';
import 'package:remindmi/app/components/task_list_card.dart';
import 'package:remindmi/app/helper/utils.dart';
import 'package:remindmi/app/modules/dependent_home_task/dependent_home_task_controller.dart';

//______DEPENDENT HOME PAGE____________//
class DependentHomeTaskListViews extends StatelessWidget {
  DependentHomeTaskListViews({super.key});
  final getStorge = GetStorage();

  final dependent_home_task_controller = Get.put(DependentHomeTaskListController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 32,
          ),
          Container(
              margin: EdgeInsets.fromLTRB(16, 38, 0, 0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: RichText(
                  text: TextSpan(
                    text: 'Hi ',
                    style: GoogleFonts.dmSans(
                        fontSize: 32,
                        fontWeight: FontWeight.w700,
                        color: Color.fromARGB(255, 0, 0, 0)),
                    children: <InlineSpan>[
                      TextSpan(
                        text: GetFirtsName(getStorge.read('fullName')),
                        style: GoogleFonts.dmSans(
                            fontSize: 32,
                            fontWeight: FontWeight.w700,
                            color: Color.fromARGB(255, 0, 0, 0)),
                      ),
                      WidgetSpan(
                          alignment: PlaceholderAlignment.middle,
                          child: Container(
                            margin: EdgeInsets.fromLTRB(18.25, 0, 0, 0),
                            child: Image.asset(
                              'assets/images/emoji.png',
                              height: 35,
                              width: 35,
                            ),
                          )),
                    ],
                  ),
                ),
              )),
          SizedBox(
            height: 11,
          ),
          Container(
            margin: EdgeInsets.fromLTRB(16, 0, 0, 0),
            child: Align(
                alignment: Alignment.centerLeft,
                child: RichText(
                  text: TextSpan(children: <InlineSpan>[
                    WidgetSpan(
                        alignment: PlaceholderAlignment.middle,
                        child: Container(
                          margin: EdgeInsets.fromLTRB(0, 0, 11, 0),
                          child: Image.asset(
                            'assets/images/chotu.png',
                            height: 39,
                            width: 39,
                          ),
                        )),
                    TextSpan(
                      text: 'Running Tasks',
                      style: GoogleFonts.dmSans(
                        fontSize: 22,
                        fontWeight: FontWeight.w500,
                        color: Color.fromARGB(255, 69, 69, 209),
                      ),
                    ),
                  ]),
                )),
          ),
          Expanded(
            child: Obx(
              () => ListView.builder(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                itemCount: dependent_home_task_controller.tasks.length,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onLongPress: () { // If a task is long pressed, "complete task" option pops up
                      showModalBottomSheet(
                          backgroundColor: Colors.transparent,
                          isScrollControlled: true,
                          context: context,
                          builder: (context) {
                            return DependentTaskViewCard(
                              indexNo: index,
                              row: dependent_home_task_controller.tasks[index],
                            );
                          });
                    },
                    child: TaskListCard(
                      index: index,
                      row: dependent_home_task_controller.tasks[index],
                    ),
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
