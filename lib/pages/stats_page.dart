import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/session_page.dart';
import 'package:flutter_application_1/ui/score_ring.dart';

List sessionsL = [
  {"date": "14-10-2022", "duration": "0:12:36", "score": 87},
  {"date": "13-10-2022", "duration": "0:57:21", "score": 67},
  {"date": "13-10-2022", "duration": "1:03:49", "score": 31},
];

class StatsPage extends StatelessWidget {
  const StatsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.topLeft,
        width: double.infinity,
        height: double.infinity,
        color: const Color.fromARGB(255, 235, 235, 235),
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(36.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Text("Sessions: "),
              ListView.builder(
                shrinkWrap: true,
                itemCount: sessionsL.length,
                itemBuilder: (context, position) {
                  return InkWell(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (BuildContext context) {
                            return SessionPage();
                          },
                        ),
                      );
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
                        verticalDirection: VerticalDirection.up,
                        children: [
                          Text('Session ${sessionsL.length - position}: '),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('${sessionsL[position]['date']}'),
                              Text('${sessionsL[position]['duration']}'),
                            ],
                          ),
                          Container(
                            margin:
                                const EdgeInsets.only(top: 5.0, bottom: 4.0),
                            child: Stack(
                              children: [
                                Container(
                                  margin: const EdgeInsets.only(
                                      top: 12.0, left: 10.0),
                                  child: SizedBox(
                                    width: 30,
                                    height: 30,
                                    child: Text(
                                      '${sessionsL[position]['score']}',
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
                                        score: sessionsL[position]['score']),
                                  ),
                                )
                              ],
                            ),
                          ),

                          /* AspectRatio(
                            // Use 1.0 to ensure that the custom painter
                            // will draw inside a container with width == height
                            aspectRatio: 1.0,

                            child: CustomPaint(
                              painter: ScoreRing(
                                  score: sessionsL[position]['score']),
                            ),
                          ), */
                        ],
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
