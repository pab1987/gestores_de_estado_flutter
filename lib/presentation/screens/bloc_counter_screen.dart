import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_app/presentation/blocs/counter_bloc/counter_bloc.dart';

class BlocCounterScreen extends StatelessWidget {
  const BlocCounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //* Método 1
    //* Se extrae el widget y se envuelve e un BlocProvider
    return  BlocProvider(
      //* Se agrega el create y se instancia el CounterBloc
      create: (_) => CounterBloc(),
      child: const BlocCounterView()
    );
  }
}

class BlocCounterView extends StatelessWidget {
  const BlocCounterView({
    super.key,
  });

  //* Método para llamar el evento mediante read
  void increaseCounterBy(BuildContext context, [int value = 1]) {
    //context.read<CounterBloc>().add(CounterIncreased(value)); //Método 1
    context.read<CounterBloc>().increaseBy(value); //Método 2
  }

  //* Para resetear el estado usamos read en Bloc
  void resetCounterBy(BuildContext context) {
    //* Adicionamos el evento creado
    //context.read<CounterBloc>().add(CounterReset()); //Método 1
    context.read<CounterBloc>().resetCounter();//Método 2
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: context.select((CounterBloc counterBloc ) => Text('Bloc counter: ${counterBloc.state.transactionCount}')),
        
        actions: [
          IconButton(
            onPressed: () {
              resetCounterBy(context);
            }, 
            icon: const Icon(Icons.refresh_outlined)
          )
        ],
      ),
      body: Center(
        //* Método 1
        child: context.select((CounterBloc counterBloc) =>  Text('Counter value: ${counterBloc.state.counter}'),)
        
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: '1',
            child: const Text('+3'),
            onPressed: () => increaseCounterBy(context, 3)
          ),
    
          const SizedBox(height: 15,),
    
          FloatingActionButton(
            heroTag: '2',
            child: const Text('+2'),
            onPressed: () => increaseCounterBy(context, 2)
          ),
    
          const SizedBox(height: 15,),
    
          FloatingActionButton(
            heroTag: '3',
            child: const Text('+1'),
            onPressed: () => increaseCounterBy(context)
          ),
        ],
      ),
    );
  }
}