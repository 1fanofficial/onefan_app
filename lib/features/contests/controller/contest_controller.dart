import 'package:onefan_app/features/contests/model/response/contest_response.dart';
import 'package:onefan_app/features/contests/service/contest_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'contest_controller.g.dart';

@Riverpod(keepAlive: true)
class ContestController extends _$ContestController {
  @override
  FutureOr<List<ContestRespone>> build() async {
    return getContestsByStatus(status: ContestStatus.open.value);
  }

  Future<List<ContestRespone>> getContestsByStatus({required String status}) async {
    state = const AsyncLoading();
    try {
      ContestService contestService = ContestService();
      List<ContestRespone> contests = await contestService.getContestsByStatus(status: status);
      state = AsyncData(contests);
      return contests;
    } catch (e, st) {
      state = AsyncError(e, st);
      rethrow;
    }
  }
}
