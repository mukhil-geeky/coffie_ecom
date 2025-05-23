
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fbloc_event_gen/annotations.dart';
import 'package:equatable/equatable.dart';
part 'order_bloc_event.dart';
part 'order_bloc_state.dart';
part 'order_bloc_bloc.g.dart';

class OrderBlocBloc extends Bloc<OrderBlocEvent, OrderBlocState> {
  OrderBlocBloc() : super(OrderBlocState.initial()){
    OrderBlocState.registerEvents(this);
  }

}