import 'package:onefan_app/features/race_calendar/model/response/race_details_response.dart';
import 'package:onefan_app/features/race_calendar/service/race_calendar_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'race_calendar_controller.g.dart';

@Riverpod(keepAlive: true)
class RaceCalendarController extends _$RaceCalendarController {
  final _raceCalendarService = RaceCalendarService();
  List<RaceDetailsResponse> _cachedRaceList = [];

  @override
  Future<List<RaceDetailsResponse>> build() async {
    return _cachedRaceList;
  }

  Future<List<RaceDetailsResponse>> _getAllRace() async {
    if (_cachedRaceList.isNotEmpty) return _cachedRaceList;
    _cachedRaceList = await _raceCalendarService.getAllRace();
    return _cachedRaceList;
  }

  Future<void> refresh() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() => _getAllRace());
  }
}
