// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(SearchGallerys)
final searchGallerysProvider = SearchGallerysFamily._();

final class SearchGallerysProvider
    extends $NotifierProvider<SearchGallerys, List<Gallery>> {
  SearchGallerysProvider._({
    required SearchGallerysFamily super.from,
    required int super.argument,
  }) : super(
         retry: null,
         name: r'searchGallerysProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$searchGallerysHash();

  @override
  String toString() {
    return r'searchGallerysProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  SearchGallerys create() => SearchGallerys();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<Gallery> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<Gallery>>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is SearchGallerysProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$searchGallerysHash() => r'ffe501b7eaf4b73757b3374cb6c0bc82562b8c70';

final class SearchGallerysFamily extends $Family
    with
        $ClassFamilyOverride<
          SearchGallerys,
          List<Gallery>,
          List<Gallery>,
          List<Gallery>,
          int
        > {
  SearchGallerysFamily._()
    : super(
        retry: null,
        name: r'searchGallerysProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  SearchGallerysProvider call(int depth) =>
      SearchGallerysProvider._(argument: depth, from: this);

  @override
  String toString() => r'searchGallerysProvider';
}

abstract class _$SearchGallerys extends $Notifier<List<Gallery>> {
  late final _$args = ref.$arg as int;
  int get depth => _$args;

  List<Gallery> build(int depth);
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<List<Gallery>, List<Gallery>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<List<Gallery>, List<Gallery>>,
              List<Gallery>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, () => build(_$args));
  }
}

@ProviderFor(SearchNotifier)
final searchProvider = SearchNotifierFamily._();

final class SearchNotifierProvider
    extends $NotifierProvider<SearchNotifier, ListViewState> {
  SearchNotifierProvider._({
    required SearchNotifierFamily super.from,
    required int super.argument,
  }) : super(
         retry: null,
         name: r'searchProvider',
         isAutoDispose: false,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$searchNotifierHash();

  @override
  String toString() {
    return r'searchProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  SearchNotifier create() => SearchNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ListViewState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ListViewState>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is SearchNotifierProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$searchNotifierHash() => r'dd92bb217f0b7544b996f868cb307bd70f21fad3';

final class SearchNotifierFamily extends $Family
    with
        $ClassFamilyOverride<
          SearchNotifier,
          ListViewState,
          ListViewState,
          ListViewState,
          int
        > {
  SearchNotifierFamily._()
    : super(
        retry: null,
        name: r'searchProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: false,
      );

  SearchNotifierProvider call(int depth) =>
      SearchNotifierProvider._(argument: depth, from: this);

  @override
  String toString() => r'searchProvider';
}

abstract class _$SearchNotifier extends $Notifier<ListViewState> {
  late final _$args = ref.$arg as int;
  int get depth => _$args;

  ListViewState build(int depth);
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<ListViewState, ListViewState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<ListViewState, ListViewState>,
              ListViewState,
              Object?,
              Object?
            >;
    element.handleCreate(ref, () => build(_$args));
  }
}
