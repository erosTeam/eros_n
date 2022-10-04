import 'package:flutter_test/flutter_test.dart';
import 'package:nhentai/nhentai.dart';

void main() {
  final api = API();
  test('api search', () {

  });

  test('get book', () async {
    final Book? book = await api.getBook(177013);
    if (book == null) {
      throw Exception('Something went wrong.');
    }

    // Short book summary
    print(
      'Book: $book\n'
          'Artists: ${book.tags.artists.join(', ')}\n'
          'Languages: ${book.tags.languages.join(', ')}\n'
          'Cover: ${book.cover.getUrl(api: api)}\n'
          'First page: ${book.pages.first.getUrl(api: api)}\n'
          'First page thumbnail: ${book.pages.first.thumbnail.getUrl(
          api: api)}\n',
    );
  });
}