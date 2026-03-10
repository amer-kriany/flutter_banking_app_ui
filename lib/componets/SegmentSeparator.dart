import 'package:flutter/material.dart';

class SegmentSeparator extends StatefulWidget {
  final List<String>? segments;
  final int initialIndex;
  final ValueChanged<int>? onSegmentChanged;
  final double shadowWidth; // ✅ تغيير النوع لـ double وإزالة الـ default المكسور

  const SegmentSeparator({
    super.key,
    this.segments,
    this.initialIndex = 0,
    this.shadowWidth = 119.0, // ✅ قيمة افتراضية منطقية (354 / 3)
    this.onSegmentChanged,
  });

  @override
  State<SegmentSeparator> createState() => _SegmentSeparatorState();
}

class _SegmentSeparatorState extends State<SegmentSeparator>
    with SingleTickerProviderStateMixin {
  late int _selectedIndex;
  late AnimationController _controller;
  late Animation<double> _slideAnimation;

  static const Color _bgColor = Color(0xFFF4F2F6);
  static const Color _selectedBg = Color(0xFF3F304F);
  static const Color _selectedText = Color(0xFFF4F2F6);
  static const Color _unselectedText = Color(0xFF3F304F);
  static const double _height = 40.0;
  static const double _totalWidth = 354.0;
  static const double _borderRadius = 12.0;

  // ✅ إزالة الـ static const واستخدام widget.shadowWidth بدلها

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.initialIndex;

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );

    _slideAnimation = Tween<double>(
      begin: _getTargetOffset(_selectedIndex),
      end: _getTargetOffset(_selectedIndex),
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
  }

  double _getTargetOffset(int index) {
    final segments = widget.segments;
    if (segments == null || segments.length <= 1) return 0;
    // ✅ null-safe
    return index * (_totalWidth - widget.shadowWidth) / (segments.length - 1);
  }

  void _onTap(int index) {
    if (index == _selectedIndex) return;

    final double from = _slideAnimation.value;
    final double to = _getTargetOffset(index);

    _slideAnimation = Tween<double>(
      begin: from,
      end: to,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

    _controller.forward(from: 0);

    setState(() {
      _selectedIndex = index;
    });

    widget.onSegmentChanged?.call(index);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final segments = widget.segments ?? []; // ✅ null-safe fallback

    return Center(
      child: Container(
        width: _totalWidth,
        height: _height,
        decoration: BoxDecoration(
          color: _bgColor,
          borderRadius: BorderRadius.circular(_borderRadius),
        ),
        child: Stack(
          children: [
            AnimatedBuilder(
              animation: _slideAnimation,
              builder: (context, child) {
                return Positioned(
                  left: _slideAnimation.value,
                  top: 0,
                  child: child!,
                );
              },
              child: Container(
                width: widget.shadowWidth, // ✅
                height: _height,
                decoration: BoxDecoration(
                  color: _selectedBg,
                  borderRadius: BorderRadius.circular(_borderRadius),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.25),
                      blurRadius: 5,
                      offset: const Offset(0, 1),
                    ),
                    BoxShadow(
                      color: const Color(0xFF3F304F).withOpacity(0.25),
                      blurRadius: 15,
                      spreadRadius: 1,
                    ),
                  ],
                ),
              ),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(segments.length, (index) {
                final bool isSelected = index == _selectedIndex;
                return GestureDetector(
                  onTap: () => _onTap(index),
                  behavior: HitTestBehavior.opaque,
                  child: SizedBox(
                    width: index == segments.length - 1
                        ? _totalWidth -
                              (_totalWidth / segments.length) *
                                  (segments.length - 1)
                        : _totalWidth / segments.length,
                    height: _height,
                    child: Center(
                      child: AnimatedDefaultTextStyle(
                        duration: const Duration(milliseconds: 200),
                        style: TextStyle(
                          fontFamily: 'Mont',
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: isSelected ? _selectedText : _unselectedText,
                        ),
                        child: Text(segments[index]),
                      ),
                    ),
                  ),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}