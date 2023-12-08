import 'dart:convert';
import 'package:http/http.dart' as http;

class DirectionsService {
  DirectionsService();

  Future<Map<String, dynamic>> getDirections(String origin, List<String?> stops,
      String destination, String apiKey) async {
    var waypoints = stops.where((stop) => stop != null).toList();

    var waypointsParam =
        waypoints.isNotEmpty ? '&waypoints=${waypoints.join('|')}' : '';

    var url =
        'https://maps.googleapis.com/maps/api/directions/json?origin=$origin&destination=$destination$waypointsParam&key=$apiKey';

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      Map<String, dynamic> data = json.decode(response.body);

      if (data['status'] == 'OK') {
        List<dynamic> routes = data['routes'];
        if (routes.isNotEmpty) {
          Map<String, dynamic> route = routes[0];
          Map<String, dynamic> legs = route['legs'][0];

          // Total distance in meters
          int totalDistance = legs['distance']['value'];

          // Total duration in seconds
          int totalDuration = legs['duration']['value'];

          return {
            'distance': totalDistance / 1609.34, // Convert meters to miles
            'duration': totalDuration / 60, // Convert seconds to minutes
          };
        }
      }
    }

    return {'distance': 0, 'duration': 0};
  }
}
