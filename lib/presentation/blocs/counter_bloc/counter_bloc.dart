import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  //* Este constructor inicializa el estado llamando al super
  CounterBloc() : super(const CounterState()) {
    on<CounterIncreased>(_onCounterIncreased);
    on<CounterReset>(_onCounterReset); //* Creamos el nuevo handler 
  }

  void _onCounterIncreased(CounterIncreased event, Emitter<CounterState> emit) {
    emit(state.copyWith(
        counter: state.counter + event.value,
        transactionCount: state.transactionCount + 1));
  }

  //* Creamos el método que resive el evento para resetear el state
  void _onCounterReset(CounterReset event, Emitter<CounterState> emit) {
    //* Le pasamos 0 al counter
    emit(state.copyWith(
        counter: 0,
      ));
  }

  //* Método dos de hacerlo
  void increaseBy([int value = 1]) {
    add(CounterIncreased(value));
  }

  //* Método dos de hacerlo
  void resetCounter() {
    add(CounterReset());
  }
  
}
