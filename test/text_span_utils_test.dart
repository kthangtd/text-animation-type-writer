import 'package:animate_type_writer/src/text_span_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('test the flattern method', () {
    final mainStyle = TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.w500,
      color: Color(0xFFe6e6e6),
    );
    final tertiaryStyle = TextStyle(
      color: Color(0xFF999999),
      fontWeight: FontWeight.w700,
    );
    final spans = TextSpan(
      children: [
        TextSpan(text: 'Flying commercial wastes more than 2 hours'),
        TextSpan(
          text: ' on every Sydney–Melbourne round trip. Yet with',
          style: tertiaryStyle,
        ),
        TextSpan(text: r' private charters costing $11,000 one-way'),
        TextSpan(text: ', most have been left behind —', style: tertiaryStyle),
        TextSpan(text: ' until now.'),
      ],
      style: mainStyle,
    );

    final flattern = spans.flattern();

    test('Check the length', () {
      expect(flattern.length, 171);
    });

    test('Check fontWeight at first char', () {
      expect(flattern.first.style?.fontWeight, FontWeight.w500);
    });

    test('Check fontWeight at 60th char', () {
      expect(flattern[60].style?.fontWeight, FontWeight.w700);
    });

    test('Check fontWeight at last char', () {
      expect(flattern.last.style?.fontWeight, FontWeight.w500);
    });

    test('Check fontSize first char and char at 60th', () {
      expect(flattern.first.style?.fontSize, flattern[60].style?.fontSize);
    });
  });
}
