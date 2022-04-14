import 'package:flutter_bloc/flutter_bloc.dart';

extension EmitterExt on Emitter {
  void async<T>(Stream<T> stream) =>
      forEach<T>(stream, onData: (state) => state);
}
