import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SelectOption extends StatelessWidget {
  final List<String> lists;
  final String optionUpdate;
  const SelectOption({super.key, required this.lists, required this.optionUpdate});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Container(
        decoration: BoxDecoration(
            color: const Color.fromARGB(90, 255, 255, 255),
            border: Border.all(
              color: const Color.fromARGB(255, 193, 190, 190),
              width: 1,
            ),
            borderRadius: BorderRadius.circular(12)),
        child: Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: DropdownButtonFormField(
              decoration: const InputDecoration(
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                          width: 0, color: Color.fromARGB(0, 0, 0, 0))),
                  enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                          width: 0, color: Color.fromARGB(0, 0, 0, 0))),
                  focusedErrorBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                          width: 0, color: Color.fromARGB(0, 0, 0, 0))),
                  disabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                          width: 0, color: Color.fromARGB(0, 0, 0, 0))),
                  errorBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                          width: 0, color: Color.fromARGB(0, 0, 0, 0)))),
              value: lists[0],
              dropdownColor: const Color.fromARGB(255, 25, 26, 58),
              focusColor: const Color.fromARGB(255, 25, 26, 58),
              elevation: 0,
              iconEnabledColor: const Color.fromARGB(255, 255, 255, 255),
              icon: const Icon(Icons.arrow_drop_down),
              iconSize: 15,
              items: lists.map((String items) {
                return DropdownMenuItem(
                    value: items,
                    child: Text(items,
                        style: GoogleFonts.ubuntu(
                            textStyle: const TextStyle(
                                fontSize: 15,
                                color: Color.fromARGB(255, 255, 255, 255)))));
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  // statusData[0].replaceAll(statusData[0], newValue!);
                });
              }),
        ),
      ),
    );
  }

  void setState(Null Function() param0) {}
}
