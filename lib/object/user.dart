class User {
  String name;
  bool theme;
  int acceptedTasks;
  int completedTasks;
  bool image;

  static List<User> user = [];

  User({
    this.name = "default",
    this.theme = false,
    this.acceptedTasks = 10,
    this.completedTasks = 3,
    this.image = false,
  });
}
