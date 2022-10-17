import 'package:flutter/material.dart';

class AnimatedImage extends StatefulWidget {
  const AnimatedImage(tatliSlide, {Key? key}) : super(key: key);

  @override
  State<AnimatedImage> createState() => _AnimatedImageState();
}

class _AnimatedImageState extends State<AnimatedImage>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller =
      AnimationController(vsync: this, duration: _DurationUtility._durationLow)
        ..repeat(reverse: true);

  late final Animation<Offset> _animation = Tween<Offset>(
    begin: Offset.zero,
    end: const Offset(0, 0.08),
  ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        //Image.asset('assets/kar.png'),
        SlideTransition(
          position: _animation,
          child: Image.asset(ImageItems().tatli),
        ),
      ],
    );
  }
}

class _DurationUtility {
  static const _durationLow = const Duration(seconds: 3);
}

class ImageItems {
  final String tatli = "assets/tatlı.png";
}
