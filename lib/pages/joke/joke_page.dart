import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kate_test_task/data/models/joke_model.dart';
import 'package:kate_test_task/pages/joke/bloc/joke_bloc.dart';
import 'package:kate_test_task/pages/joke/widgets/joke_widget.dart';

class JokePage extends StatefulWidget {
  const JokePage({Key? key}) : super(key: key);

  @override
  _JokePageState createState() => _JokePageState();
}

class _JokePageState extends State<JokePage> {
  final JokeBloc _bloc = JokeBloc();
  Timer? _timer;
  JokeModel? _currentJoke;

  @override
  void initState() {
    super.initState();
    _bloc.add(GetJokeEvent());
  }

  @override
  void dispose() {
    _bloc.close();
    _timer?.cancel();
    _timer = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<JokeBloc, JokeState>(
      bloc: _bloc,
      listener: _onState,
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Make me laugh'),
          ),
          body: state is ProgressState
              ? const Center(child: CupertinoActivityIndicator())
              : JokeWidget(
                  setup: _currentJoke?.setup ?? '',
                  punchline: _currentJoke?.punchline ?? '',
                  onShowPunchline: _onShowPunchLine,
                ),
        );
      },
    );
  }

  void _onShowPunchLine() {
    _timer?.cancel();
    _timer = Timer(const Duration(seconds: 3), _onTimerOff);
  }

  void _onTimerOff() {
    _bloc.add(GetJokeEvent());
  }

  void _onState(BuildContext context, JokeState state) {
    if (state is GotJokeState) {
      _currentJoke = state.joke;
    } else if (state is ErrorState) {
      showDialog(
        context: context,
        builder: (ctx) => CupertinoAlertDialog(
          title: const Text('Something went wrong'),
          actions: [
            CupertinoDialogAction(
              child: const Text('Retry'),
              onPressed: () => _onErrorOkPressed(ctx),
            ),
          ],
        ),
      );
    }
  }

  void _onErrorOkPressed(BuildContext ctx) {
    Navigator.of(ctx).pop();
    _bloc.add(GetJokeEvent());
  }
}
