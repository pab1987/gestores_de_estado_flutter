part of 'counter_bloc.dart';

//* Usando blocs, el state se comporta igual que en el caso de cubit
class CounterState extends Equatable {
  final int counter;
  final int transactionCount;

  const CounterState({this.counter = 10, this.transactionCount = 0});

  CounterState copyWith({
    int? counter,
    int? transactionCount
  }) => CounterState(
    counter: counter ?? this.counter,
    transactionCount: transactionCount ??  this.transactionCount
  );

  @override
  List<Object> get props => [counter, transactionCount];
}

//final class CounterInitial extends CounterState {}
