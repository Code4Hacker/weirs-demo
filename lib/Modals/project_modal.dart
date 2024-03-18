import 'package:weris/Modals/participants.dart';

class ProjectModal{
  DateTime? startDate;
  DateTime? endDate;
  String? description;
  String? accoplishing;
  List<Participant>? participant;

  ProjectModal({
    this.startDate, 
    this.endDate,
    this.description,
    this.accoplishing,
    this.participant
    });
}