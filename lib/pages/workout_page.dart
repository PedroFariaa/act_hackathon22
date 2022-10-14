import 'package:flutter/material.dart';
import 'package:flutter_application_1/camera/camera_view.dart';

List workouts = [
  {
    'title': 'squat',
    'image': 'assets/images/squat.jpg',
    'series': 3,
    'repetitions': 12,
    'selected': true,
  },
  {
    'title': 'push up',
    'image': 'assets/images/pushup.jpg',
    'series': 2,
    'repetitions': 10,
    'selected': false,
  },
];

class WorkOutPage extends StatefulWidget {
  const WorkOutPage({super.key});

  @override
  _WorkOutPage createState() => _WorkOutPage();
}

class _WorkOutPage extends State<WorkOutPage> {
  void _toggleSelection(int position) {
    setState(() {
      workouts[position]['selected'] = !workouts[position]['selected'];
      debugPrint(workouts.toString());
    });
  }

  void addToWorkouts() {
    print("addnew");
    workouts.add({
      'title': 'bicep curl',
      'image': 'assets/images/bicep.jpg',
      'series': 2,
      'repetitions': 12,
      'selected': false,
    });
    setState(() {});
    Navigator.of(context).pop();
  }

  void _showModal() {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Container(
            margin: const EdgeInsets.only(left: 24.0, right: 24.0, top: 24.0),
            alignment: Alignment.bottomLeft,
            child: Form(
              child: Column(
                children: [
                  const Text("Add new exercise to workout"),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 8.0),
                    child: DropdownButtonFormField(
                      onChanged: (newVal) {},
                      items: const <DropdownMenuItem>[
                        DropdownMenuItem(
                          value: "plank",
                          child: Text("plank"),
                        ),
                        DropdownMenuItem(
                          value: "bicep curl",
                          child: Text("bicep curl"),
                        ),
                        DropdownMenuItem(
                          value: "tricep extension",
                          child: Text("tricep extension"),
                        ),
                      ],
                      decoration: const InputDecoration(
                        labelText: 'Exercise Name',
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),
                          borderSide:
                              BorderSide(color: Colors.black, width: 2.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),
                          borderSide:
                              BorderSide(color: Colors.blue, width: 2.0),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 8.0),
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        labelText: 'Nr Series',
                        hintText: '3',
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),
                          borderSide:
                              BorderSide(color: Colors.black, width: 2.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),
                          borderSide:
                              BorderSide(color: Colors.blue, width: 2.0),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 8.0),
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        labelText: 'Nr repetitions',
                        hintText: '12',
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),
                          borderSide:
                              BorderSide(color: Colors.black, width: 2.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),
                          borderSide:
                              BorderSide(color: Colors.blue, width: 2.0),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(right: 8.0),
                          child: ElevatedButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: const Text('Cancel')),
                        ),
                        ElevatedButton(
                            onPressed: () {
                              addToWorkouts();
                            },
                            child: const Text('OK')),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        color: const Color.fromARGB(255, 235, 235, 235),
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(36.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Text("WORKOUT"),
              ListView.builder(
                shrinkWrap: true,
                itemCount: workouts.length,
                itemBuilder: (context, position) {
                  return InkWell(
                    onTap: () {
                      _toggleSelection(position);
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
                          Container(
                            width: 64.0,
                            height: 64.0,
                            margin: const EdgeInsets.only(right: 6.0),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                fit: BoxFit.fill,
                                image: AssetImage(workouts[position]['image']),
                              ),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.all(6.0),
                            child: Text(
                              '${workouts[position]['title']}',
                              selectionColor: Colors.white,
                            ),
                          ),
                          Container(
                            alignment: Alignment.bottomLeft,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  'series: ${workouts[position]['series']}',
                                  textAlign: TextAlign.start,
                                ),
                                Text(
                                  'repetitions: ${workouts[position]['repetitions']}',
                                  textAlign: TextAlign.start,
                                ),
                              ],
                            ),
                          ),
                          Container(
                              child: workouts[position]['selected']
                                  ? const Icon(Icons.check)
                                  : const Icon(Icons.crop_square_sharp)),
                        ],
                      ),
                    ),
                  );
                },
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (BuildContext context) {
                        return const CameraView();
                      },
                    ),
                  );
                },
                child: const Text("Start Workout"),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showModal();
          /* 
          Scaffold.of(context).showBottomSheet<void>((BuildContext context) {
            return Container(
              height: 20,
              color: Colors.amber,
              child: Center(
                child: Column(
                  children: [
                    Row(
                      children: [
                        ElevatedButton(
                            onPressed: () {}, child: const Text('Cancel')),
                        ElevatedButton(
                            onPressed: () {},
                            child: const Text('Add Exercise !')),
                      ],
                    ),
                  ],
                ),
              ),
            );
          }); */
          /* Scaffold.of(context).showModalBottomSheet<void>(
              context: context,
              backgroundColor: Colors.white,
              elevation: 10,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)),
              builder: (BuildContext context) {
                return SizedBox(
                  height: 500,
                  child: Center(
                    child: Form(
                      child: Column(
                        children: [
                          TextFormField(
                            keyboardType: TextInputType.text,
                            decoration: const InputDecoration(
                              labelText: 'Exercise Name',
                              hintText: 'plank',
                              enabledBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20.0)),
                                borderSide:
                                    BorderSide(color: Colors.black, width: 2.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20.0)),
                                borderSide:
                                    BorderSide(color: Colors.blue, width: 2.0),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                );
              }); */
        },
        backgroundColor: Colors.blue,
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}
