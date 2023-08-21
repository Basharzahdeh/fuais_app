import 'dart:math';

import 'package:flutter/material.dart';
import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class DailyTasksScreen extends StatefulWidget {
  const DailyTasksScreen({super.key});

  @override
  State<DailyTasksScreen> createState() => _DailyTasksScreenState();
}

class _DailyTasksScreenState extends State<DailyTasksScreen> {
  late DateTime _selectedDate;
  bool _Select = true;
  List imgList = [
    Image.asset('assets/images/S1.jpeg'),
    Image.asset('assets/images/S2.jpeg'),
    Image.asset('assets/images/S3.png'),
  ];

  void AddRandomImage() {
    // random image select in range 0-3
    var RandImgIndex = new Random().nextInt(3);

    // if index =0 pick image that is on 0 index
    if (RandImgIndex == 0) {
      imgList.add(Image.asset('Images/S1.png'));
    }
    // if index =1 pick image at index 1
    else if (RandImgIndex == 1) {
      imgList.add(Image.asset('Images/S2.png'));
    }
    // pick image at 3 index
    else {
      imgList.add(Image.asset('Images/S3.png'));
    }
  }

  @override
  void initState() {
    super.initState();
    _resetSelectedDate();
  }

  void _resetSelectedDate() {
    _selectedDate = DateTime.now();
  }

  Future<DateTime> getDateOneMonthAgo() async {
    final now = DateTime.now();
    final oneMonthAgo = now.subtract(Duration(days: 30));

    return oneMonthAgo;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(16),
              child: Text(
                'المهمات اليومية',
                textAlign: TextAlign.center,
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(color: Colors.black),
              ),
            ),
            FutureBuilder(
              future: getDateOneMonthAgo(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return CalendarTimeline(
                    initialDate: _selectedDate,
                    firstDate: snapshot.data!,
                    lastDate: DateTime.now().add(const Duration(days: 365 * 4)),
                    onDateSelected: (date) =>
                        setState(() => _selectedDate = date),
                    leftMargin: 5,
                    monthColor: Colors.black,
                    dayColor: Colors.black,
                    //dayNameColor: const Color(0xFF333A47),
                    activeDayColor: Colors.white,
                    activeBackgroundDayColor: Colors.grey,
                    //dotsColor: const Color(0xFF333A47),
                    //selectableDayPredicate: (date) => date.day != 23,
                    locale: 'en',
                  );
                } else if (snapshot.hasError) {
                  return Text('this is ---------- ${snapshot.error}');
                } else {
                  return CircularProgressIndicator();
                }
              },
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(left: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                          _Select ? Colors.blue : Colors.grey),
                    ),
                    child: const Text(
                      'الوصف',
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () => setState(() {
                      _Select = true;
                    }),
                  ),
                  ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                          _Select ? Colors.grey : Colors.blue),
                    ),
                    child: const Text(
                      'الصور والفيديوهات',
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () => setState(() {
                      _Select = false;
                    }),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                height: 200,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    for (var item in imgList)
                      Center(
                        child: Container(width: 500, height: 350, child: item),
                      ),
                  ],
                ),
              ),
            ),
            Container(
              height: 250,
              child: Padding(
                padding: EdgeInsets.all(20),
                child: ListView(
                  children: [
                    Container(
                      height: 60,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.grey[200]),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            'المرفق 1',
                            style: TextStyle(fontSize: 20, color: Colors.blue),
                          ),
                          Icon(
                            Icons.download,
                            size: 40,
                            color: Colors.blue,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10),
                    Container(
                      height: 60,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.grey[200]),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            'المرفق 1',
                            style: TextStyle(fontSize: 20, color: Colors.blue),
                          ),
                          Icon(
                            Icons.download,
                            size: 40,
                            color: Colors.blue,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10),
                    Container(
                      height: 60,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.grey[200]),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            'المرفق 1',
                            style: TextStyle(fontSize: 20, color: Colors.blue),
                          ),
                          Icon(
                            Icons.download,
                            size: 40,
                            color: Colors.blue,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
