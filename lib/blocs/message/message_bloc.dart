import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:rxdart/rxdart.dart';

import 'bloc.dart';

class MessageBloc extends Bloc<MessageEvent, MessageState> {
  // MessageBloc() : super(MessageInit());

  // @override
  // Stream<Transition<MessageEvent, MessageState>> transformEvents(
  //   Stream<MessageEvent> events,
  //   TransitionFunction<MessageEvent, MessageState> transitionFn,
  // ) {
  //   final debounceStream = events.where((event) {
  //     return event is OnMessage;
  //   }).debounceTime(
  //     const Duration(milliseconds: 500),
  //   );
  //   return super.transformEvents(
  //     debounceStream,
  //     transitionFn,
  //   );
  // }

  MessageBloc() : super(MessageInit()) {
    on<OnMessage>((event, emit) {
      emit(MessageShow(
        text: event.message,
        action: event.action,
        onPressed: event.onPressed,
        duration: event.duration,
      ));
    });
  }
}
