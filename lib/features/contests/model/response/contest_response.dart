import 'package:freezed_annotation/freezed_annotation.dart';

part 'contest_response.g.dart';
part 'contest_response.freezed.dart';

enum ContestStatus {
  open(value: "OPEN"),
  live(value: "LIVE"),
  completed(value: "COMPLETED");

  const ContestStatus({required this.value});
  final String value;
}

List<ContestRespone> parceContestsList(List<dynamic> jsonList) {
  return jsonList.map((json) => ContestRespone.fromJson(json as Map<String, dynamic>)).toList();
}

@freezed
class ContestRespone with _$ContestRespone {
  const factory ContestRespone({
    required String id,
    required String contestName,
    required String raceName,
    required int entryFees,
    required DateTime deadline,
    required int prizePool,
    required int entries,
    required int maxEntries,
    required String status,
    required bool hasJoined,
  }) = _ContestDetailsResponse;

  factory ContestRespone.fromJson(Map<String, dynamic> json) => _$ContestResponeFromJson(json);
}
