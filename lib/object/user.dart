class User {
  String name;
  bool theme;
  int completedTasks;
  int failedTasks;
  int pendingTasks;
  bool image;

  User({
    this.name = "default",
    this.theme = false,
    this.completedTasks = 0,
    this.failedTasks = 0,
    this.pendingTasks = 0,
    this.image = false,
  });
}
