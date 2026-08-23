import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppBlocObserver extends BlocObserver {
  @override
  void onCreate(BlocBase bloc) {
    super.onCreate(bloc);

    debugPrint('🟢 [CREATE] ${bloc.runtimeType}');
  }

  @override
  void onEvent(Bloc bloc, Object? event) {
    super.onEvent(bloc, event);

    debugPrint('📩 [EVENT] ${bloc.runtimeType} -> $event');
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);

    debugPrint(
      '🔄 [CHANGE] ${bloc.runtimeType}\n'
      '   Current: ${change.currentState}\n'
      '   Next:    ${change.nextState}',
    );
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);

    debugPrint(
      '🚀 [TRANSITION] ${bloc.runtimeType}\n'
      '   Event:   ${transition.event}\n'
      '   Current: ${transition.currentState}\n'
      '   Next:    ${transition.nextState}',
    );
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    debugPrint(
      '❌ [ERROR] ${bloc.runtimeType}\n'
      '   Error: $error\n'
      '   StackTrace: $stackTrace',
    );

    super.onError(bloc, error, stackTrace);
  }

  @override
  void onClose(BlocBase bloc) {
    debugPrint('🔴 [CLOSE] ${bloc.runtimeType}');

    super.onClose(bloc);
  }
}
