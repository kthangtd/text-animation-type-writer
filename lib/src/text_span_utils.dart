import 'package:flutter/material.dart';

extension InlineSpanUtils on InlineSpan {
  List<InlineSpan> flattern() {
    return parseTextSpan(this);
  }

  List<InlineSpan> parseTextSpan(InlineSpan span, {TextStyle? parentStyle}) {
    final allSpans = <InlineSpan>[];

    if (span is TextSpan) {
      final text = span.text;
      if (text != null && text.isNotEmpty) {
        final vs = text.split('');
        allSpans.addAll(
          vs.map((e) {
            final style = parentStyle != null
                ? parentStyle.merge(span.style)
                : span.style;
            return TextSpan(text: e, style: style);
          }),
        );
      }

      if (span.children != null) {
        span.children?.forEach(
          (e) => allSpans.addAll(parseTextSpan(e, parentStyle: span.style)),
        );
      }
    }
    return allSpans;
  }
}
