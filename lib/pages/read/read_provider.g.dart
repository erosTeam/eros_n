// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'read_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(ReadNotifier)
final readProvider = ReadNotifierProvider._();

final class ReadNotifierProvider
    extends $NotifierProvider<ReadNotifier, ReadState> {
  ReadNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'readProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$readNotifierHash();

  @$internal
  @override
  ReadNotifier create() => ReadNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ReadState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ReadState>(value),
    );
  }
}

String _$readNotifierHash() => r'96280a85b5441736af90b0a72cd1200ccbc6b88f';

abstract class _$ReadNotifier extends $Notifier<ReadState> {
  ReadState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<ReadState, ReadState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<ReadState, ReadState>,
              ReadState,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
