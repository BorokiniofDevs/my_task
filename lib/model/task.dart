import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

enum Category { work, sport, study, cook, sleep, travel }

const uuid = Uuid();
const duration = Duration();

const categoryIcons = {
  Category.work: Icons.work,
  Category.sport: Icons.sports_football,
  Category.study: Icons.book,
  Category.cook: Icons.cookie,
  Category.sleep: Icons.bed_rounded,
  Category.travel: Icons.flight,
};

class Task {
  Task({
    required this.input,
    required this.category,
    // required this.duration,
  })  : id = uuid.v6(),
        formattedDuration =
            '${duration.inHours}h ${duration.inMinutes.remainder(60)}m ${duration.inSeconds.remainder(60)}m';

  final String id;
  final String input;
  final Category category;
  // final Duration duration;

  final String formattedDuration;
}
