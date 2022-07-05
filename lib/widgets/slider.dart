import 'package:flutter/material.dart';

class MyCustomSlider extends StatelessWidget {
  final double minValue;
  final double maxValue;
  final double value;
  final Function(double) onChanged;
  const MyCustomSlider({
    Key? key,
    required this.minValue,
    required this.maxValue,
    required this.value,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliderTheme(
      data: SliderTheme.of(context).copyWith(
        trackShape: CustomTrackShape(),
        trackHeight: 6.0,
        // thumbColor: Theme.of(context).colorScheme.secondary,
        // activeTrackColor: Theme.of(context).colorScheme.secondary,
        // inactiveTrackColor: Theme.of(context).colorScheme.onSurfaceVariant,
        thumbShape: RoundSliderThumbShape(enabledThumbRadius: 10.0),
        // overlayColor: Colors.red.withAlpha(32),
      ),
      child: Slider(
        min: minValue,
        max: maxValue,
        value: value,
        onChanged: onChanged,
      ),
    );
  }
}

class CustomTrackShape extends RoundedRectSliderTrackShape {
  Rect getPreferredRect({
    required RenderBox parentBox,
    Offset offset = Offset.zero,
    required SliderThemeData sliderTheme,
    bool isEnabled = false,
    bool isDiscrete = false,
  }) {
    final double trackHeight = sliderTheme.trackHeight!;
    final double trackLeft = offset.dx;
    final double trackTop =
        offset.dy + (parentBox.size.height - trackHeight) / 2;
    final double trackWidth = parentBox.size.width;
    return Rect.fromLTWH(trackLeft, trackTop, trackWidth, trackHeight);
  }
}
