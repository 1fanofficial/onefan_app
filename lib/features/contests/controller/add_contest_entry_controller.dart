import 'package:onefan_app/features/contests/service/contest_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'add_contest_entry_controller.g.dart';

@riverpod
class AddContestEntryController extends _$AddContestEntryController {
  @override
  FutureOr<void> build() {}

  Future<void> addContestEntry({required Map<String, dynamic> payload}) async {
    state = const AsyncLoading();
    try {
      ContestService contestService = ContestService();
      await contestService.addContestEntry(payload: payload);
      state = const AsyncData(null);
    } catch (e, st) {
      state = AsyncError(e, st);
      rethrow;
    }
  }
}
