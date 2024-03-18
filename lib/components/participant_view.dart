import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ParticipantView extends StatelessWidget {
  final String? image;
  final String? username;
  final String? email;
  final String? who;
  const ParticipantView({
    super.key, 
    this.image,
    this.username,
    this.email, 
    this.who
  });



  @override
  Widget build(BuildContext context) {
    return Card(
      surfaceTintColor: Colors.white,
      elevation: 9,
      shadowColor: const Color.fromARGB(139, 0, 0, 0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(14),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Container(
                decoration: BoxDecoration(
                    border: Border.all(
                        width: 2,
                        color: const Color.fromARGB(255, 176, 176, 176)),
                    borderRadius: BorderRadius.circular(50)),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(50.0),
                  child: Image.asset(
                    image!,
                    width: 40,
                    height: 40,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(username!,
                              style: GoogleFonts.ubuntu(
                                  textStyle: const TextStyle(
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black))),
                          Padding(
                            padding: const EdgeInsets.only(left: 2, bottom: 2),
                            child: Text(who! =="" ? "": "(${who!})",
                                style: GoogleFonts.ubuntu(
                                    textStyle: const TextStyle(
                                        fontWeight: FontWeight.w200,
                                        color: Colors.grey,
                                        fontSize: 12,
                                        fontStyle: FontStyle.italic))),
                          )
                        ],
                      ),
                      Text(email!,
                          style: GoogleFonts.ubuntu(
                              textStyle: const TextStyle(
                                  fontWeight: FontWeight.w200,
                                  fontSize: 10,
                                  color: Colors.grey)))
                    ],
                  ),
                ),
              ),
              Container(
                height: 35,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.black),
                child: FloatingActionButton(
                    onPressed: () {},
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.black,
                    child: Text(
                      "Remove",
                      style: GoogleFonts.ubuntu(
                          textStyle: const TextStyle(
                              fontSize: 10, fontWeight: FontWeight.w500)),
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
