class User {
  int key;
  String name;
  int completed;
  int accepted;
  int education;
  int recreational;
  int social;
  int diy;
  int charity;
  int cooking;
  int relaxation;
  int music;
  int busywork;

  static User mainUser = User();
  static int adtask = 0;

  User({
    this.key = 1,
    this.name = "default",
    this.completed = 0,
    this.accepted = 0,
    this.education = 0,
    this.recreational = 0,
    this.social = 0,
    this.diy = 0,
    this.charity = 0,
    this.cooking = 0,
    this.relaxation = 0,
    this.music = 0,
    this.busywork = 0,
  });

  void saveType(String type) {
    switch (type) {
      case 'education':
        mainUser.education += 1;
        break;
      case 'recreational':
        mainUser.recreational += 1;
        break;
      case 'social':
        mainUser.social += 1;
        break;
      case 'diy':
        mainUser.diy += 1;
        break;
      case 'charity':
        mainUser.charity += 1;
        break;
      case 'cooking':
        mainUser.cooking += 1;
        break;
      case 'relaxation':
        mainUser.relaxation += 1;
        break;
      case 'music':
        mainUser.music += 1;
        break;
      case 'busywork':
        mainUser.busywork += 1;
        break;
      default:
    }
  }

  void saveToDataBase() {}

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'completed': completed,
      'accepted': accepted,
      'education': education,
      'recreational': recreational,
      'social': social,
      'diy': diy,
      'charity': charity,
      'cooking': cooking,
      'relaxation': relaxation,
      'music': music,
      'busywork': busywork,
    };
  }

  @override
  String toString() {
    return 'User{key: $key, name: $name, completed: $completed, accepted: $accepted, education: $education, recreational: $recreational, social: $social, diy: $diy, charity: $charity, cooking: $cooking, relaxation: $relaxation, music: $music, busywork: $busywork}';
  }
}
