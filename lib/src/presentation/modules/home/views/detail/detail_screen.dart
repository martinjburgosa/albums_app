import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';

import 'controller/detail_controller.dart';

class DetailScreen extends ConsumerWidget {
  const DetailScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final photo = ref.watch(detailControllerProvider);
    final screenSize = MediaQuery.of(context).size;
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.colorScheme.surface,
      appBar: AppBar(
        centerTitle: true,
        iconTheme: theme.iconTheme.copyWith(color: theme.colorScheme.onPrimary),
        title: Text(
          photo!.title,
          style: theme.textTheme.titleLarge!
              .copyWith(color: theme.colorScheme.onPrimary),
        ),
        automaticallyImplyLeading: true,
        backgroundColor: theme.colorScheme.primary,
      ),
      body: Padding(
        padding: EdgeInsets.only(bottom: screenSize.height * 0.10),
        child: Column(
          children: [
            SizedBox(
              width: double.infinity,
              height: screenSize.height * 0.4,
              child: CachedNetworkImage(
                imageUrl: photo.url,
                imageBuilder: (context, imageProvider) => Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: imageProvider,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                progressIndicatorBuilder: (context, url, progress) => Center(
                  child: CircularProgressIndicator(
                    value: progress.progress,
                  ),
                ),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(
                vertical: screenSize.height * 0.02,
                horizontal: screenSize.width * 0.05,
              ),
              padding: EdgeInsets.symmetric(
                horizontal: screenSize.width * 0.05,
                vertical: screenSize.height * 0.02,
              ),
              decoration: BoxDecoration(
                color: theme.colorScheme.secondaryContainer,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  color:
                      theme.colorScheme.onSecondaryContainer.withOpacity(0.5),
                  width: 0.25,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    photo.title,
                    style: theme.textTheme.displaySmall!.copyWith(
                      color: theme.colorScheme.onSecondaryContainer,
                    ),
                  ),
                  Text('${'lbl_detail_photo_id'.tr} ${photo.id}',
                      style: theme.textTheme.bodyMedium!.copyWith(
                        color: theme.colorScheme.onSecondaryContainer,
                      )),
                  Text(
                    '${'lbl_detail_album_id'.tr} ${photo.albumId}',
                    style: theme.textTheme.bodyMedium!.copyWith(
                      color: theme.colorScheme.onSecondaryContainer,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
