import 'package:bloc_conc/cubits/counter/counter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    /**
     * wrap with BlocProver to access the CounterCubit variables and functions
     */
    return BlocProvider<CounterCubit>(
      create: (context) => CounterCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'my counter cubit',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const MyhomePage(),
      ),
    );
  }
}

class MyhomePage extends StatelessWidget {
  const MyhomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          /**
           * accessing the counter from CounterCubit state
           * to display the value on the ui we have to implement the (listen:  true) to manupulate the 
           * ui output
           */
          '${BlocProvider.of<CounterCubit>(context, listen: true).state.counter}',
          style: TextStyle(fontSize: 52.0),
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              /**
               * calling the function from CounterCubit cubit.dart file
               * incriment function
               */
              BlocProvider.of<CounterCubit>(context).increment();
            },
            child: Icon(Icons.add),
            heroTag: 'increment',
          ),
          SizedBox(
            width: 10.0,
          ),
          FloatingActionButton(
            onPressed: () {
              /**
               * calling the function from CounterCubit cubit.dart file
               * decriment function
               */
              BlocProvider.of<CounterCubit>(context).decriment();
            },
            child: Icon(Icons.remove),
            heroTag: 'decrement',
          )
        ],
      ),
    );
  }
}
