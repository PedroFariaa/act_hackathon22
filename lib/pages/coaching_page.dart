import 'package:flutter/material.dart';
import 'package:flutter_application_1/ui/score_ring.dart';

List squat_leader = [
  {
    'image': 'assets/images/pushup.jpg',
    'user_name': 'a1',
    'score': 54,
    'time': '13\'\'23\''
  },
  {
    'image': 'assets/images/pushup.jpg',
    'user_name': 'a2',
    'score': 13,
    'time': '13:23'
  },
  {
    'image': 'assets/images/pushup.jpg',
    'user_name': 'a3',
    'score': 99,
    'time': '13:23'
  },
  {
    'image': 'assets/images/pushup.jpg',
    'user_name': 'a4',
    'score': 91,
    'time': '13:23'
  },
];

List other_leader = [
  {
    'image': 'assets/images/pushup.jpg',
    'user_name': 'b1',
    'score': 54,
    'time': '13:23'
  },
  {
    'image': 'assets/images/pushup.jpg',
    'user_name': 'b2',
    'score': 54,
    'time': '13:23'
  },
  {
    'image': 'assets/images/pushup.jpg',
    'user_name': 'b3',
    'score': 54,
    'time': '13:23'
  },
  {
    'image': 'assets/images/pushup.jpg',
    'user_name': 'b4',
    'score': 54,
    'time': '13:23'
  },
  {
    'image': 'assets/images/pushup.jpg',
    'user_name': 'b5',
    'score': 54,
    'time': '13:23'
  },
  {
    'image': 'assets/images/pushup.jpg',
    'user_name': 'b6',
    'score': 54,
    'time': '13:23'
  },
];

class CoachingPage extends StatefulWidget {
  const CoachingPage({super.key});

  @override
  _CoachingPage createState() => _CoachingPage();
}

class _CoachingPage extends State<CoachingPage> {
  // CoachingPage({super.key});

  List _leaderboard = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.topLeft,
        height: double.infinity,
        width: double.infinity,
        color: const Color.fromARGB(255, 235, 235, 235),
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(36.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Text("Sessions: "),
              Form(
                child: Container(
                  margin: const EdgeInsets.symmetric(vertical: 8.0),
                  child: DropdownButtonFormField(
                    onChanged: (newVal) {
                      other_leader
                          .sort((a, b) => b["score"].compareTo(a["score"]));
                      var new_list = other_leader;
                      if (newVal == "squat") {
                        // _leaderboard = squat_leader;
                        squat_leader
                            .sort(((a, b) => b["score"].compareTo(a["score"])));
                        new_list = squat_leader;
                      }
                      setState(() {
                        _leaderboard = new_list;
                      });
                    },
                    items: const <DropdownMenuItem>[
                      DropdownMenuItem(
                        value: "squat",
                        child: Text("squat 100x"),
                      ),
                      DropdownMenuItem(
                        value: "pushup",
                        child: Text("push up"),
                      ),
                      DropdownMenuItem(
                        value: "plank",
                        child: Text("plank"),
                      ),
                      DropdownMenuItem(
                        value: "bicep",
                        child: Text("bicep curl"),
                      ),
                      DropdownMenuItem(
                        value: "tricep",
                        child: Text("tricep extension"),
                      ),
                    ],
                  ),
                ),
              ),
              ListView.builder(
                shrinkWrap: true,
                itemCount: _leaderboard.length,
                itemBuilder: (context, position) {
                  return InkWell(
                    onTap: () {
                      return;
                    },
                    child: Container(
                      margin: const EdgeInsets.symmetric(vertical: 6.0),
                      padding: const EdgeInsets.all(5.0),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black87),
                        borderRadius: BorderRadius.circular(10),
                        color: const Color.fromARGB(255, 235, 235, 235),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Column(
                            children: [
                              Container(
                                width: 64.0,
                                height: 64.0,
                                margin: const EdgeInsets.only(right: 6.0),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                    fit: BoxFit.fill,
                                    image: AssetImage(
                                        _leaderboard[position]['image']),
                                  ),
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.only(
                                    top: 5.0, bottom: 2.0),
                                child: Text(
                                  '${_leaderboard[position]['user_name']}',
                                  selectionColor: Colors.white,
                                ),
                              ),
                            ],
                          ),
                          Container(
                              alignment: Alignment.bottomLeft,
                              child: Column(
                                children: [
                                  const Text(
                                    'Time:',
                                    textAlign: TextAlign.start,
                                  ),
                                  Text(
                                    '${_leaderboard[position]['time']}',
                                    textAlign: TextAlign.start,
                                    style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ],
                              )),
                          Stack(
                            children: [
                              Container(
                                margin: const EdgeInsets.only(
                                    top: 12.0, left: 10.0),
                                child: SizedBox(
                                  width: 30,
                                  height: 30,
                                  child: Text(
                                    '${_leaderboard[position]['score']}',
                                    textAlign: TextAlign.center,
                                    textScaleFactor: 1.6,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 50,
                                height: 50,
                                child: CustomPaint(
                                  painter: ScoreRing(
                                      score: _leaderboard[position]['score']),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
