import 'package:bloc_conc/cubits/counter/counter_cubit.dart';
import 'package:bloc_conc/other_page.dart';
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

/**
 * 
 * if we use the BlocListener we have to use the BlocBuilder If We use BlocConsumer we don't need to 
 * use the BlocBuilder
 */

class MyhomePage extends StatelessWidget {
  const MyhomePage({super.key});

  @override
  Widget build(BuildContext context) {
    /**
     * if we use the BlocBuilder we don't need to use blocProvider listen to be true
     * we can access the variabls by using the
     */

    return BlocListener<CounterCubit, CounterState>(
      listener: (context, state) {
        // TODO: implement listener
         if(state.counter == 3){
              showDialog(
                context: context,
                 builder: (context) => AlertDialog(
                  content: Text('Counter in ${state.counter}'),
                 )
                 );
            }else if(state.counter == -1){
              Navigator.push(context, MaterialPageRoute(builder: (context){
                return OtherPage();
              }
              )
              );
            }
      },
      child: Scaffold(
        body: BlocBuilder<CounterCubit, CounterState>(
          builder: (context, state) {

           
            return Center(
              child: Text(
                /**
                             * accessing the counter from CounterCubit state
                             * to display the value on the ui we have to implement the (listen:  true) to manupulate the 
                             * ui output
                             * listen helps ui to rebuild
                             */
                '${state.counter}',
                style: TextStyle(fontSize: 52.0),
              ),
            );
          },
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
      ),
    );
  }
}
