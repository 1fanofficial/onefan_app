import 'package:logger/logger.dart';
import 'package:onefan_app/core/network/dio_client.dart';
import 'package:onefan_app/features/race_calendar/model/response/race_details_response.dart';
import 'package:onefan_app/features/race_calendar/race_calendar_endpoints.dart';

class RaceCalendarService {
  final DioClient _dioClient = DioClient();
  final Logger log = Logger();

  Future<List<RaceDetailsResponse>> getAllRace() async {
    try {
      final response = await _dioClient.get(RaceCalendarEndpoints.getAllRace);
      return parseRaceDetailsList(response.data);
    } catch (e, st) {
      log.e("Error in get all race", error: e, stackTrace: st);
      rethrow;
    }
  }

  Future<RaceDetailsResponse> getRaceById({required String raceId}) async {
    final response = await _dioClient.get(RaceCalendarEndpoints.getRaceById.replaceAll("{ID}", raceId));
    return RaceDetailsResponse.fromJson(response.data);
  }
}
