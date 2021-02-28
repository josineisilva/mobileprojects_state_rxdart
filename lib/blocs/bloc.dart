import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'dart:math';

class MyBLoC {
  static final MyBLoC _singleton = MyBLoC._internal();
  BehaviorSubject<int> _subjectCount;
  ReplaySubject<Color> _subjectColor;
  int _count;
  Color _color;

  factory MyBLoC() => _singleton;

  MyBLoC._internal() {
    _count = 0;
    _color = UniqueColorGenerator.getColor();
    _subjectCount = BehaviorSubject<int>.seeded(this._count);
    _subjectColor = ReplaySubject<Color>();
    _subjectColor.add(_color);
  }

  Observable<int> get countObservable => _subjectCount.stream;
  Observable<Color> get colorObservable => _subjectColor.stream;
  ReplaySubject<Color> get colorSubject => _subjectColor;

  int get count => _count;
  Color get color => _color;

  void inc() {
    _count++;
    _subjectCount.sink.add(_count);
  }

  void newColor() {
    _color = UniqueColorGenerator.getColor();
    _subjectColor.sink.add(_color);
  }

  void dispose(){
    _subjectCount.close();
    _subjectColor.close();
  }
}

//
// Classe para gerar uma cor aleatoria
//
class UniqueColorGenerator {
  static Random random = Random();
  static Color getColor() {
    return Color.fromARGB(255, random.nextInt(255), random.nextInt(255), random.nextInt(255));
  }
}
