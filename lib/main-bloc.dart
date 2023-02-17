import 'package:bloc/bloc.dart';


abstract class CounterEvent {}

/// Notifies bloc to increment state.
class CounterIncrementPressed extends CounterEvent {}

class CounterDecrementPressed extends CounterEvent {}

class CounterBloc extends Bloc<CounterEvent, int> {
  // CounterBloc() : super(0);
  //
  // @override
  // Stream<int> mapEventToState(CounterEvent event) async* {
  //   switch (event) {
  //     case CounterEvent.increment:
  //       yield state + 1;
  //       break;
  //     case CounterEvent.decrement:
  //       yield state - 1;
  //       break;
  //   }
  //   throw UnimplementedError();
  // }

  CounterBloc() : super(0) {
    on<CounterIncrementPressed>((event, emit) => emit(state + 1));
    on<CounterDecrementPressed>((event, emit) => emit(state - 1));
  }

  @override
  void onEvent(CounterEvent event) {
    super.onEvent(event);
    print('this is event ${event}');
  }

  @override
  void onChange(Change<int> change) {
    super.onChange(change);
    print('this is change ${change}');
  }

  @override
  void onTransition(Transition<CounterEvent, int> transition) {
    super.onTransition(transition);
    print('this is transition ${transition}');
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    print('this is error $error, this is stackTrace $stackTrace');
    super.onError(error, stackTrace);
  }
}

Future<void> main(List<String> args) async {
  final bloc = CounterBloc();

  // final streamSubscription = bloc.listen(print);
  /// Access the state of the `bloc` via `state`.
  print(bloc.state);

  bloc.add(CounterIncrementPressed());
  // bloc.add(CounterIncrementPressed());
  // bloc.add(CounterIncrementPressed());
  //
  // bloc.add(CounterDecrementPressed());
  // bloc.add(CounterDecrementPressed());

  // bloc.add(CounterEvent.decrement);
  // bloc.add(CounterEvent.decrement);


  /// Wait for next iteration of the event-loop  Зачекайте на наступну ітерацію циклу подій
  /// to ensure event has been processed.        щоб переконатися, що подія оброблена.
  await Future.delayed(Duration(seconds: 2)); //! we use this to not cancel the subscription immediately down here

  print(bloc.state);
  // await streamSubscription.cancel();
  await bloc.close();
}