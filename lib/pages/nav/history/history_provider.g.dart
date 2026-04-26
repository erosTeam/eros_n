// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'history_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(HistoryNotifier)
final historyProvider = HistoryNotifierProvider._();

final class HistoryNotifierProvider
    extends $NotifierProvider<HistoryNotifier, ListViewState> {
  HistoryNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'historyProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$historyNotifierHash();

  @$internal
  @override
  HistoryNotifier create() => HistoryNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ListViewState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ListViewState>(value),
    );
  }
}

String _$historyNotifierHash() => r'308722e8232fffef80b34fb04b2e17cdd92d89d5';

abstract class _$HistoryNotifier extends $Notifier<ListViewState> {
  ListViewState build();
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
    element.handleCreate(ref, build);
  }
}

@ProviderFor(HistoryGallerys)
final historyGallerysProvider = HistoryGallerysProvider._();

final class HistoryGallerysProvider
    extends $NotifierProvider<HistoryGallerys, List<GalleryHistory>> {
  HistoryGallerysProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'historyGallerysProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$historyGallerysHash();

  @$internal
  @override
  HistoryGallerys create() => HistoryGallerys();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<GalleryHistory> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<GalleryHistory>>(value),
    );
  }
}

String _$historyGallerysHash() => r'0b4729dc38a3f188896e648b80834495e70594f7';

abstract class _$HistoryGallerys extends $Notifier<List<GalleryHistory>> {
  List<GalleryHistory> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<List<GalleryHistory>, List<GalleryHistory>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<List<GalleryHistory>, List<GalleryHistory>>,
              List<GalleryHistory>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

@ProviderFor(filteredHistoryGallerys)
final filteredHistoryGallerysProvider = FilteredHistoryGallerysProvider._();

final class FilteredHistoryGallerysProvider
    extends
        $FunctionalProvider<
          List<GalleryHistory>,
          List<GalleryHistory>,
          List<GalleryHistory>
        >
    with $Provider<List<GalleryHistory>> {
  FilteredHistoryGallerysProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'filteredHistoryGallerysProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$filteredHistoryGallerysHash();

  @$internal
  @override
  $ProviderElement<List<GalleryHistory>> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  List<GalleryHistory> create(Ref ref) {
    return filteredHistoryGallerys(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<GalleryHistory> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<GalleryHistory>>(value),
    );
  }
}

String _$filteredHistoryGallerysHash() =>
    r'd74a0bfa7c637f2896a3d58665a14f16ec82e4c5';

@ProviderFor(SearchKey)
final searchKeyProvider = SearchKeyProvider._();

final class SearchKeyProvider extends $NotifierProvider<SearchKey, String> {
  SearchKeyProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'searchKeyProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$searchKeyHash();

  @$internal
  @override
  SearchKey create() => SearchKey();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(String value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<String>(value),
    );
  }
}

String _$searchKeyHash() => r'3fb7bd1b619a707cd3f4eb2dd2601d2bfa2de22a';

abstract class _$SearchKey extends $Notifier<String> {
  String build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<String, String>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<String, String>,
              String,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
