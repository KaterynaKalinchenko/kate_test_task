import 'package:flutter/material.dart';

class JokeWidget extends StatefulWidget {
  const JokeWidget({
    required this.setup,
    required this.punchline,
    this.onShowPunchline,
    Key? key,
  }) : super(key: key);
  final String setup;
  final String punchline;
  final VoidCallback? onShowPunchline;

  @override
  State<JokeWidget> createState() => _JokeWidgetState();
}

class _JokeWidgetState extends State<JokeWidget> {
  var _showPunchline = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: _showPunchline ? null : _onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              widget.setup,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 100),
            if (_showPunchline) Text(widget.punchline),
          ],
        ),
      ),
    );
  }

  void _onTap() {
    setState(() {
      _showPunchline = true;
      widget.onShowPunchline?.call();
    });
  }
}
