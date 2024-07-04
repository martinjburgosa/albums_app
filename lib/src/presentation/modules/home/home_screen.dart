import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';

import '../../../application/dtos/photo_dto.dart';
import '../../../common/failure.dart';
import '../../common/extensions/failures.dart';
import 'controllers/home_controller.dart';
import 'local_widgets/custom_list_tile.dart';
import 'local_widgets/error_container.dart';

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
          title: Text('lbl_home_title'.tr),
          backgroundColor: theme.colorScheme.primary,
        ),
        body: SafeArea(
          child: list.when(
            loading: () => const Center(
              child: CircularProgressIndicator(),
            ),
            error: (f, _) => ErrorContainer(
              size: Size(screenSize.width * 0.75, screenSize.height * 0.5),
              message: (f as Failure).message ?? (f).tr,
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

    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        ref.read(homeControllerProvider.notifier).loadPhotos();
      }
    });

    final width = screenSize.width;
    final height = screenSize.height;
    const dotZeroTwo = 0.02;

    final containerSpacing = EdgeInsets.symmetric(
      vertical: height * 0.03,
      horizontal: width * dotZeroTwo,
    );

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          padding: EdgeInsets.symmetric(
            horizontal: screenSize.longestSide * dotZeroTwo,
            vertical: screenSize.longestSide * 0.004,
          ),
          decoration: BoxDecoration(
            color: theme.colorScheme.secondaryContainer,
            borderRadius: BorderRadius.circular(height * dotZeroTwo),
            border: Border.all(
              color: theme.colorScheme.primary,
              width: 0.2,
            ),
          ),
          child: Text(
            '${'lbl_home_total_elements'.tr} ${photos.length}',
            style: theme.textTheme.headlineSmall!
                .copyWith(color: theme.colorScheme.onSecondaryContainer),
          ),
        ),
        Container(
          height: height * 0.6,
          margin: containerSpacing,
          padding: containerSpacing,
          decoration: BoxDecoration(
            color: theme.cardColor,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: theme.colorScheme.primary,
              width: 0.2,
            ),
          ),
          child: Scrollbar(
            thickness: 7.5,
            radius: Radius.circular(height * dotZeroTwo),
            child: ListView.builder(
              controller: scrollController,
              itemCount: photos.length,
              padding: EdgeInsets.symmetric(
                vertical: height * dotZeroTwo,
                horizontal: width * dotZeroTwo,
              ),
              itemBuilder: (context, index) {
                final item = photos[index];
                return CustomListTile(
                  theme: theme,
                  item: item,
                  ref: ref,
                  screenSize: screenSize,
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
