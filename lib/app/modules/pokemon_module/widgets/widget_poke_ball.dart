part of 'widget_item.dart';

class _WidgetPokeBall extends StatefulWidget {
  @override
  __WidgetPokeBallState createState() => __WidgetPokeBallState();
}

class __WidgetPokeBallState extends State<_WidgetPokeBall>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 10),
    )..stop();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (_, child) {
        return Transform.rotate(
          angle: _controller.value * 2 * pi,
          child: Image.asset(
            'assets/images/pokeball.png',
            color: Colors.white24,
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
