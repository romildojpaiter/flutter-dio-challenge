import 'dart:math';

import 'package:flutter/material.dart';

class Task {
  final String id = UniqueKey().toString();
  String description = "";
  bool done = false;
  Task({
    required this.description,
    this.done = false,
  });

  @override
  String toString() => "id: $id, decription: $description, done: $done";
}

class TasksRepository extends ChangeNotifier {
  final _tasks = <Task>[];
  bool _loading = false;
  bool _onlyNotCompleted = false;

  get tasks => _onlyNotCompleted ? _tasks.where((element) => element.done == !_onlyNotCompleted).toList() : _tasks;

  bool get loading {
    return _loading;
  }

  bool get onlyNotCompleted => _onlyNotCompleted;
  set onlyNotCompleted(bool value) {
    _onlyNotCompleted = value;
    _loadingComponent();
  }

  add(Task task) {
    _tasks.add(task);
    _loadingComponent();
  }

  remove(String id) {
    _tasks.remove(_tasks.where((element) => element.id == id).first);
    _loadingComponent();
  }

  update(Task task) {
    _tasks.where((element) => element.id == task.id).first.done = task.done;
    _loadingComponent();
  }

  _loadingComponent() {
    _loading = true;
    notifyListeners();
    Future.delayed(const Duration(milliseconds: 300), () {
      _loading = false;
      notifyListeners();
    });
  }
}
