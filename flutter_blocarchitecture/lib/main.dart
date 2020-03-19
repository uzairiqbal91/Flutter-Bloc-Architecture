import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_blocarchitecture/Bloc/counterBloc.dart';


// Bloc pattern has 4 things
// 1 - state -> data of application is currently showing
// 2 - event -> is any action that detected by application
// 3 - Streams  -> medium throigh which data travels , like pipe
// 4 - Sink -> the point where you can recive or consume the data from the stream

void main() => runApp(MyApp());

// here are 2 events increment and decrement


class MyApp extends StatelessWidget {



  @override
  Widget build(BuildContext context) {



    return MaterialApp(
      home: Scaffold(

        // for gettting the event we have to use blocProvider

        body: BlocProvider<CounterBloc>(



            create: (BuildContext context) => CounterBloc(),



          child: Counter()


        ),
      ),
    );
  }


}

class Counter extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final _counter_bloc = BlocProvider.of<CounterBloc>(context);
    return  Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[

          // we have to use the bloc builder to get the current state



          BlocBuilder<CounterBloc,int>(

            builder: (BuildContext context, state) {

              return  Text(
                "counter " + state.toString() ,
                style: TextStyle(fontSize: 18, color: Colors.black),
              );

            },



          ),
          Padding(
            padding: EdgeInsets.all(20),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: RaisedButton(
                    child: Text(
                      "increment",
                      style: TextStyle(color: Colors.white),
                    ),
                    color: Colors.teal,
                    onPressed: () {

                      _counter_bloc.add(CounterEvents.increment);
//                            here we have to pass the increment event to Bloc
//                            setState(() {
//
//                              // here we have to pass the increment event to Bloc
////                            this.counter = this.counter + 1;
//                            });
                    },
                  ),
                ),
                Container(
                  width: 10,
                ),
                Expanded(
                  child: RaisedButton(
                    child: Text(
                      "decrement",
                      style: TextStyle(color: Colors.white),
                    ),
                    color: Colors.teal,
                    onPressed: () {
                      _counter_bloc.add(CounterEvents.decrement);
                      // here we have to pass the decrement event to Bloc
//                            setState(() {
//
//
//                                // here we have to pass the decrement event to Bloc
//
//
////                              this.counter = this.counter - 1;
//
//                            });
                    },
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

