import 'package:onefan_app/features/contests/model/response/race_driver_response.dart';
import 'package:onefan_app/features/contests/service/contest_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'drivers_controller.g.dart';

@Riverpod()
class DriversController extends _$DriversController {
  @override
  FutureOr<void> build() {}

  Future<List<RaceDriverResponse>> getDriversForRace({required String raceId}) async {
    state = const AsyncLoading();
    try {
      ContestService contestService = ContestService();
      List<RaceDriverResponse> drivers = await contestService.getDriversForRace(raceId: raceId);
      state = const AsyncData(null);
      return drivers;
    } catch (e, st) {
      state = AsyncError(e, st);
      rethrow;
    }
  }
}
