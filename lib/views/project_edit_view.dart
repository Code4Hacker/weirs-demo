import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:weris/components/selection.dart';
import 'package:weris/views/project_full_view.dart';

class ProjectEditView extends StatefulWidget {
  const ProjectEditView({super.key});

  @override
  State<ProjectEditView> createState() => _ProjectEditViewState();
}

class _ProjectEditViewState extends State<ProjectEditView> {
  late Timer _timer;

  var statusData = ["Paul Michael", "Jasmin John", "John Doe"];

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

  @override
  Widget build(BuildContext context) {
    final userProfile = User(
        profile: "lib/images/image1.jpg",
        username: "Paulo Michael",
        role: "maintainer");

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
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ProjectView()));
                }
              },
              icon: const Icon(Icons.arrow_back)),
          title: Text("UPDATE",
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
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 100,
                        width: 100,
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(
                                  width: 4,
                                  color:
                                      const Color.fromARGB(255, 176, 176, 176)),
                              borderRadius: BorderRadius.circular(50.0)),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(50.0),
                            child: Image.asset(
                              userProfile.profile! == ""
                                  ? "lib/images/nophoto.png"
                                  : userProfile.profile!,
                              height: 100,
                              width: 100,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      Text(
                        userProfile.username!,
                        style: GoogleFonts.ubuntu(
                            textStyle: const TextStyle(
                                fontSize: 24, fontWeight: FontWeight.bold)),
                      ),
                      Text(
                        userProfile.role!,
                        style: GoogleFonts.ubuntu(
                            textStyle: const TextStyle(
                                fontWeight: FontWeight.normal,
                                color: Color.fromARGB(255, 109, 109, 109))),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 12),
                        child: Container(
                          alignment: Alignment.topLeft,
                          child: Text(
                            "Update Project",
                            style: GoogleFonts.ubuntu(
                                textStyle: const TextStyle(
                                    fontWeight: FontWeight.normal,
                                    // fontSize: 15,
                                    color: Color.fromARGB(255, 0, 0, 0))),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 12.0),
                        child: Container(
                          decoration: BoxDecoration(
                              color: const Color.fromARGB(90, 255, 255, 255),
                              borderRadius: BorderRadius.circular(12)),
                          child: TextFormField(
                            decoration: InputDecoration(
                                hintText: "Title",
                                hintStyle: GoogleFonts.ubuntu(
                                    textStyle: const TextStyle(fontSize: 12)),
                                // icon: const Icon(Icons.person),
                                enabledBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                      color: Color.fromARGB(255, 193, 190, 190),
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(10)),
                                errorBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                      color: Color.fromARGB(255, 193, 190, 190),
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(10)),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                      color: Color.fromARGB(255, 193, 190, 190),
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(10))),
                            minLines: 5,
                            maxLines: 10,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 12),
                        child: Container(
                          decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 25, 26, 58),
                              borderRadius: BorderRadius.circular(12)),
                          child: Padding(
                            padding: const EdgeInsets.only(
                                top: 12, bottom: 32, left: 24, right: 24),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 12),
                                  child: Container(
                                    alignment: Alignment.topLeft,
                                    child: Text(
                                      "NEW USER",
                                      style: GoogleFonts.ubuntu(
                                          textStyle: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16,
                                              color: Color.fromARGB(
                                                  255, 255, 255, 255))),
                                    ),
                                  ),
                                ),
                                SelectOption(
                                    lists: statusData, optionUpdate: "Choose"),
                                SelectOption(
                                    lists: statusData, optionUpdate: "Choose"),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(12),
                        child: FloatingActionButton.extended(
                            onPressed: () {},
                            foregroundColor: Colors.white,
                            backgroundColor: Colors.black,
                            label: Text("Update Now", style: GoogleFonts.ubuntu(
                                  textStyle: const TextStyle(
                                      fontSize: 15, fontWeight: FontWeight.w500)),),
                            ),
                      )
                    ],
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

class User {
  final String? profile;
  final String? username;
  final String? role;

  User({this.profile, this.username, this.role});
}
