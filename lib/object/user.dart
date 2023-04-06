class User {
  String name;
  bool theme;
  int acceptedTasks;
  int completedTasks;
  bool image;
  Map<String, int> categoriesTask = {
    "education": 0,
    "recreational": 0,
    "social": 0,
    "diy": 0,
    "charity": 0,
    "cooking": 0,
    "relaxation": 0,
    "music": 0,
    "busywork": 0,
  };

  static User mainUser = User();

  User({
    this.name = "default",
    this.theme = false,
    this.acceptedTasks = 0,
    this.completedTasks = 0,
    this.image = false,
  });
}
