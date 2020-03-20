import 'package:flutter/widgets.dart';
class HomeState {}

class InitiallizedHomeState extends HomeState{}

class DataFetchedHomeState extends HomeState{


  // this state returns the data

  List<String> items ;

  DataFetchedHomeState({this.items});

  bool get hasData => items.length>0; 

}

class ErrorHomeState extends HomeState{

}

class BusyHomeState extends HomeState{}


