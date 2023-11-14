import 'package:flutter/material.dart';

@immutable
abstract class InternetState {}

class InternetLoading extends InternetState {}

class InternetConnected extends InternetState {}

class InternetNotAccessible extends InternetState {}

class InternetDisconneted extends InternetState {}
