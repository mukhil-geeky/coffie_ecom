// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_bloc_bloc.dart';

// **************************************************************************
// StateGenerator
// **************************************************************************

// Events Generated for corresponding states in State Class
class UpdateIsLoadingEvent extends OrderBlocEvent {
  final bool? isLoading;
  const UpdateIsLoadingEvent({required this.isLoading});

  @override
  List<Object?> get props => [isLoading];
}

class UpdateCounterEvent extends OrderBlocEvent {
  final int counter;
  const UpdateCounterEvent({required this.counter});

  @override
  List<Object?> get props => [counter];
}

class UpdateIsDeliverEvent extends OrderBlocEvent {
  final bool isDeliver;
  const UpdateIsDeliverEvent({required this.isDeliver});

  @override
  List<Object?> get props => [isDeliver];
}

/// A state class that represents the complete state of the 'OrderBlocBloc'.
/// This class is immutable and extends Equatable for value comparison.
class OrderBlocState extends Equatable {
  final bool? isLoading;
  final int counter;
  final bool isDeliver;

  /// Creates a new instance of OrderBlocState with the given parameters.
  const OrderBlocState(
      {this.isLoading, required this.counter, required this.isDeliver});

  /// Creates the initial state of the 'OrderBlocBloc'.
  /// This method sets up default values for all state properties.
  static OrderBlocState initial() {
    return OrderBlocState(isLoading: false, counter: 0, isDeliver: true);
  }

  /// Creates a copy of this state with the given parameters replaced.
  /// If a parameter is not provided, the value from the current state is used.
  OrderBlocState copyWith({bool? isLoading, int? counter, bool? isDeliver}) {
    return OrderBlocState(
        isLoading: isLoading ?? this.isLoading,
        counter: counter ?? this.counter,
        isDeliver: isDeliver ?? this.isDeliver);
  }

  /// Creates a copy of this state with the ability to set specific fields to null.
  /// The boolean parameters control whether the corresponding field should be set to null.
  OrderBlocState copyWithNull(
      {bool isLoading = false, int? counter, bool? isDeliver}) {
    return OrderBlocState(
        isLoading: isLoading ? null : this.isLoading,
        counter: counter ?? this.counter,
        isDeliver: isDeliver ?? this.isDeliver);
  }

  /// Registers all event handlers for the 'OrderBlocBloc'.
  /// This method sets up the event-to-state mapping for all possible state updates.
  static void registerEvents(OrderBlocBloc bloc) {
    bloc.on<UpdateIsLoadingEvent>((event, emit) {
      if (event.isLoading == null) {
        emit(bloc.state.copyWithNull(isLoading: true));
      } else {
        emit(bloc.state.copyWith(isLoading: event.isLoading));
      }
    });

    bloc.on<UpdateCounterEvent>((event, emit) {
      emit(bloc.state.copyWith(counter: event.counter));
    });

    bloc.on<UpdateIsDeliverEvent>((event, emit) {
      emit(bloc.state.copyWith(isDeliver: event.isDeliver));
    });
  }

  /// Returns a list of all properties used for equality comparison.
  @override
  List<Object?> get props => [isLoading, counter, isDeliver];
}

/// Extension on BuildContext that provides convenient methods for updating the 'OrderBlocBloc' state.
/// This extension simplifies state updates by providing a single method to update multiple state properties.
extension OrderBlocBlocContextExtension on BuildContext {
  /// Updates the 'OrderBlocBloc' state with the provided values.
  /// Only the specified parameters will be updated; others will remain unchanged.
  /// Uses UnspecifiedDataType.instance as a sentinel value to determine which parameters to update.
  void setOrderBlocBlocState({
    dynamic isLoading = UnspecifiedDataType.instance,
    dynamic counter = UnspecifiedDataType.instance,
    dynamic isDeliver = UnspecifiedDataType.instance,
  }) {
    final myBloc = read<OrderBlocBloc>(); // Read the MyBloc instance
    if (isLoading != UnspecifiedDataType.instance) {
      myBloc.add(UpdateIsLoadingEvent(isLoading: isLoading as bool?));
    }

    if (counter != UnspecifiedDataType.instance) {
      myBloc.add(UpdateCounterEvent(counter: counter as int));
    }

    if (isDeliver != UnspecifiedDataType.instance) {
      myBloc.add(UpdateIsDeliverEvent(isDeliver: isDeliver as bool));
    }
  }
}
