import 'package:flutter/material.dart';

List wks = [
  {
    "exercise": "plank",
    "time": "time",
    "repetitions": "3x 12",
    "score": 26.0,
    "video": ""
  },
];

class SessionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
          height: double.infinity,
          color: const Color.fromARGB(255, 235, 235, 235),
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(36.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Session X PAGE"),
                ListView.builder(
                    shrinkWrap: true,
                    itemCount: wks.length,
                    itemBuilder: (context, position) {
                      return const Text("aaaa");
                    })
              ],
            ),
          )),
    );
  }
}
