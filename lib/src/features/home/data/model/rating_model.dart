import 'package:apitest/src/features/home/domain/entity/rating_entity.dart';

class RatingModel extends RatingEntity {
  const RatingModel({required super.rate, required super.count});

  factory RatingModel.fromJson(Map<String, dynamic> json) {
    return RatingModel(
      rate: (json['rate'] as num).toDouble(),
      count: json['count'] as int,
    );
  }

  factory RatingModel.fromEntity(RatingEntity entity) {
    return RatingModel(rate: entity.rate, count: entity.count);
  }

  Map<String, dynamic> toJson() {
    return {'rate': rate, 'count': count};
  }
}
