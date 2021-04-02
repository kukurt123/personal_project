import 'dart:async';

Future<String> imageUrlAsFuture(String url) {
  var complete = new Completer();
  complete.complete(url);
  return complete.future.then((t) => t.toString());
}
