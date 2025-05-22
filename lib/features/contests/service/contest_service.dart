import 'package:logger/logger.dart';
import 'package:onefan_app/core/network/dio_client.dart';
import 'package:onefan_app/features/contests/contest_endpoints.dart';
import 'package:onefan_app/features/contests/model/response/contest_response.dart';

class ContestService {
  final _dioClient = DioClient();
  final Logger log = Logger();

  Future<List<ContestRespone>> getContestsByStatus({required String status}) async {
    try {
      final response = await _dioClient.get(ContestEndpoints.getContestsByStatus.replaceAll("{STATUS}", status));
      return parceContestsList(response.data);
    } catch (e, st) {
      log.e("Error in get contests by status", error: e, stackTrace: st);
      rethrow;
    }
  }
}
