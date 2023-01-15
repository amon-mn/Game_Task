import 'package:first_project/components/difficulty.dart';
import 'package:flutter/material.dart';

class Task extends StatefulWidget {
  final String name;
  final String picture;
  final int difficultyLevel;

  Task(
      {required this.name,
      required this.picture,
      required this.difficultyLevel,
      Key? key})
      : super(key: key);

  int level = 0;
  int difficultyCounter = 0;

  @override
  State<Task> createState() => _TaskState();
}

class _TaskState extends State<Task> {


  bool assetOrNetwork() {
    if (widget.picture.contains('http')) {
      return false;
    }
    return true;
  }

  Color colorSet() {
    if (widget.difficultyCounter == 1) {
      return const Color.fromARGB(255, 19, 167, 0);
    } else if (widget.difficultyCounter == 2) {
      return const Color.fromARGB(255, 207, 149, 67);
    } else if (widget.difficultyCounter >= 3) {
      return const Color.fromARGB(255, 43, 48, 108);
    }
    return Colors.blue;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        children: [
          Column(
            children: [
              Container(
                height: 140,
                decoration: BoxDecoration(
                  color: colorSet(),
                  borderRadius: BorderRadius.circular(12.0),
                  boxShadow: [
                    BoxShadow(
                      offset: const Offset(0.0, 4.0),
                      color: Colors.black.withOpacity(.80),
                      blurRadius: 7,
                    ),
                  ],
                ),
                child: Stack(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(left: 80),
                      height: 100,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: EdgeInsets.only(
                                    left:
                                        MediaQuery.of(context).size.width / 8),
                                width: 100,
                                child: Text(
                                  widget.name,
                                  style: const TextStyle(
                                      fontSize: 20,
                                      overflow: TextOverflow.fade),
                                ),
                              ),
                              const SizedBox(height: 10),
                              Container(
                                margin: EdgeInsets.only(
                                    left:
                                        MediaQuery.of(context).size.width / 8),
                                child: Difficulty(
                                    difficultyLevel: widget.difficultyLevel),
                              ),
                            ],
                          ),
                          Container(
                            height: 60,
                            width: 60,
                            margin: EdgeInsets.only(
                                right: MediaQuery.of(context).size.width / 24),
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: colorSet(),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30))),
                              onPressed: () {
                                setState(() {
                                  widget.level++;
                                  if (((widget.level / widget.difficultyLevel) / 10) >=
                                      1) {
                                    widget.difficultyCounter++;
                                    widget.level = 0;
                                  }
                                  if (widget.difficultyCounter >= 4) {
                                    widget.level = 99;
                                  }
                                });
                              },
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: const [
                                  Icon(Icons.arrow_drop_up),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Container(
            margin: const EdgeInsets.only(top: 8, left: 10),
            height: 120,
            width: 110,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16.0),
              boxShadow: [
                BoxShadow(
                  offset: const Offset(0.0, 2.0),
                  color: Colors.black.withOpacity(.80),
                  blurRadius: 7,
                ),
              ],
            ),
            child: ClipRRect(
                borderRadius: BorderRadius.circular(16.0),
                child: assetOrNetwork()
                    ? Image.asset(
                        widget.picture,
                        fit: BoxFit.cover,
                      )
                    : Image.network(
                        widget.picture,
                        fit: BoxFit.cover,
                      )
            ),
          ),
          Positioned(
            left: MediaQuery.of(context).size.width / 3,
            bottom: 12.5,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                (widget.level < 99)
                    ? Row(children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 2.3,
                          child: LinearProgressIndicator(
                            color: Colors.white,
                            backgroundColor: Colors.white60,
                            value: (widget.difficultyLevel > 0)
                                ? ((widget.level / widget.difficultyLevel) / 10)
                                : 1.0,
                          ),
                        ),
                        SizedBox(width: MediaQuery.of(context).size.width / 18),
                        Text(
                          'Lvl: ${widget.level}',
                          style: const TextStyle(color: Colors.white),
                        ),
                      ])
                    : const Text('MAESTRIA MÁXIMA ATINGIDA!',
                        style: TextStyle(color: Colors.white, fontSize: 16)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
