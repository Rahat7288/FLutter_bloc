import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

part 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(CounterState.initial());
  /**
   * in the cubit.dart file we diclear all the functions 
   * we use emit to manipulate the state.dart file variables
   */
  void increment(){
    emit(state.copyWith(counter: state.counter + 1));
  }

  void decriment(){
    emit(state.copyWith(counter: state.counter - 1)); 
  }
}
