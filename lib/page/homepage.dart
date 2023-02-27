import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class HomePage extends StatefulWidget{
    const HomePage({Key? key}) : super(key: key);
  @override 
  HomePageState createState() => HomePageState();
}
class HomePageState extends State<HomePage>{
   final chartData = _riempimento();
  @override 
  Widget build(BuildContext context) => Scaffold(
      body: Column(
        children: [
              Row(
                children: [
                  SizedBox(width: 10),
                  Icon(Icons.face,color: Color.fromARGB(255, 44, 48, 44),size: 50.0,),
                      Column(
                        children: [
                          SizedBox(height: 10),
                          Container(
                              margin: EdgeInsets.all(5),
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                              color: Color.fromARGB(255, 246, 247, 248),
                              border: Border.all(
                              color: Color.fromARGB(255, 250, 252, 253),
                              width: 4,),
                              borderRadius: BorderRadius.circular(10.0),
                              /*gradient: LinearGradient(
                              colors: [Colors.white, Color(0xFF75C0FC)],
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight),*/
                               ),
                              child: Text(
                                  'Hello George! :)',style: TextStyle(fontSize: 20, color: Color.fromARGB(255, 157, 145, 145)),                              
                                          ),
                            ), 
                            Text('Thursday, 22 July',style: TextStyle(fontSize: 20, color: Colors.black,fontWeight:FontWeight.bold)),//qui
                        ],
                      ),
                    ],
                  ),
           
          Row(children:[
            //SizedBox(width: 20,height: 10,),
            Container(
               margin: EdgeInsets.all(10), padding: EdgeInsets.all(10), decoration: BoxDecoration(
                        color: Color.fromARGB(255, 8, 8, 8),
                        border: Border.all(
                         color: Color.fromARGB(255, 8, 8, 8),
                         width: 4),borderRadius: BorderRadius.circular(10.0)),
                 child: Padding(
              padding: EdgeInsets.all(10.0),
              child: CircularPercentIndicator(radius: 30,percent : 0.75,lineWidth : 5.0,animation: true, animationDuration:5000 ,
              center: Text('75%', style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.w600, color: Color.fromARGB(255, 251, 250, 250)),),
                circularStrokeCap: CircularStrokeCap.round,  progressColor: Colors.redAccent,backgroundColor: Color.fromARGB(207, 252, 254, 253),
                header:Text('Level 2',style: TextStyle(color:Colors.white )),restartAnimation: true,),)
            ),  

              // SizedBox(width: 5),
               Container( margin: EdgeInsets.all(10), padding: EdgeInsets.all(10), decoration: BoxDecoration(
                        color: Color.fromARGB(255, 0, 4, 5),
                        border: Border.all(
                         color: Color.fromARGB(255, 251, 252, 253),
                         width: 4),borderRadius: BorderRadius.circular(10.0),
                        ),
                 child: Padding(
              padding: EdgeInsets.all(10.0),
              child: LinearPercentIndicator(
                  width: 80,
                  animation: true,
                  lineHeight: 20.0,
                  animationDuration: 2500,                 
                  percent: 0.8,
                  center: Text("190",style: TextStyle(color: Color.fromARGB(255, 4, 4, 4))),
                  trailing: Text("Scores", style: TextStyle(color: Colors.white)),
                  linearStrokeCap: LinearStrokeCap.roundAll,
                  progressColor: Color.fromARGB(255, 251, 251, 25),
           ),
            ),  
               ),
               ]
               ),
              Row(
                children: [
                  Container(
                    width: 150,
                      height: 200,
                    margin: EdgeInsets.all(4), padding: EdgeInsets.all(4), decoration: BoxDecoration(gradient: LinearGradient(begin: Alignment.topLeft,
                  end: Alignment.bottomRight,colors: [Color.fromARGB(255, 245, 4, 4),Color.fromARGB(255, 244, 252, 4)]),borderRadius: BorderRadius.circular(12)),
                    child:
                    Column(children: [
                      SizedBox(height: 30,),
                      Icon(size: 40,Icons.emoji_events_rounded,color: Color.fromARGB(255, 97, 3, 238),),
                      Text("Awards", style: TextStyle(color: Color.fromARGB(255, 253, 251, 251),fontSize:30)),
                      SizedBox(height: 10),
                      Text("3", style: TextStyle(color: Color.fromARGB(255, 253, 251, 251),fontSize:30)),
                      
                    ],
                    )
                    ),
                    Container(
                      width: 200,
                      height: 300,
                       margin: EdgeInsets.all(1), padding: EdgeInsets.all(1),
                       child: SfCartesianChart(   
                          title: ChartTitle(
                  text: 'About last 7 days',
                  backgroundColor: Color.fromARGB(255, 253, 253, 251),
                  //borderColor: Colors.blue,
                  borderWidth: 2),           
                 primaryXAxis: CategoryAxis(),
                   primaryYAxis: NumericAxis(   
                   plotBands: <PlotBand>[
        PlotBand(
          //text:'GOAL_BOUND' ,
                 color: Color.fromARGB(255, 17, 16, 17),
          //start: obbiettivo,
          //end: obbiettivo,
          //Specify the width for the line
                    borderWidth: 2,
          //Specify the dash array for the line
          /*dashArray: const <double>[4, 5]*/)
                ]),
          series: <ChartSeries<ChartSampleData, String>> [
                   LineSeries<ChartSampleData, String> (
                     color: Colors.orangeAccent ,
         // pointColorMapper: MaterialAccentColor.200,
                    dataSource: chartData,
                     xValueMapper: (ChartSampleData data, _) => data.x,
                    yValueMapper: (ChartSampleData data, _) => data.y,
                     width:3,                                
                     markerSettings: MarkerSettings(
                     isVisible: true,
                     height:  4,
                     width:  4,
                    shape: DataMarkerType.circle,
                    borderWidth: 3,
                     borderColor: Colors.black,
         ),
        )
        
      ]
                        )  

                    )
                ],
              )
                ]
      )
  );        
}
 List <double?> stepsvalue= [3,5,8,2,6,4,2];
   List <String> datevalue= ['Monday','Tuesday','Wednesday','Thursday','Friday','Saturday','Sunday'];
     List<ChartSampleData> _riempimento(){
      final chartData = <ChartSampleData>[];
      for (var i = 0; i < 7; i++) {
        chartData.add(ChartSampleData(x:datevalue[i], y: stepsvalue[i]));      
      }
      return chartData;
    }
       class ChartSampleData {
  ChartSampleData({this.x, this.y});
  final String? x;
  final double? y;
}
