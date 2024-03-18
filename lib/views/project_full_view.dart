import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:weris/Modals/participants.dart';
import 'package:weris/Modals/project_modal.dart';
import 'package:intl/intl.dart';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weris/components/participant_view.dart';
import 'package:weris/views/project_edit_view.dart';

class ProjectView extends StatefulWidget {
  const ProjectView({super.key});

  @override
  State<ProjectView> createState() => _ProjectViewState();
}

class _ProjectViewState extends State<ProjectView> {
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 1), _updateTime);
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void _updateTime(Timer timer) {
    setState(() {});
  }

  String _getTimeString() {
    var now = DateTime.now();
    var formatter = DateFormat('hh:mm a, E');
    return formatter.format(now);
  }

  Color getcolot() {
    return const Color.fromARGB(255, 69, 121, 254);
  }

  var statusData = ["on going", "completed"];

  @override
  Widget build(BuildContext context) {



    // testing data
    final List<Participant> participant = [
      Participant(
          id: "1",
          image: "lib/images/image1.jpg",
          username: "Paulo Michael",
          email: "paulprogrammer947@gmail.com",
          status: ""),
      Participant(
          id: "2",
          image: "lib/images/image2.jpg",
          username: "Jeremy Smith",
          email: "welm@gmail.com",
          status: "you"),
      Participant(
          id: "3",
          image: "lib/images/image1.jpg",
          username: "Jasmin Jaden",
          email: "abc7@gmail.com",
          status: ""),
      Participant(
          id: "4",
          image: "lib/images/image2.jpg",
          username: "Herman Smith",
          email: "welm@gmail.com",
          status: ""),
      Participant(
          id: "5",
          image: "lib/images/image1.jpg",
          username: "Rachel Jaden",
          email: "abc7@gmail.com",
          status: ""),
    ];

    final List<ProjectModal> projectdata = [
      ProjectModal(
          startDate: DateTime.now(),
          endDate: DateTime.now(),
          description:
              "There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn't anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the ubuntunet tend to repeat predefined chunks as necessary, making this the first true generator on the ubuntunet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable",
          accoplishing: "on going",
          participant: participant)
    ];




    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(56.0),
        child: AppBar(
          backgroundColor: const Color.fromARGB(255, 198, 200, 242),
          elevation: 0,
          leading: IconButton(
              onPressed: () {
                if (kDebugMode) {
                  print("pressed Back Icon");
                }
              },
              icon: const Icon(Icons.arrow_back)),
          title: Text("Full Preview",
              style: GoogleFonts.ubuntu(
                  textStyle: const TextStyle(fontWeight: FontWeight.w700))),
          actions: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(_getTimeString(),
                  style: GoogleFonts.ubuntu(
                      textStyle: const TextStyle(fontSize: 10))),
            )
          ],
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
              Color.fromARGB(255, 198, 200, 242),
              Color.fromARGB(255, 255, 255, 255)
            ])),
        child: Padding(
          padding: const EdgeInsets.only(left: 24.0, top: 30.0, right: 24.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 30,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: SizedBox(
                          height: 30,
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor:
                                      const Color.fromARGB(255, 69, 121, 254),
                                  foregroundColor: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  )),
                              onPressed: () {
                                if (kDebugMode) {
                                  print("deleted");
                                }
                              },
                              child: const Icon(
                                Icons.delete,
                                size: 16,
                              )),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: SizedBox(
                          height: 30,
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor:
                                      const Color.fromARGB(255, 0, 0, 0),
                                  foregroundColor: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  )),
                              onPressed: () {
                                if (kDebugMode) {
                                  print("to Update");
                                  Navigator.push(
                                    context, 
                                    MaterialPageRoute(builder: (context) => const ProjectEditView()));
                                }
                              },
                              child: const Icon(
                                Icons.edit,
                                size: 16,
                              )),
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 12.0),
                  child: SizedBox(
                    height: 68,
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: const Color.fromARGB(255, 25, 26, 58)),
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Expanded(
                                child: Text(
                              "PROJECT TITLE",
                              style: GoogleFonts.ubuntu(
                                  textStyle: const TextStyle(
                                      fontWeight: FontWeight.w900,
                                      color: Colors.white)),
                            )),
                            Row(
                              children: [
                                Text(
                                  "Status: ",
                                  style: GoogleFonts.ubuntu(
                                      textStyle: const TextStyle(
                                          color: Colors.white, fontSize: 12)),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: DropdownButton(
                                      value: projectdata[0].accoplishing,
                                      dropdownColor: const Color.fromARGB(
                                          255, 234, 235, 248),
                                      focusColor: Colors.white,
                                      underline: Container(),
                                      iconEnabledColor:
                                          const Color.fromARGB(255, 254, 137, 69),
                                      icon: const Icon(Icons.arrow_drop_down),
                                      iconSize: 12,
                                      items: statusData.map((String items) {
                                        return DropdownMenuItem(
                                            value: items,
                                            child: Text(items,
                                                style: GoogleFonts.ubuntu(
                                                    textStyle: const TextStyle(
                                                        fontSize: 12,
                                                        color: Color.fromARGB(255,
                                                            254, 137, 69)))));
                                      }).toList(),
                                      onChanged: (String? newValue) {
                                        setState(() {
                                          projectdata[0].accoplishing = newValue!;
                                        });
                                      }),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 12.0),
                  child: SizedBox(
                    child: Container(
                      decoration: BoxDecoration(
                          boxShadow: const [
                            BoxShadow(
                                color: Color.fromARGB(22, 0, 0, 0),
                                blurRadius: 10)
                          ],
                          borderRadius: BorderRadius.circular(10),
                          color: const Color.fromARGB(255, 255, 255, 255)),
                      child: Padding(
                        padding: const EdgeInsets.all(24),
                        child: Column(
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Expanded(
                                  child: Row(
                                    children: [
                                      Text(
                                        "Start At: ",
                                        style: GoogleFonts.ubuntu(
                                            textStyle: const TextStyle(
                                                color:
                                                    Color.fromARGB(255, 0, 0, 0),
                                                fontSize: 10)),
                                      ),
                                      Text(
                                        "13, Jan 2024",
                                        style: GoogleFonts.ubuntu(
                                            textStyle: const TextStyle(
                                                color: Color.fromARGB(
                                                    255, 96, 224, 94),
                                                fontSize: 10)),
                                      )
                                    ],
                                  ),
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "End At: ",
                                      style: GoogleFonts.ubuntu(
                                          textStyle: const TextStyle(
                                              color: Color.fromARGB(255, 0, 0, 0),
                                              fontSize: 10)),
                                    ),
                                    Text(
                                      "31, Jan 2024",
                                      style: GoogleFonts.ubuntu(
                                          textStyle: const TextStyle(
                                              color: Color.fromARGB(
                                                  255, 254, 137, 69),
                                              fontSize: 10)),
                                    )
                                  ],
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 10.0),
                              child: ConstrainedBox(
                                constraints: const BoxConstraints(
                                  minHeight: 50,
                                  maxHeight: 250
                                ),
                                child: SingleChildScrollView(
                                  child: Container(
                                    alignment: Alignment.topLeft,
                                    child: Text(projectdata[0].description as String,
                                        style: GoogleFonts.ubuntu(
                                            textStyle: const TextStyle(
                                                fontSize: 12,
                                                color: Color.fromARGB(
                                                    255, 136, 130, 130)))),
                                  ),
                                ),
                              ),
                            ),
                            Divider(
                              color: Colors.grey[200],
                            ),
                            Container(
                              alignment: Alignment.topLeft,
                              child: Text(
                                "Participants",
                                style: GoogleFonts.ubuntu(
                                    textStyle: const TextStyle(
                                        fontWeight: FontWeight.w400)),
                              ),
                            ),
                            ConstrainedBox(
                              constraints: const BoxConstraints(
                                minHeight: 20,
                                maxHeight: 180
                              ),
                              child: SingleChildScrollView(
                                child: Column(
                                  children: [
                                    for (var person in participant)
                                      ParticipantView(
                                        image: person.image,
                                        username: person.username,
                                        email: person.email,
                                        who: person.status,
                                      )
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
