const _delay = Duration(milliseconds: 300);
Future<void> wait() => Future.delayed(_delay);

class Page1Repository {
  Future<List<String>> fetchNames() async {
    await wait();
    return ['Kurt', 'Ruzell', 'Estacion'];
  }
}
