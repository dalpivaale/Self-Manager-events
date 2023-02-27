import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class SchedulePage extends StatefulWidget{
    const SchedulePage({Key? key}) : super(key: key);
  @override 
  SchedulePageState createState() => SchedulePageState();
}

class SchedulePageState extends State<SchedulePage>{
  @override 
  Widget build(BuildContext context) => Scaffold(
      body: SfCalendar(
      todayHighlightColor: Color.fromARGB(255, 59, 213, 255),
      view:CalendarView.week,
      firstDayOfWeek: 1, // Monday as 1 day of the week
      //initialSelectedDate: DateTime(2023,02,22,12),//seleziona la data
    //Calendar widget maneggia per programmare gli orari. Appointamant class per costrutire gli appuntamenti
    dataSource: MeetingDataSource(getAppointments()),
    ),
   );
}
 List<Appointment> getAppointments(){
    List<Appointment> meetings = <Appointment>[];
    final DateTime today = DateTime.now();
    final DateTime startTime = DateTime(today.year,today.month,today.day,9,0,0); 
    final DateTime endTime = startTime.add(const Duration (hours:2));
    
    meetings.add(Appointment(
      startTime: startTime, 
      endTime: endTime,
      subject : 'Conferenza UNIPD',
      color:Color.fromARGB(255, 59, 213, 255))
      );
    return meetings;
  }

  class MeetingDataSource extends CalendarDataSource{
    MeetingDataSource(List<Appointment> source){ //costruttore della classe
      appointments= source;
    }
  }