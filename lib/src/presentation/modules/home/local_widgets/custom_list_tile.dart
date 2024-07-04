import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../application/dtos/photo_dto.dart';
import '../views/detail/controller/detail_controller.dart';

class CustomListTile extends StatelessWidget {
  const CustomListTile({
    required this.ref,
    required this.theme,
    required this.item,
    required this.screenSize,
    super.key,
  });

  final ThemeData theme;
  final PhotoDto item;
  final Size screenSize;
  final WidgetRef ref;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5),
      margin: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        color: theme.colorScheme.primaryContainer,
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        onTap: () => ref
            .read(detailControllerProvider.notifier)
            .updateDetailViewWithPhoto(item),
        style: ListTileStyle.drawer,
        leading: CachedNetworkImage(
          imageUrl: item.thumbnailUrl,
          imageBuilder: (context, imageProvider) =>
              CircleAvatar(foregroundImage: imageProvider),
          progressIndicatorBuilder: (context, url, progress) =>
              CircularProgressIndicator(
            value: progress.progress,
          ),
          errorWidget: (context, url, error) => const Icon(Icons.error),
        ),
        title: Text(
          item.title,
          overflow: TextOverflow.ellipsis,
          style: theme.textTheme.bodyMedium!.copyWith(
            color: theme.colorScheme.onPrimaryContainer,
            fontSize: screenSize.longestSide * 0.02,
          ),
        ),
        trailing: Text(
          'Ver más',
          style:
              theme.textTheme.titleSmall!.copyWith(color: theme.primaryColor),
        ),
      ),
    );
  }
}
