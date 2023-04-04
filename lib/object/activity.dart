import 'package:flutter/material.dart';

class Activity {
  String activity;
  String type;
  int participants;
  double price;
  String link;
  String key;
  double accessibility;

  static const Map<String, Color> typeColors = {
    "education": Color(0xFF2196F3),
    "recreational": Color(0xFF4CAF50),
    "social": Color(0xFFFF5722),
    "diy": Color(0xFF673AB7),
    "charity": Color(0xFFE91E63),
    "cooking": Color(0xFF795548),
    "relaxation": Color(0xFF009688),
    "music": Color(0xFFBA68C8),
    "busywork": Color(0xFF607D8B),
  };

  static const Map<String, IconData> typeIcons = {
    "education": Icons.school,
    "recreational": Icons.beach_access,
    "social": Icons.chat_bubble_outline,
    "diy": Icons.build,
    "charity": Icons.favorite,
    "cooking": Icons.restaurant,
    "relaxation": Icons.spa,
    "music": Icons.music_note,
    "busywork": Icons.work,
  };

  static const Map<String, String> typeDescriptions = {
    "education": "Activities related to learning or gaining knowledge.",
    "recreational": "Activities done for fun or leisure.",
    "social": "Activities that involve socializing or interacting with others.",
    "diy": "Do-it-yourself activities or projects.",
    "charity": "Activities related to helping others or charitable causes.",
    "cooking": "Activities related to cooking or preparing food.",
    "relaxation": "Activities that promote relaxation or stress-relief.",
    "music": "Activities related to listening to or playing music.",
    "busywork": "Activities that are generally considered to be time-wasters."
  };

  Activity({
    required this.activity,
    required this.type,
    required this.participants,
    required this.price,
    required this.link,
    required this.key,
    required this.accessibility,
  });

  Activity.random({
    this.activity = "",
    this.type = "",
    this.participants = 0,
    this.price = 0,
    this.link = "",
    this.key = "",
    this.accessibility = 0,
  });

  factory Activity.fromJSON(dynamic json) {
    double price;
    double accessibility;
    try {
      price = (json['price'] as int).toDouble();
    } catch (e) {
      price = json['price'] as double;
    }

    try {
      accessibility = (json['accessibility'] as int).toDouble();
    } catch (e) {
      accessibility = json['accessibility'] as double;
    }

    return Activity(
      activity: json['activity'] as String,
      type: json['type'] as String,
      participants: json['participants'] as int,
      price: price,
      link: json['link'] as String,
      key: json['key'] as String,
      accessibility: accessibility,
    );
  }

  Map<dynamic, dynamic> toJSON() => {
        'activity': activity,
        'type': type,
        'participants': participants,
        'price': price,
        'link': link,
        'key': key,
        'accessibility': accessibility,
      };

  Map<String, dynamic> toMap() {
    return {
      'activity': activity,
      'type': type,
      'participants': participants,
      'price': price,
      'link': link,
      'key': key,
      'accessibility': accessibility,
    };
  }

  @override
  String toString() {
    return '"activity": $activity, "type": $type, "participants": $participants, "price": $price, "link": $link, "key": $key, "accessibility": $accessibility';
  }
}
