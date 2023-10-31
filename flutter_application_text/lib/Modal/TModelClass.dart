import 'dart:convert';

class ModelClass {
  String country;
  String region;
  ModelClass({
    required this.country,
    required this.region,
  });

  ModelClass copyWith({
    String? country,
    String? region,
  }) {
    return ModelClass(
      country: country ?? this.country,
      region: region ?? this.region,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'country': country,
      'region': region,
    };
  }

  factory ModelClass.fromMap(Map<String, dynamic> map) {
    return ModelClass(
      country: map['country'] as String,
      region: map['region'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ModelClass.fromJson(String source) =>
      ModelClass.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'ModelClass(country: $country, region: $region)';

  @override
  bool operator ==(covariant ModelClass other) {
    if (identical(this, other)) return true;

    return other.country == country && other.region == region;
  }

  @override
  int get hashCode => country.hashCode ^ region.hashCode;
}