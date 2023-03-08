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
    "music": Color(0xFFE91E63),
    "busywork": Color(0xFF607D8B),
  };

  Activity(
    this.activity,
    this.type,
    this.participants,
    this.price,
    this.link,
    this.key,
    this.accessibility,
  );

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
      json['activity'] as String,
      json['type'] as String,
      json['participants'] as int,
      price,
      json['link'] as String,
      json['key'] as String,
      accessibility,
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

  @override
  String toString() {
    return '"activity": $activity, "type": $type, "participants": $participants, "price": $price, "link": $link, "key": $key, "accessibility": $accessibility';
  }
}
