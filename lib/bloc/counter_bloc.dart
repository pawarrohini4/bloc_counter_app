import 'package:flutter_bloc/flutter_bloc.dart';

import 'counter_event.dart';
import 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(const CounterState(count: 0)) {
    
    // INCREMENT
    on<Increment>((event, emit) {
      if (state.count < 10) {
        emit(
          CounterState(
            count: state.count + 1,
          ),
        );
      }
    });

    // DECREMENT
    on<Decrement>((event, emit) {
      if (state.count > 0) {
        emit(
          CounterState(
            count: state.count - 1,
          ),
        );
      }
    });

    // RESET
    on<Reset>((event, emit) {
      emit(
        const CounterState(
          count: 0,
        ),
      );
    });
  }
}