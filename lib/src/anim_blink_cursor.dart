import 'package:flutter/material.dart';

class AnimBlinkCursor extends StatefulWidget {
  final Offset offset;
  final int blinkDurationMs;
  final bool isRepeat;
  final Widget? child;

  const AnimBlinkCursor({
    super.key,
    this.offset = const Offset(0, 3),
    this.blinkDurationMs = 400,
    this.isRepeat = true,
    this.child,
  });

  @override
  State<AnimBlinkCursor> createState() => _AnimBlinkCursorState();
}

class _AnimBlinkCursorState extends State<AnimBlinkCursor>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: widget.blinkDurationMs),
    )..repeat(reverse: widget.isRepeat);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final child =
        widget.child ??
        Text(
          '|',
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 20,
            color: Colors.white,
          ),
        );
    return Transform.translate(
      offset: widget.offset,
      child: FadeTransition(opacity: _controller, child: child),
    );
  }
}
