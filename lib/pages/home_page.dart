

import 'package:fitness_app_ui/data/latest_workout.dart';
import 'package:fitness_app_ui/theme/colors.dart';
import 'package:fitness_app_ui/widget/chart_activity_status.dart';
import 'package:fitness_app_ui/widget/chart_sleep.dart';
import 'package:fitness_app_ui/widget/chart_workout_progress.dart';
import 'package:fitness_app_ui/widget/water_intake_progressbar.dart';
import 'package:fitness_app_ui/widget/water_intake_timeline.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: getBody(),
    );
  }

  Widget getBody() {
    var size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "Welcome Back",
                          style: TextStyle(fontSize: 14, color: black),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "Sopheamen",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: black),
                        ),
                      ],
                    ),
                    Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                          color: black.withOpacity(0.03),
                          borderRadius: BorderRadius.circular(12)),
                      child: const Center(
                        child: Icon(LineIcons.bell),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                Container(
                  width: double.infinity,
                  height: 145,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    gradient: const LinearGradient(colors: [secondary, primary]),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Row(
                      children: [
                        Flexible(
                          child: SizedBox(
                            width: (size.width),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  "BMI (Body Mass Index)",
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: white),
                                ),
                                const Text(
                                  "You have a normal weight",
                                  style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w400,
                                      color: white),
                                ),
                                Container(
                                  width: 95,
                                  height: 35,
                                  decoration: BoxDecoration(
                                      gradient: const LinearGradient(
                                          colors: [fourthColor, thirdColor]),
                                      borderRadius: BorderRadius.circular(20)),
                                  child: const Center(
                                    child: Text(
                                      "View More",
                                      style:
                                          TextStyle(fontSize: 13, color: white),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Container(
                          width: 100,
                          height: 100,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            gradient:
                                LinearGradient(colors: [fourthColor, thirdColor]),
                          ),
                          child: const Center(
                            child: Text(
                              "20,3",
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: white),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Container(
                  width: double.infinity,
                  height: 60,
                  decoration: BoxDecoration(
                      color: secondary.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(20)),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Today Target",
                          style: TextStyle(
                              fontSize: 17,
                              color: black,
                              fontWeight: FontWeight.w600),
                        ),
                        InkWell(
                          onTap: (){
                            Navigator.pushNamed(context, "/today_target_detail");
                          },
                          child: Container(
                            width: 70,
                            height: 35,
                            decoration: BoxDecoration(
                                gradient:
                                    const LinearGradient(colors: [secondary, primary]),
                                borderRadius: BorderRadius.circular(20)),
                            child: const Center(
                              child: Text(
                                "Check",
                                style: TextStyle(fontSize: 13, color: white),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                const Text(
                  "Activity Status",
                  style: TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold, color: black),
                ),
                const SizedBox(
                  height: 15,
                ),
                Container(
                  width: double.infinity,
                  height: 150,
                  decoration: BoxDecoration(
                      color: secondary.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(30)),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: Stack(
                      children: [
                        SizedBox(
                          width: double.infinity,
                          child: LineChart(activityData()),
                        ),
                        const Padding(
                          padding: EdgeInsets.all(20),
                          child: Text(
                            "Heart Rate",
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  children: [
                    Container(
                      width: (size.width - 80) / 2,
                      height: 320,
                      decoration: BoxDecoration(
                          color: white,
                          boxShadow: [
                            BoxShadow(
                                color: black.withOpacity(0.01),
                                spreadRadius: 20,
                                blurRadius: 10,
                                offset: const Offset(0, 10))
                          ],
                          borderRadius: BorderRadius.circular(30)),
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Row(
                          children: [
                            const WateIntakeProgressBar(),
                            const SizedBox(
                              width: 15,
                            ),
                            Flexible(
                              child: Column(
                                children: [
                                  const Text(
                                    "Water Intake",
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const Spacer(),
                                  Column(
                                    children: [
                                      Text(
                                        "Real time updates",
                                        style: TextStyle(
                                            fontSize: 13,
                                            color: black.withOpacity(0.5)),
                                      ),
                                      const SizedBox(
                                        height: 15,
                                      ),
                                      const WaterIntakeTimeLine()
                                    ],
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Column(
                      children: [
                        Container(
                          width: (size.width - 80) / 2,
                          height: 150,
                          decoration: BoxDecoration(
                              color: white,
                              boxShadow: [
                                BoxShadow(
                                    color: black.withOpacity(0.01),
                                    spreadRadius: 20,
                                    blurRadius: 10,
                                    offset: const Offset(0, 10))
                              ],
                              borderRadius: BorderRadius.circular(30)),
                          child: Padding(
                            padding: const EdgeInsets.all(20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "Sleep",
                                  style: TextStyle(
                                      fontSize: 15, fontWeight: FontWeight.bold),
                                ),
                                const Spacer(),
                                Flexible(
                                  child: LineChart(sleepData()),
                                )
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                            width: (size.width - 80) / 2,
                            height: 150,
                            decoration: BoxDecoration(
                                color: white,
                                boxShadow: [
                                  BoxShadow(
                                      color: black.withOpacity(0.01),
                                      spreadRadius: 20,
                                      blurRadius: 10,
                                      offset: const Offset(0, 10))
                                ],
                                borderRadius: BorderRadius.circular(30)),
                            child: Padding(
                              padding: const EdgeInsets.all(20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "Calories",
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const Spacer(),
                                  Container(
                                    width: 70,
                                    height: 70,
                                    decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                            begin: Alignment.topCenter,
                                            colors: [
                                              fourthColor,
                                              primary.withOpacity(0.5)
                                            ]),
                                        shape: BoxShape.circle),
                                    child: Center(
                                        child: Container(
                                      width: 50,
                                      height: 50,
                                      decoration: const BoxDecoration(
                                          shape: BoxShape.circle, color: primary),
                                      child: const Center(
                                        child: Text(
                                          "230 Cal",
                                          style: TextStyle(
                                              fontSize: 10, color: white),
                                        ),
                                      ),
                                    )),
                                  )
                                ],
                              ),
                            ))
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Workout Progress",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: black),
                    ),
                    Container(
                      width: 95,
                      height: 35,
                      decoration: BoxDecoration(
                          gradient: const LinearGradient(colors: [secondary, primary]),
                          borderRadius: BorderRadius.circular(20)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text(
                            "Weekly",
                            style: TextStyle(fontSize: 13, color: white),
                          ),
                          Icon(
                            Icons.keyboard_arrow_down,
                            color: white,
                          )
                        ],
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  width: size.width,
                  height: 220,
                  decoration: BoxDecoration(
                      color: white,
                      boxShadow: [
                        BoxShadow(
                            color: black.withOpacity(0.01),
                            spreadRadius: 20,
                            blurRadius: 10,
                            offset: const Offset(0, 10))
                      ],
                      borderRadius: BorderRadius.circular(30)),
                  child: LineChart(
                    workoutProgressData(),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                 Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Latest Workout",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: black),
                    ),
                     Text(
                            "See more",
                            style: TextStyle(fontSize: 15, color: black.withOpacity(0.5)),
                          ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Column(
                  children: List.generate(latestWorkoutJson.length, (index) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: white,
                      boxShadow: [
                        BoxShadow(
                          color: black.withOpacity(0.01),
                          spreadRadius: 20,
                          blurRadius: 10,
                          offset:const Offset(0, 10)
                        )
                      ],
                      borderRadius: BorderRadius.circular(12)
                  ),
                  child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Row(
                        children: [
                          Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                              image: DecorationImage(image: AssetImage(latestWorkoutJson[index]['img']))
                            ),
                          ),
                          const SizedBox(width: 15,),
                          Flexible(
                            child: SizedBox(
                              height: 55,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(latestWorkoutJson[index]['title'],style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight:FontWeight.bold
                                  ),),
                                  Text(latestWorkoutJson[index]['description'],style: TextStyle(
                                    fontSize: 13,
                                    color: black.withOpacity(0.5)
                                  ),),
                                  Stack(
                                    children:[
                                      Container(
                                        width: size.width,
                                        height: 10,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(30),
                                          color: bgTextField
                                        ),
                                      ),
                                      Container(
                                        width: size.width*(latestWorkoutJson[index]['progressBar']),
                                        height: 10,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(30),
                                          gradient: const LinearGradient(colors: [
                                            primary, secondary
                                          ])
                                        ),
                                      )
                                    ]
                                  )
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(width: 15,),
                          Container(
                            width: 20,
                            height: 20,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: primary
                              )
                            ),
                            child: const Center(
                              child: Icon(Icons.arrow_forward_ios,size:11,color:primary),
                            ),
                          ),

                        ],
                      ),
                  ),
                ),
                    );
                  }),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
