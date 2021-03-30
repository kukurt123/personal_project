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

class ChatFirebaseApi {
  static String chat(String uid, String id) => 'chat/$uid/$id';
  static String chats(String uid) => 'chat/$uid';
}

class UserFirebaseApi {
  static String user(String id) => 'users/$id';
  static String users = 'users';
}
