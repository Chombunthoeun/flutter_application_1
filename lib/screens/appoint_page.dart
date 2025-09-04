import 'package:flutter/material.dart';
import 'package:flutter_application_1/utils/config.dart';

class ApppointmentPage extends StatefulWidget {
  const ApppointmentPage({super.key});

  @override
  State<ApppointmentPage> createState() => _ApppointmentPageState();
}

// enum for appoinment status
enum FillterStatus { upcoming, complete, cancel }

class _ApppointmentPageState extends State<ApppointmentPage> {
  FillterStatus status = FillterStatus.upcoming;
  Alignment _alignment = Alignment.centerLeft;
  List<dynamic> Schedules = [
    {
      "doctor_name": "BunThoeun",
      "doctor_profile": "assets/doctor2.jpg",
      "category": "Dental",
      "status": FillterStatus.upcoming,
    },
    {
      "doctor_name": "Max Lin",
      "doctor_profile": "assets/doctor3.jpg",
      "category": "Cardiology",
      "status": FillterStatus.complete,
    },
    {
      "doctor_name": "Jane Wong",
      "doctor_profile": "assets/doctor4.jpg",
      "category": "Respiration",
      "status": FillterStatus.complete,
    },
    {
      "doctor_name": "Jenny Song",
      "doctor_profile": "assets/doctor5.jpg",
      "category": "General",
      "status": FillterStatus.cancel,
    },
  ];
  @override
  Widget build(BuildContext context) {
    List<dynamic> filteredSchedules = Schedules.where((var schedule) {
      // switch (schedule['status']) {
      //   case 'upcoming':
      //     schedule['status'] = FillterStatus.upcoming;
      //     break;
      //   case 'completed':
      //     schedule['status'] = FillterStatus.complete;
      //     break;
      //   case 'cancel':
      //     schedule['status'] = FillterStatus.cancel;
      //     break;
      // }
      return schedule['status'] == status;
    }).toList();
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(left: 20, top: 20, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            const Text(
              'Appointment Schedule',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Config.spaceSmall,
            Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      for (FillterStatus fillterStatus in FillterStatus.values)
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                if (fillterStatus == FillterStatus.upcoming) {
                                  status = FillterStatus.upcoming;
                                  _alignment = Alignment.centerLeft;
                                } else if (fillterStatus ==
                                    FillterStatus.complete) {
                                  status = FillterStatus.complete;
                                  _alignment = Alignment.center;
                                } else if (fillterStatus ==
                                    FillterStatus.cancel) {
                                  status = FillterStatus.cancel;
                                  _alignment = Alignment.centerRight;
                                }
                              });
                            },
                            child: Center(child: Text(fillterStatus.name)),
                          ),
                        ),
                    ],
                  ),
                ),
                AnimatedAlign(
                  alignment: _alignment,
                  duration: const Duration(microseconds: 200),
                  child: Container(
                    width: 100,
                    height: 40,
                    decoration: BoxDecoration(
                      color: Config.primaryColor,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Center(
                      child: Text(
                        status.name,
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Config.spaceSmall,
            Expanded(
              child: ListView.builder(
                itemCount: filteredSchedules.length,
                itemBuilder: ((context, index) {
                  var _schedule = filteredSchedules[index];
                  bool isLastElement = filteredSchedules.length + 1 == index;

                  return Card(
                    shape: RoundedRectangleBorder(
                      side: const BorderSide(color: Colors.grey),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    margin: !isLastElement
                        ? const EdgeInsets.only(bottom: 20)
                        : EdgeInsets.zero,
                    child: Padding(
                      padding: const EdgeInsets.all(15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Row(
                            children: [
                              CircleAvatar(
                                backgroundImage: AssetImage(
                                  _schedule['doctor_profile'],
                                ),
                              ),
                              const SizedBox(width: 10,),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    _schedule['doctor_name'],
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  const SizedBox(height: 5),
                                  Text(
                                    _schedule['category'],
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(height: 5),
                          const ScheduleCard(),
                          const SizedBox(height: 5),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Expanded(child: OutlinedButton(
                                onPressed: (){},
                               child: const Text(
                                'Canel',
                                style: TextStyle(
                                  color: Config.primaryColor
                                ),
                               )
                               )
                               ),
                               const SizedBox(width: 20,),
                               Expanded(child: OutlinedButton(
                                style: OutlinedButton.styleFrom(
                                  backgroundColor: Config.primaryColor
                                ),
                                onPressed: (){},
                               child: const Text(
                                'Reschedule',
                                style: TextStyle(
                                  color: Colors.white
                                ),
                               )
                               )
                               ),
                            ],
                          )
                        ],
                      ),
                    ),
                  );
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ScheduleCard 
class ScheduleCard extends StatelessWidget {
  const ScheduleCard({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(10)
      ),
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const <Widget>[
           Icon(Icons.calendar_today,
          color: Config.primaryColor,
          size: 15,
          ),
           SizedBox(width: 5,),
          Text(
            'Tuesday, 30/9/2025',
            style: TextStyle(
              color: Config.primaryColor
            ),
          ),
           SizedBox(width: 20,),
           Icon(Icons.access_alarm,
          color: Config.primaryColor,
          size: 17,
          ),
           SizedBox(width: 5,),
          Flexible(child: Text('9:00 AM', style: TextStyle(color: Config.primaryColor),))
        ],
      ),
      
    );
  }
}
