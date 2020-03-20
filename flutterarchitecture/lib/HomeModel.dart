
// we have to seperate the business logic from ui we made HomeModel for variables and HomeStates for HomeScreenStates

import 'dart:async';

import 'package:flutterarchitecture/HomeEvents.dart';
import 'package:flutterarchitecture/HomeScreen.dart';

import 'HomeState.dart';


enum HomeViewState { Error, Busy, NoData, Retrived }

class HomeModel{




  final StreamController<HomeState> streamController = StreamController<HomeState>();



  // _ this means private variable
  List<String> items ;

  Stream<HomeState> get homeState => streamController.stream;
  
//  List<String> get items =>items;


  // we have to limit the access of the getlist data
  // we want our stat to only be change in the model
  // and only tthe model decide how to change the state
  // to achive this we will add the function call dispatch
  // ui should never be able to handle the state it should tell the model
  // ui can intereact model through events 
  // Ui should never knoe what the model is doing internally


  void dispatch(HomeEvents event){

     if(event is FetchData){

       getListData(isError: event.isError,hasData: event.hasData);
     }


  }



  Future getListData(
      {bool isError = false, bool hasData = true}) async {
//    this.streamController.add(HomeViewState.Busy);
    streamController.add(BusyHomeState());
    await Future.delayed(Duration(seconds: 3));

    
    if (isError) {
      var error = "An error Occured while fetching the data";
      return streamController.addError(error);
    }

    if (!hasData) {
      var noData = "No data Found";
      return streamController.add(DataFetchedHomeState(items: List<String>()));
    }

//    if (isError) {
//      var error =  "An error Occured while fetching the data";
//      return [error];
//    }
//    if (!hasData) {
//
//
//
//      var noData =  "No data Found";
//      return [noData];
//    }

    items = List<String>.generate(10, (index) => "$index title");
    streamController.add(DataFetchedHomeState());


  }



}



