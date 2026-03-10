import 'package:flutter/material.dart';

class SwipeToPay extends StatefulWidget {
  final VoidCallback? onPaymentConfirmed;

  const SwipeToPay({super.key, this.onPaymentConfirmed});

  @override
  State<SwipeToPay> createState() => _SwipeToPayState();
}

class _SwipeToPayState extends State<SwipeToPay>
    with SingleTickerProviderStateMixin {
  double _dragPosition = 0;
  bool _completed = false;

  late AnimationController _resetController;
  late Animation<double> _resetAnimation;

  static const double _handleSize = 70;
  static const double _trackHeight = 70;
  static const double _trackWidth = 354;
  static const double _maxDrag = _trackWidth - _handleSize;
  static const Color _bgColor = Color(0xFFF4EAFF);
  static const Color _handleColor = Color(0xFF3F304F);
  static const Color _textColor = Color(0xFF3F304F);

  @override
  void initState() {
    super.initState();
    _resetController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 350),
    );
    _resetAnimation = CurvedAnimation(
      parent: _resetController,
      curve: Curves.easeOut,
    );
    _resetAnimation.addListener(() {
      setState(() {
        _dragPosition = _resetAnimation.value;
      });
    });
  }

  @override
  void dispose() {
    _resetController.dispose();
    super.dispose();
  }

  void _onDragUpdate(DragUpdateDetails details) {
    if (_completed) return;
    setState(() {
      _dragPosition = (_dragPosition + details.delta.dx).clamp(0.0, _maxDrag);
    });
  }

  void _onDragEnd(DragEndDetails details) {
    if (_completed) return;
    if (_dragPosition >= _maxDrag * 0.85) {
      setState(() {
        _dragPosition = _maxDrag;
        _completed = true;
      });
      widget.onPaymentConfirmed?.call();
    } else {
      final double startPosition = _dragPosition;
      _resetAnimation = Tween<double>(begin: startPosition, end: 0).animate(
        CurvedAnimation(parent: _resetController, curve: Curves.easeOut),
      );
      _resetController.forward(from: 0);
    }
  }

  @override
  Widget build(BuildContext context) {
    final double textOpacity =
        (1.0 - (_dragPosition / (_maxDrag * 0.6)).clamp(0.0, 1.0));

    return Center(
      child: SizedBox(
        width: _trackWidth,
        height: _trackHeight,
        child: Stack(
          children: [
            // ✅ Track background
            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                  color: _bgColor,
                  borderRadius: BorderRadius.circular(45),
                ),
              ),
            ),

            // ✅ SWIPE TO PAY label
            Positioned.fill(
              child: Center(
                child: Opacity(
                  opacity: textOpacity,
                  child: const Text(
                    'SWIPE TO PAY',
                    style: TextStyle(
                      color: _textColor,
                      fontSize: 20,
                      fontWeight: FontWeight.w800,
                      letterSpacing: 0.5,
                    ),
                  ),
                ),
              ),
            ),

            // ✅ Draggable handle
            Positioned(
              left: _dragPosition,
              top: 0,
              child: GestureDetector(
                onHorizontalDragUpdate: _onDragUpdate,
                onHorizontalDragEnd: _onDragEnd,
                child: _SwipeHandle(
                  size: _handleSize,
                  color: _handleColor,
                  barColor: _bgColor,
                  completed: _completed,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SwipeHandle extends StatelessWidget {
  final double size;
  final Color color;
  final Color barColor;
  final bool completed;

  const _SwipeHandle({
    required this.size,
    required this.color,
    required this.barColor,
    required this.completed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF3E1B63).withOpacity(0.30),
            blurRadius: 32,
            offset: Offset.zero,
          ),
          BoxShadow(
            color: const Color(0xFF3E1B63).withOpacity(0.25),
            blurRadius: 4,
            offset: Offset.zero,
          ),
          BoxShadow(
            color: const Color(0xFF3E1B63).withOpacity(0.25),
            blurRadius: 60,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Center(
        child: completed
            ? Icon(Icons.check_rounded, color: barColor, size: 28)
            : _WaveformIcon(barColor: barColor),
      ),
    );
  }
}

class _WaveformIcon extends StatelessWidget {
  final Color barColor;

  const _WaveformIcon({required this.barColor});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _Bar(height: 16, color: barColor),
        const SizedBox(width: 5),
        _Bar(height: 32, color: barColor),
        const SizedBox(width: 5),
        _Bar(height: 22, color: barColor),
      ],
    );
  }
}

class _Bar extends StatelessWidget {
  final double height;
  final Color color;

  const _Bar({required this.height, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 6,
      height: height,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(14),
      ),
    );
  }
}
