import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_app/presentation/blocs/counter_cubit/counter_cubit.dart';

class CubitCounterScreen extends StatelessWidget {
  const CubitCounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //* Envolvemos todos los widgets que van a tener acceso a nuestro state del provider en un BlocProvider
    return BlocProvider(
        create: (_) => CounterCubit(), child: const _CubitCounterView());
  }
}

class _CubitCounterView extends StatelessWidget {
  const _CubitCounterView({
    super.key,
  });

  void increseCounterBy(BuildContext context, [value = 1]) {
    context.read<CounterCubit>().increaseBy(value);
  }

  @override
  Widget build(BuildContext context) {
    //* Forma número 2 de usarlo: Podemos acceder al state de esta forma similar a RiverPod
    //final counterStateWatch = context.watch<CounterCubit>().state;
    //final counterStateRead = context.read<CounterCubit>();

    return Scaffold(
      appBar: AppBar(
        title: context.select(( CounterCubit value) => Text('Cubit counter: ${value.state.transactionCount}')),
        
        actions: [
          IconButton(onPressed: () {
            //counterStateRead.reset();
            context.read<CounterCubit>().reset();
          }, 
          icon: const Icon(Icons.refresh_outlined))
        ],
      ),
      body: Center(

        //* Forma número 1 de usarlo: Para usar el gestor de estado llamamos nuestro Cubit y nuestro State
        child: BlocBuilder<CounterCubit, CounterState>(
          //* Podemos reconstruirlo solo cuando el state cambie
          //buildWhen: (previous, current) => current.counter != previous.counter,
          builder: (context, state) {
            print('El counter cabió');
            return Text('Counter value: ${state.counter}');
          },
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
              heroTag: '1', 
              child: const Text('+3'), 
              onPressed: () {
                increseCounterBy(context, 3);
                //counterStateRead.increaseBy( 3 );
              }
            ),
          const SizedBox(
            height: 15,
          ),
          FloatingActionButton(
              heroTag: '2', 
              child: const Text('+2'), 
              onPressed: () {
                increseCounterBy(context, 2);
                //counterStateRead.increaseBy( 2 );
              }
            ),
          const SizedBox(
            height: 15,
          ),
          FloatingActionButton(
              heroTag: '3', 
              child: const Text('+1'), 
              onPressed: () {
                increseCounterBy(context);
                //counterStateRead.increaseBy( 1 );
              }
            ),
        ],
      ),
    );
  }
}
