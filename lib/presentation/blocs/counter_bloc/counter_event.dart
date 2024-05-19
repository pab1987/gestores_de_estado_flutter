part of 'counter_bloc.dart';

sealed class CounterEvent {
  const CounterEvent();

  // Comentamos este override ya que no vamos a comparar eventos
  /* @override
  List<Object> get props => []; */
}

//* Creamos esta clase para saber en cuanto aumenta nuestro counter
class CounterIncreased extends CounterEvent {
  final int value;

  const CounterIncreased(this.value);

}

//* Evento para resetear el estado
class CounterReset extends CounterEvent {}
