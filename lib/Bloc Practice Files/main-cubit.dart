import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';

enum CounterEvent { increment, decrement }

class CounterBloc extends Bloc<CounterEvent, int> {
  CounterBloc() : super(0);

  void increment() => emit(state + 1);
  void decrement() => emit(state - 1);

  @override
  Stream<int> mapEventToState(CounterEvent event) async* {
    switch (event) {
      case CounterEvent.increment:
        yield state + 1;
        break;
      case CounterEvent.decrement:
        yield state - 1;
        break;
    }
    throw UnimplementedError();
  }
}

Future<void> main(List<String> args) async {
  final bloc = CounterBloc();

  final streamSubscription = bloc.stream;

  bloc.add(CounterEvent.increment);

  await Future.delayed(Duration.zero);

  // log(bloc.state.toString());
  // bloc.increment();
  // log(bloc.state.toString());
  // bloc.increment();
  // log(bloc.state.toString());
  // bloc.decrement();
  // log(bloc.state.toString());
  streamSubscription.listen((event) {
    log("dsfdfs");
  });
  await bloc.close();
}
