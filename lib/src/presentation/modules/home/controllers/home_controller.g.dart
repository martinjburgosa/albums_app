// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$homeControllerHash() => r'9910818ba5744360a6405157921e055754a8b517';

/// See also [HomeController].
@ProviderFor(HomeController)
final homeControllerProvider =
    AutoDisposeAsyncNotifierProvider<HomeController, List<PhotoDto>>.internal(
  HomeController.new,
  name: r'homeControllerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$homeControllerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$HomeController = AutoDisposeAsyncNotifier<List<PhotoDto>>;
String _$listPaginationControllerHash() =>
    r'e9501d676143ce453974c99c43419fb537086768';

/// See also [ListPaginationController].
@ProviderFor(ListPaginationController)
final listPaginationControllerProvider =
    NotifierProvider<ListPaginationController, int>.internal(
  ListPaginationController.new,
  name: r'listPaginationControllerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$listPaginationControllerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ListPaginationController = Notifier<int>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
