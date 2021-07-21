import 'package:flutter/material.dart';
import 'package:todolist/components/app_title.dart';
import 'package:todolist/components/navigations/app_banner.dart';
import 'package:get/get.dart';
import 'package:todolist/components/navigations/tabs.dart';
import 'package:todolist/models/task.dart';
import 'package:todolist/utils/text_styles.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  late List<Task> tasks;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this.tasks = [
      Task(
        id: "1",
        title: "Learn Something new",
        completed: false
      ),
      Task(
          id: "2",
          title: "Learn Something new",
          completed: false
      ),
      Task(
          id: "3",
          title: "Learn Something new",
          completed: false
      )
    ];
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBanner(
        toolbarHeight: MediaQuery.of(context).size.height * 0.31,
        header: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            AppTitle(),
            Spacer(),
            IconButton(
              icon: Icon(Icons.settings, color: Colors.white),
              onPressed: (){
              },
            )
          ],
        ),
        content: RichText(
          text: TextSpan(
            text: "greet".tr + "\n",
            style: kGreetingTextStyle.copyWith(color: Color(0xFF6366F1)),
            children: [
              TextSpan(
                text: "tasks_summary".trParams({
                  "incomplete" : "0",
                  "completed" : "0"
                }),
                style: kGreetingTextStyle.copyWith(color: Colors.black),

              )
            ]
          ),
        ),
        bottom: Tabs(
          tabs: [
            TabItem(
              title: "All",
            ),
            TabItem(
              title: "Uncompleted",
            ),
            TabItem(
              title: "Completed",
            )
          ],
          onTabChanged: (int index){
            print(index);
          },
        ),
      ),
      body: Container(
        margin: EdgeInsets.only(top: 15),
        child: Card(
          margin: EdgeInsets.zero,
          clipBehavior:  Clip.hardEdge,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(25)
            )
          ),
          elevation: 25,
          child:  ListView.builder(
            itemBuilder: buildTaskListItem,
            itemCount: this.tasks.length,
          )
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.lightBlue,
        child: Icon(Icons.add),
        onPressed: (){

        },
      ),
    );
  }

  Widget buildTaskListItem(BuildContext context, int index){
    Task task = this.tasks.elementAt(index);
    return ListTile(
        title: Text(task.title),
    );
  }
}

