import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ErrorContainer extends StatelessWidget {
  const ErrorContainer({
    required this.size,
    required this.message,
    super.key,
  });

  final Size size;
  final String message;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Center(
      child: Container(
        width: size.width,
        height: size.height,
        padding: EdgeInsets.all(size.longestSide * 0.05),
        decoration: BoxDecoration(
          color: theme.colorScheme.errorContainer,
          borderRadius: BorderRadius.circular(size.longestSide * 0.02),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              'lbl_error_title'.tr,
              style: theme.textTheme.titleLarge!
                  .copyWith(color: theme.colorScheme.onErrorContainer),
            ),
            Text(
              message,
              style: theme.textTheme.bodyMedium!.copyWith(
                color: theme.colorScheme.onErrorContainer,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
