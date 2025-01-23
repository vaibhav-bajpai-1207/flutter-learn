import 'dart:async';

import 'package:flutter/material.dart';
import 'package:timer_app_new/services/service_locator.dart';
import 'package:timer_app_new/services/storage_service/storage_service.dart';
// import 'package:flutter/scheduler.dart';

class TimeLeftNotifier extends ValueNotifier<String> {
  TimeLeftNotifier() : super(_durationString(_initialValue));
  static final _initialValue = 10;
  int _currentTimeLeft = _initialValue;

  static String _durationString(int duration) {
    var seconds = (duration % 60).toString().padLeft(2, '0');
    var minutes = ((duration / 60).floor() % 60).toString().padLeft(2, '0');

    return '$minutes:$seconds';
  }

  final _ticker = Ticker();
  StreamSubscription<int>? _tickerSubscription;

  final _storageService = getIt<StorageService>();

  Future<void> initialize() async {
    final savedTime = await _storageService.getTimeLeft() ?? _initialValue;
    _updateTimeLeft(savedTime);
  }

  void _updateTimeLeft(int seconds) {
    value = _durationString(seconds);
    _currentTimeLeft = seconds;
  }

  void start({required Function onDone}) {
    _tickerSubscription?.cancel();
    _updateTimeLeft(_currentTimeLeft);
    _tickerSubscription =
        _ticker.tick(ticks: _currentTimeLeft).listen((duration) {
      _updateTimeLeft(duration);
    });

    _tickerSubscription!.onDone(() {
      _storageService.saveTimeLeft(_initialValue);
      onDone();
    });
  }

  void pause() {
    _tickerSubscription?.pause();
    _storageService.saveTimeLeft(_currentTimeLeft);
  }

  void reset() {
    _tickerSubscription?.cancel();
    _updateTimeLeft(_initialValue);
  }

  void resume() {
    _tickerSubscription?.resume();
  }

  @override
  void dispose() {
    _tickerSubscription?.cancel();
    _storageService.saveTimeLeft(_currentTimeLeft);
    super.dispose();
  }
}

class Ticker {
  Stream<int> tick({required int ticks}) {
    return Stream.periodic(
      const Duration(seconds: 1),
      (x) => ticks - x - 1,
    ).take(ticks);
  }
}
