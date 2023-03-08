class Activity {
  String activity;
  String type;
  int participants;
  int price;
  String link;
  String key;
  double accessibility;

  static const List<String> typeActivity = [
    "education",
    "recreational",
    "social",
    "diy",
    "charity",
    "cooking",
    "relaxation",
    "music",
    "busywork"
  ];

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
    return Activity(
      json['activity'] as String,
      json['type'] as String,
      json['participants'] as int,
      json['price'] as int,
      json['link'] as String,
      json['key'] as String,
      json['accessibility'] as double,
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
