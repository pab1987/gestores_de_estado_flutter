part of 'counter_cubit.dart';

/* sealed class CounterState {}

final class CounterInitial extends CounterState {} */

//Para usar Equatable debemos agregar el paquete.
//* Equatable nos permite validar si dos las propiedades de dos objetos son iguales
class CounterState extends Equatable {
  final int counter;
  final int transactionCount;

  const CounterState({
    required this.counter, 
    required this.transactionCount
  });

  //* Emitimos un nuevo estado que sería una instancia de mi estado actual
  copyWith({
    int? counter,
    int? transactionCount
  }) => CounterState(
    counter: counter ?? this.counter, 
    transactionCount: transactionCount ?? this.transactionCount
  );
  
  //* Si tenemos propiedades que son null podemos usar ? en el Object
  //Retornamos las propiedades que queremos validar 
  @override
  List<Object> get props => [counter, transactionCount];
}
