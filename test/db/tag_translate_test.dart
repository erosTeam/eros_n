import 'dart:io';
import 'dart:math';

import 'package:eros_n/store/db/entity/tag_translate.dart';
import 'package:eros_n/store/db/objectbox_helper.dart';
import 'package:flutter_test/flutter_test.dart';

Directory _tmpDir() {
  return Directory(
    '${Directory.systemTemp.path}/objectbox_test_${Random().nextInt(999999)}',
  );
}

TagTranslate _makeTag({
  required String name,
  required String namespace,
  String? translateName,
  int lastUseTime = 0,
}) => TagTranslate(
  name: name,
  namespace: namespace,
  translateName: translateName,
  lastUseTime: lastUseTime,
);

void main() {
  late ObjectBoxHelper helper;
  late Directory dir;

  setUp(() async {
    dir = _tmpDir();
    dir.createSync(recursive: true);
    helper = ObjectBoxHelper();
    await helper.init(path: dir.path);
  });

  tearDown(() {
    helper.close();
    if (dir.existsSync()) {
      dir.deleteSync(recursive: true);
    }
  });

  group('TagTranslate CRUD', () {
    test('findTagTranslate returns null when store is empty', () {
      expect(helper.findTagTranslate('nonexistent'), isNull);
    });

    test('putAllTagTranslate persists multiple tags', () async {
      final tags = [
        _makeTag(name: 'full color', namespace: 'tag', translateName: '全彩'),
        _makeTag(name: 'glasses', namespace: 'tag', translateName: '眼鏡'),
        _makeTag(name: 'naruto', namespace: 'parody', translateName: '火影忍者'),
      ];
      await helper.putAllTagTranslate(tags);
      final namespaces = await helper.findAllTagNamespace();
      expect(namespaces, containsAll(['tag', 'parody']));
    });

    test('findTagTranslate finds by name and namespace', () async {
      await helper.putAllTagTranslate([
        _makeTag(name: 'glasses', namespace: 'tag', translateName: '眼鏡'),
      ]);
      final result = helper.findTagTranslate('glasses', namespace: 'tag');
      expect(result, isNotNull);
      expect(result!.translateName, '眼鏡');
    });

    test(
      'findTagTranslate excludes rows namespace when no namespace given',
      () async {
        await helper.putAllTagTranslate([
          _makeTag(name: 'glasses', namespace: 'tag'),
          _makeTag(name: 'glasses', namespace: 'rows'),
        ]);
        final result = helper.findTagTranslate('glasses');
        expect(result, isNotNull);
        expect(result!.namespace, isNot('rows'));
      },
    );

    test(
      'putAllTagTranslate upserts by name+namespace composite key',
      () async {
        await helper.putAllTagTranslate([
          _makeTag(
            name: 'glasses',
            namespace: 'tag',
            translateName: 'Original',
          ),
        ]);
        // Put same name+namespace again with updated translation
        await helper.putAllTagTranslate([
          _makeTag(name: 'glasses', namespace: 'tag', translateName: 'Updated'),
        ]);
        final result = helper.findTagTranslate('glasses', namespace: 'tag');
        expect(result!.translateName, 'Updated');
        // Should still be one record (upsert, not duplicate)
        final all = await helper.findTagTranslateContains('glasses', 10);
        expect(all.length, 1);
      },
    );

    test('findTagTranslateContains matches by name', () async {
      await helper.putAllTagTranslate([
        _makeTag(name: 'full color', namespace: 'tag'),
        _makeTag(name: 'glasses', namespace: 'tag'),
      ]);
      final results = await helper.findTagTranslateContains('color', 10);
      expect(results.length, 1);
      expect(results.first.name, 'full color');
    });

    test('findTagTranslateContains matches by translateName', () async {
      await helper.putAllTagTranslate([
        _makeTag(name: 'full color', namespace: 'tag', translateName: '全彩'),
        _makeTag(name: 'glasses', namespace: 'tag', translateName: '眼鏡'),
      ]);
      final results = await helper.findTagTranslateContains('全', 10);
      expect(results.length, 1);
      expect(results.first.name, 'full color');
    });

    test('findTagTranslateContains excludes rows namespace', () async {
      await helper.putAllTagTranslate([
        _makeTag(name: 'test', namespace: 'tag'),
        _makeTag(name: 'test', namespace: 'rows'),
      ]);
      final results = await helper.findTagTranslateContains('test', 10);
      expect(results.every((t) => t.namespace != 'rows'), isTrue);
    });

    test('findTagTranslateContains respects limit', () async {
      final tags = List.generate(
        10,
        (i) => _makeTag(name: 'tag$i', namespace: 'tag'),
      );
      await helper.putAllTagTranslate(tags);
      final results = await helper.findTagTranslateContains('tag', 3);
      expect(results.length, lessThanOrEqualTo(3));
    });

    test('deleteAllTagTranslate clears all records', () async {
      await helper.putAllTagTranslate([
        _makeTag(name: 'a', namespace: 'tag'),
        _makeTag(name: 'b', namespace: 'parody'),
      ]);
      await helper.deleteAllTagTranslate();
      final results = await helper.findTagTranslateContains('', 100);
      expect(results, isEmpty);
    });

    test('findAllTagNamespace returns distinct namespaces', () async {
      await helper.putAllTagTranslate([
        _makeTag(name: 'a', namespace: 'tag'),
        _makeTag(name: 'b', namespace: 'tag'),
        _makeTag(name: 'c', namespace: 'parody'),
      ]);
      final namespaces = await helper.findAllTagNamespace();
      expect(namespaces.toSet(), {'tag', 'parody'});
    });

    test('translateNameNotMD strips markdown image syntax', () {
      final t = _makeTag(
        name: 'test',
        namespace: 'tag',
        translateName: '![img](http://example.com/img.png)suffix',
      );
      expect(t.translateNameNotMD, 'suffix');
    });
  });
}
