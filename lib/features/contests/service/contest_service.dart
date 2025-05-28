import 'package:logger/logger.dart';
import 'package:onefan_app/core/network/dio_client.dart';
import 'package:onefan_app/features/contests/contest_endpoints.dart';
import 'package:onefan_app/features/contests/model/response/contest_response.dart';
import 'package:onefan_app/features/contests/model/response/race_driver_response.dart';

class ContestService {
  final _dioClient = DioClient();
  final Logger log = Logger();

  Future<List<ContestRespone>> getContestsByStatus({required String status}) async {
    try {
      final response = await _dioClient.get(ContestEndpoints.getContestsByStatus.replaceAll("{STATUS}", status));
      return parceContestsList(response.data);
    } catch (e, st) {
      log.e("Error in gettting contests by status", error: e, stackTrace: st);
      rethrow;
    }
  }

  Future<List<RaceDriverResponse>> getDriversForRace({required String raceId}) async {
    try {
      final response = await _dioClient.get(ContestEndpoints.getDriversByRace.replaceAll("{RACEID}", raceId));
      return parceRaceDriversList(response.data);
    } catch (e, st) {
      log.e("Error in getting race drivers", error: e, stackTrace: st);
      rethrow;
    }
  }

  Future<void> addContestEntry({required Map<String, dynamic> payload}) async {
    try {
      await _dioClient.post(path: ContestEndpoints.addContestEntry, payload: payload);
    } catch (e, st) {
      log.e("Error in getting race drivers", error: e, stackTrace: st);
      rethrow;
    }
  }
}
