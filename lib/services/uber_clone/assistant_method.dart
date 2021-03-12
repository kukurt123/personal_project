import 'package:geolocator/geolocator.dart';
import 'package:new_practice/config/maps/config_maps.dart';
import 'package:new_practice/services/uber_clone/request_assistant.dart';

class AssistantMethods {
  static Future<String> searchCoordinateAddress(Position position) async {
    String placeAddress = "";
    String url =
        "https://maps.googleapis.com/maps/api/geocode/json?latlng=${position.latitude},${position.longitude}&key=$mapKey";

    var response = await RequestAssistant.getRequest(url);

    if (response != "failed") {
      placeAddress = response["results"][0]["formatted_address"];
    }

    return placeAddress;
  }
}
