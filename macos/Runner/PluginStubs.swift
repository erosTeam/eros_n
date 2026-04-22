// Workaround: system_network_proxy_macos declares pluginClass: none (Dart-only plugin).
// Flutter's code generator incorrectly emits `none.register(...)` instead of skipping it.
// This stub satisfies the generated call without registering any native code.
import FlutterMacOS

struct none {
    static func register(with registrar: FlutterPluginRegistrar) {
        // intentionally empty: no native macOS plugin class
    }
}
