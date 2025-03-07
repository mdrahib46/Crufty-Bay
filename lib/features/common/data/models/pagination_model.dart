import 'package:cruftybay/features/common/data/models/from_json_contract.dart';

class PaginationModel<T extends FromJsonContract> {
  List<T>? results;
  int? total;
  int? firstPage;
  int? previous;
  int? next;
  int? lastPage;

  PaginationModel({
    this.results,
    this.total,
    this.firstPage,
    this.previous,
    this.next,
    this.lastPage,
  });

  factory PaginationModel.fromJson(
    Map<String, dynamic> json,
    T Function(Map<String, dynamic>) fromJson,
  ) {
    return PaginationModel<T>(
      results: json['results'] != null ? List<T>.from(json['results'].map((v) => fromJson(v))) : null,
      total: json['total'],
      firstPage: json['first_page'],
      previous: json['previous'],
      next: json['next'],
      lastPage: json['last_page'],
    );
  }
// Map<String, dynamic> toJson() {
//   final Map<String, dynamic> data = <String, dynamic>{};
//   if (results != null) {
//     data['results'] = results!.map((v) => v.toJson()).toList();
//   }
//   data['total'] = total;
//   data['first_page'] = firstPage;
//   data['previous'] = previous;
//   data['next'] = next;
//   data['last_page'] = lastPage;
//   return data;
// }
}
