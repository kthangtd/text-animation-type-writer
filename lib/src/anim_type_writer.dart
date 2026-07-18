import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'anim_blink_cursor.dart';
import 'text_span_utils.dart';

class AnimTypeWriter extends StatefulWidget {
  final TextSpan textSpan;
  final Duration duration;
  final Widget cursor;

  const AnimTypeWriter({
    super.key,
    required this.textSpan,
    this.duration = const Duration(seconds: 12),
    this.cursor = const AnimBlinkCursor(),
  });

  @override
  State<AnimTypeWriter> createState() => AnimTypeWriterState();
}

class AnimTypeWriterState extends State<AnimTypeWriter>
    with TickerProviderStateMixin {
  late final List<InlineSpan> allSpans;
  late AnimationController _controller;
  late Animation<int> _animation;

  @override
  void initState() {
    allSpans = widget.textSpan.flattern();
    _makeNewAnimationController();
    super.initState();
    trigger();
  }

  @override
  void didUpdateWidget(covariant AnimTypeWriter oldWidget) {
    super.didUpdateWidget(oldWidget);
    final newAllSpans = widget.textSpan.flattern();
    if (oldWidget.duration != widget.duration ||
        !listEquals(newAllSpans, allSpans)) {
      allSpans.clear();
      allSpans.addAll(newAllSpans);
      _controller.stop();
      _controller.dispose();
      _makeNewAnimationController();
      _controller.forward();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void trigger() {
    if (mounted) {
      _controller.forward();
    }
  }

  void _makeNewAnimationController() {
    _controller = AnimationController(vsync: this, duration: widget.duration);
    _animation = StepTween(begin: 0, end: allSpans.length).animate(_controller);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Opacity(opacity: 0, child: Text.rich(widget.textSpan)),
        AnimatedBuilder(
          animation: _animation,
          builder: (context, child) {
            return Text.rich(
              TextSpan(
                children: [
                  ...allSpans.sublist(0, _animation.value),
                  WidgetSpan(child: child!),
                ],
              ),
            );
          },
          child: widget.cursor,
        ),
      ],
    );
  }
}
