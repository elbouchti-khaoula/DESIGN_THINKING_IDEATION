import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:projet_pfa/Ideation_App/src/ui/ideation_main_page.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

import 'package:url_launcher/url_launcher.dart';

class MeetingPage extends StatefulWidget {
  const MeetingPage({Key? key}) : super(key: key);

  @override
  State<MeetingPage> createState() => _MeetingPageState();
}

class _MeetingPageState extends State<MeetingPage> {
  @override
  Widget build(BuildContext context) {
    int currentState = 1;

    return Scaffold(
        backgroundColor: Colors.grey[100],
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        appBar: AppBar(
          backgroundColor: const Color.fromRGBO(3, 4, 94, 1),
          title: Text("Meeting Page"),
          centerTitle: true,
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: const Color.fromRGBO(3, 4, 94, 1),
          onPressed: () {
            //launchUrl(Uri.parse("https://google.com/"));
          },
          child: Center(
            child: Text(
              "  Create a meeting",
              style: TextStyle(fontSize: 9),
            ),
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          color: const Color.fromRGBO(3, 4, 94, 1),
          shape: CircularNotchedRectangle(),
          notchMargin: 12,
          child: Container(
            height: 60,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  IconButton(
                    icon: Icon(Icons.home),
                    color: currentState == 0 ? Colors.white : Colors.white54,
                    onPressed: () {
                      setState(() {
                        currentState = 0;
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => IdeationMainPage()));
                      });
                    },
                    iconSize: 40,
                  ),
                  IconButton(
                    icon: Icon(Icons.meeting_room),
                    color: currentState == 1 ? Colors.white : Colors.white54,
                    onPressed: () {
                      setState(() {
                        currentState = 1;
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => MeetingPage()));
                      });
                    },
                    iconSize: 40,
                  )
                ],
              ),
            ),
          ),
        ),
        body: SfCalendar(
          view: CalendarView.week,
          dataSource: MeetingDataSource(_getDataSource()),
        ));
  }
}

List<Appointment> _getDataSource() {
  final List<Appointment> meetings = <Appointment>[];
  final DateTime today = DateTime.now();
  final DateTime startTime =
      DateTime(today.year, today.month, today.day, 9, 0, 0);
  final DateTime endTime = startTime.add(const Duration(hours: 2));
  meetings.add(Appointment(
      startTime: startTime,
      endTime: endTime,
      subject: 'Conference',
      color: const Color(0xFF0F8644)));
  return meetings;
}

class MeetingDataSource extends CalendarDataSource {
  MeetingDataSource(List<Appointment> source) {
    appointments = source;
  }

  @override
  DateTime getStartTime(int index) {
    return appointments![index].from;
  }

  @override
  DateTime getEndTime(int index) {
    return appointments![index].to;
  }

  @override
  String getSubject(int index) {
    return appointments![index].eventName;
  }
}
