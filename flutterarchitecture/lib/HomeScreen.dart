import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterarchitecture/HomeEvents.dart';
import 'package:flutterarchitecture/HomeModel.dart';
import 'package:flutterarchitecture/HomeState.dart';

// this example is also usfeul for getting data from webservices
// we have 4 events  error,no data,running,data retrived



class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {


  final model = HomeModel();


  @override
  void initState() {
    // TODO: implement initState

    // no direct communication view to mdeol
    //model.getListData();

    // should communicate with Events

    model.dispatch(FetchData());

//    getListData();

    ////    getListData(isError: false,hasData: false)
////        .then((data) => setState(() {
////
////          if(data.length == 0){
////            data.add("no data found");
////          }
////
////              pageData = data;
////            }))
////        .catchError((error) => setState(() {
////
////          pageData = [error] ;
////
////    }));
////        .catchError((error) => handleError(error));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // future builder not updating the state
      floatingActionButton: FloatingActionButton(

        child: Icon(
            Icons.refresh
        ),
        onPressed: (){


          // in future builder after clicking the floating action button can not reload
          // we have to use stream builder for reload

          model.dispatch(FetchData(hasData: true,isError: true));
        },


      ),

      body: StreamBuilder(
//          future: getListData(isError: false, hasData  false), previously used FutureBuilder

//          future: getListData(isError: true),
      stream: model.homeState,
          builder: (buildContext, snapshot) {


//
//            if(snapshot.error){
//              return  Center(child: Text("An error Occured while fetching the data"));
//            }
//            if(snapshot.error){
//
//              return Center(child: Text("An error Occurred while fething the data"));
//
//            }

          var hometate = snapshot.data;

            if (snapshot.hasError) {
              return getErrorInformation(snapshot.error);
            }

            if (!snapshot.hasData || hometate is BusyHomeState) {
              return Center(child: CircularProgressIndicator());
            }



            return ListView.builder(
              itemCount: model.items.length,
              itemBuilder: (buildContext, index) => getListItemUi(index, model.items),
            );
          }

//        child:
          ),
    );
  }



  Widget getNodataInformation() {
    var noData = "No data Found";
    return Center(
      child: Text(noData),
    );
  }

  Widget getErrorInformation(String message) {
//    var error =  "An error Occured while fetching the data";
    return Center(
      child: Text(message),
    );
  }

  Widget getListItemUi(int index, List<String> items) {
    return Container(
      margin: EdgeInsets.all(10.0),
      height: 50,
      color: Colors.teal,
      child: Center(
        child: Text(
          items[index],
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
      ),
    );
  }
}
