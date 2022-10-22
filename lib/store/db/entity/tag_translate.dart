import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:isar/isar.dart';

part 'tag_translate.g.dart';

@CopyWith()
@Collection()
class TagTranslate {
  TagTranslate({
    required this.namespace,
    required this.name,
    this.translateName,
    this.intro,
    this.links,
  }) : id = Isar.autoIncrement;
  Id id;
  @Index()
  final String namespace;
  @Index(composite: [CompositeIndex('namespace')], unique: true, replace: true)
  @Index()
  final String name;
  @Index()
  final String? translateName;
  final String? intro;
  final String? links;

  String? get translateNameNotMD {
    final reg = RegExp(r'!\[(\S+)?\]\(.+?\)(\S+)');
    final match = reg.allMatches(translateName ?? '');
    if (match.isNotEmpty) {
      return translateName?.replaceAllMapped(
              reg, (match) => match.group(2) ?? '') ??
          translateName;
    } else {
      return translateName;
    }
  }

  @override
  String toString() {
    return 'TagTranslate{namespace: $namespace, name: $name, translateName: $translateName, intro: $intro, links: $links}';
  }
}
