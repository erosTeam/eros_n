// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'download_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(DownloadNotifier)
final downloadProvider = DownloadNotifierProvider._();

final class DownloadNotifierProvider
    extends $NotifierProvider<DownloadNotifier, Map<int, DownloadTask>> {
  DownloadNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'downloadProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$downloadNotifierHash();

  @$internal
  @override
  DownloadNotifier create() => DownloadNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Map<int, DownloadTask> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Map<int, DownloadTask>>(value),
    );
  }
}

String _$downloadNotifierHash() => r'd693edf7e34a6c59f6aea364b16f034502a533b6';

abstract class _$DownloadNotifier extends $Notifier<Map<int, DownloadTask>> {
  Map<int, DownloadTask> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref =
        this.ref as $Ref<Map<int, DownloadTask>, Map<int, DownloadTask>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<Map<int, DownloadTask>, Map<int, DownloadTask>>,
              Map<int, DownloadTask>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
