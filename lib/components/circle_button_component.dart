import 'package:fleasy/fleasy.dart';
import 'package:flutter/material.dart';

class CircleButton extends StatelessWidget {
  const CircleButton({
    super.key,
    required this.onPressed,
    required this.isLoading,
  });

  final Function() onPressed;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      padding: const EdgeInsets.all(Insets.xxl),
      style: ButtonStyle(
        backgroundColor: MaterialStatePropertyAll(
          Theme.of(context).colorScheme.primary,
        ),
      ),
      icon: isLoading
          ? const SizedBox(
              height: Insets.xl * 2,
              width: Insets.xl * 2,
              child: CircularProgressIndicator(
                strokeWidth: Insets.xxs,
              ),
            )
          : const Icon(
              Icons.arrow_forward_ios_rounded,
            ),
      onPressed: isLoading ? null : onPressed,
    );
  }
}
