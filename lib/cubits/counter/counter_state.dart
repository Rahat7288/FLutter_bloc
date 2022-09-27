// ignore_for_file: public_member_api_docs, sort_constructors_first
/**
 * 
 * in the state file we diclear the variables and the initial states 
 * for the perticuler project
 */
part of 'counter_cubit.dart';

class CounterState extends Equatable {
  final int counter;
  /**
   * generating the constractor
   */
  CounterState({
    required this.counter,
  });


  /**
   * create factory initial state
   * factory create the initial state of the counter,
   * like counter = 0 or something 
   */

  factory CounterState.initial(){
    return CounterState(counter: 0);
  }

  /**
   * 
   * this part is for equitable
   */
  
  @override
  
  List<Object?> get props => [counter];


  /**
   * generating toString file
   */

  @override
  String toString() => 'CounterState(counter: $counter)';

  /**
   * gerating copywith
   */

  CounterState copyWith({
    int? counter,
  }) {
    return CounterState(
      counter: counter ?? this.counter,
    );
  }
}
