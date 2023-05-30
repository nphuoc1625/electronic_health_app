import 'package:flutter/cupertino.dart';

class Observable {
  List<Observer> _observers = [];

  Observable([List<Observer>? observers]) {
    _observers = observers ?? [];
  }

  void registerObserver(Observer observer) {
    _observers.add(observer);
  }

  void removeObserver(Observer observer) {
    _observers.remove(observer);
  }

  void notifyObservers() {
    for (var observer in _observers) {
      observer.whenNotified();
    }
  }
}

class Observer {
  String observerName;
  Observer(this.observerName);

  whenNotified() {
    debugPrint('observer notified $observerName');
  }
}
