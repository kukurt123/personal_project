class APIPath {
  static String request(String uid, String jobId) =>
      'users/$uid/request/$jobId';

  static String requests(String uid) => 'users/$uid/request';

  static String entry(String uid, String entryId) =>
      'users/$uid/entries/$entryId';

  static String entries(String uid) => 'users/$uid/entries';
}
