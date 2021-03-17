class RequestFirebaseApi {
  static String request(String uid, String jobId) =>
      'users/$uid/request/$jobId';
  static String requests(String uid) => 'users/$uid/request';
}

class LocationFirebaseApi {
  static String request(String uid, String jobId) =>
      'users/$uid/location/$jobId';

  static String requests(String uid) => 'users/$uid/location';
}
