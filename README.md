# Text animation - Type Writer

The simple package that support animation of type writer.
Just input the text span, duration and trigger the animation.

## Example

```dart
  AnimTypeWriter(
    cursor: const AnimBlinkCursor(),
    duration: const Duration(seconds: 12),
    textSpan: TextSpan(
      children: [
        TextSpan(text: 'Flying commercial wastes more than 2 hours'),
        TextSpan(
          text: ' on every Sydney–Melbourne round trip. Yet with',
          style: TextStyle(
            color: Color(0xFF999999),
          ),
        ),
        TextSpan(text: r' private charters costing $11,000 one-way'),
        TextSpan(
          text: ', most have been left behind —',
          style: TextStyle(
            color: Colors.red,
          ),
        ),
        TextSpan(text: ' until now.'),
      ],
      style: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.w500,
        color: Color(0xFFe6e6e6),
      ),
    ),
  );
```
