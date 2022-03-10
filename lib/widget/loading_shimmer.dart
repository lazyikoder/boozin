import 'package:flutter/material.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

class LoadingShimmer extends StatelessWidget {
  const LoadingShimmer({
    required this.loading,
    required this.child,
    this.width,
    this.height,
    this.borderRadius,
    Key? key,
  }) : super(key: key);

  final Widget? child;
  final double? width;
  final double? height;
  final bool loading;

  final BorderRadius? borderRadius;

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 500),
      transitionBuilder: _transitionBuilder,
      child: loading
          ? ClipRRect(
              borderRadius: borderRadius ?? BorderRadius.circular(10),
              child: Shimmer(
                duration: const Duration(seconds: 2),
                color: Colors.white.withOpacity(0.005),
                child: Container(
                  color: Colors.black.withOpacity(0.05),
                  alignment: Alignment.center,
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      minHeight: height ?? 0,
                      minWidth: width ?? 0,
                    ),
                    child: IgnorePointer(
                      child: Opacity(
                        opacity: 0,
                        child: child,
                      ),
                    ),
                  ),
                ),
              ),
            )
          : child,
    );
  }

  Widget _transitionBuilder(child, animation) =>
      FadeTransition(opacity: animation, child: child);
}
