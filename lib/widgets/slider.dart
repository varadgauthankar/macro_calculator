import 'package:flutter/material.dart';

class MyCustomSlider extends StatelessWidget {
  final double min;
  final double max;
  final double value;
  final Function onChanged;
  const MyCustomSlider(
      {Key key, this.min, this.max, this.value, this.onChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliderTheme(
      data: SliderTheme.of(context).copyWith(
        trackShape: CustomTrackShape(),
        trackHeight: 6.0,
        thumbColor: Colors.redAccent,
        activeTrackColor: Colors.redAccent,
        inactiveTrackColor: Colors.grey[300],
        thumbShape: RoundSliderThumbShape(enabledThumbRadius: 12.0),
        overlayColor: Colors.red.withAlpha(32),
      ),
      child: Material(
        type: MaterialType.transparency,
        child: Slider(
          min: min,
          max: max,
          value: value,
          onChanged: onChanged,
        ),
      ),
    );
  }
}

class CustomTrackShape extends RoundedRectSliderTrackShape {
  Rect getPreferredRect({
    @required RenderBox parentBox,
    Offset offset = Offset.zero,
    @required SliderThemeData sliderTheme,
    bool isEnabled = false,
    bool isDiscrete = false,
  }) {
    final double trackHeight = sliderTheme.trackHeight;
    final double trackLeft = offset.dx;
    final double trackTop =
        offset.dy + (parentBox.size.height - trackHeight) / 2;
    final double trackWidth = parentBox.size.width;
    return Rect.fromLTWH(trackLeft, trackTop, trackWidth, trackHeight);
  }
}
