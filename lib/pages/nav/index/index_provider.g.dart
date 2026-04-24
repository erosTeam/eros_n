// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'index_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(IndexNotifier)
final indexProvider = IndexNotifierProvider._();

final class IndexNotifierProvider
    extends $NotifierProvider<IndexNotifier, IndexState> {
  IndexNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'indexProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$indexNotifierHash();

  @$internal
  @override
  IndexNotifier create() => IndexNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(IndexState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<IndexState>(value),
    );
  }
}

String _$indexNotifierHash() => r'918fcb3f9bc98434cabdef157f11ac88be8a9263';

abstract class _$IndexNotifier extends $Notifier<IndexState> {
  IndexState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<IndexState, IndexState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<IndexState, IndexState>,
              IndexState,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
