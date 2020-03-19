import 'package:flutter_bloc/flutter_bloc.dart';

enum CounterEvents { increment, decrement }

// fisrt one is Events and second one is data type to return
class CounterBloc extends Bloc<CounterEvents, int> {
  @override
  // TODO: implement initialState

  // initial value
  // inital value of counter is 0
  int get initialState => 0;

  // async because it is continously producing new output
  // async* and async difference is async* return stream and get form yield(dont return because we dont want to break this) and async return future
  @override
  Stream<int> mapEventToState(CounterEvents event) async* {
    // TODO: implement mapEventToState

    switch (event) {
      case CounterEvents.increment:
        yield this.state + 1;
        break;
      case CounterEvents.decrement:
        if (this.state != 0) {
          yield this.state - 1;
        }

        break;
    }
  }
}
