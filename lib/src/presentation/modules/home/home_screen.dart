import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';

import '../../../application/dtos/photo_dto.dart';
import '../../../common/failure.dart';
import '../../common/extensions/failures.dart';
import 'controllers/home_controller.dart';
import 'views/detail/controller/detail_controller.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final list = ref.watch(homeControllerProvider);
    final screenSize = MediaQuery.of(context).size;
    final theme = Theme.of(context);
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('lbl_layout_title'.tr),
          backgroundColor: theme.colorScheme.primary,
        ),
        body: SafeArea(
          child: list.when(
            loading: () => const Center(
              child: CircularProgressIndicator(),
            ),
            error: (f, _) => Center(
              child: Text((f as Failure).tr),
            ),
            data: (list) => _HomeContent(
              photos: list,
              screenSize: screenSize,
              theme: theme,
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: theme.colorScheme.primary,
          onPressed: () {
            ref.invalidate(homeControllerProvider);
          },
          child: Icon(
            Icons.refresh,
            color: theme.colorScheme.onPrimary,
          ),
        ));
  }
}

class _HomeContent extends ConsumerWidget {
  const _HomeContent({
    required this.photos,
    required this.screenSize,
    required this.theme,
  });

  final List<PhotoDto> photos;
  final Size screenSize;
  final ThemeData theme;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ScrollController scrollController = ScrollController();
    final isPortrait = screenSize.width < screenSize.height;

    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        ref.read(homeControllerProvider.notifier).loadMorePhotos();
      }
    });

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          padding: EdgeInsets.symmetric(
            horizontal: screenSize.longestSide * 0.02,
            vertical: screenSize.longestSide * 0.004,
          ),
          decoration: BoxDecoration(
            color: theme.colorScheme.secondaryContainer,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: theme.colorScheme.primary,
              width: 0.2,
            ),
          ),
          child: Text(
            'Total de elementos: ${photos.length}',
            style: theme.textTheme.headlineSmall!
                .copyWith(color: theme.colorScheme.onSecondaryContainer),
          ),
        ),
        Container(
          height:
              isPortrait ? screenSize.height * 0.6 : screenSize.height * 0.5,
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          margin: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 30,
          ),
          decoration: BoxDecoration(
            color: theme.cardColor,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: theme.colorScheme.primary,
              width: 0.2,
            ),
          ),
          child: Scrollbar(
            thickness: 7.5,
            radius: const Radius.circular(10),
            child: ListView.builder(
              controller: scrollController,
              itemCount: photos.length,
              padding: const EdgeInsets.symmetric(vertical: 30),
              itemBuilder: (context, index) {
                final item = photos[index];
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
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
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
                      style: theme.textTheme.titleSmall!
                          .copyWith(color: theme.primaryColor),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
