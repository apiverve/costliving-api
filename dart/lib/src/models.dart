/// Response models for the Cost of Living API.

/// API Response wrapper.
class CostlivingResponse {
  final String status;
  final dynamic error;
  final CostlivingData? data;

  /// Set only when the current plan locks one or more fields; null otherwise.
  final PremiumInfo? premium;

  CostlivingResponse({
    required this.status,
    this.error,
    this.data,
    this.premium,
  });

  factory CostlivingResponse.fromJson(Map<String, dynamic> json) => CostlivingResponse(
    status: json['status'] as String? ?? '',
    error: json['error'],
    data: json['data'] != null ? CostlivingData.fromJson(json['data']) : null,
    premium: json['premium'] != null ? PremiumInfo.fromJson(json['premium']) : null,
  );

  Map<String, dynamic> toJson() => {
    'status': status,
    if (error != null) 'error': error,
    if (data != null) 'data': data,
    if (premium != null) 'premium': premium!.toJson(),
  };
}

/// Describes fields the current plan does not unlock. Locked fields arrive as null
/// in [data], and [lockedFields] names them (nested ones use dot paths).
class PremiumInfo {
  final String? message;
  final String? upgradeUrl;
  final List<String>? lockedFields;

  PremiumInfo({this.message, this.upgradeUrl, this.lockedFields});

  factory PremiumInfo.fromJson(Map<String, dynamic> json) => PremiumInfo(
    message: json['message'] as String?,
    upgradeUrl: json['upgrade_url'] as String?,
    lockedFields: (json['locked_fields'] as List?)?.map((e) => e.toString()).toList(),
  );

  Map<String, dynamic> toJson() => {
    if (message != null) 'message': message,
    if (upgradeUrl != null) 'upgrade_url': upgradeUrl,
    if (lockedFields != null) 'locked_fields': lockedFields,
  };
}

/// Response data for the Cost of Living API.

class CostlivingData {
  String? searchedLocation;
  String? region;
  String? regionName;
  num? costIndex;
  String? description;
  num? cpi;
  num? usAverageCPI;
  String? period;
  String? note;

  CostlivingData({
    this.searchedLocation,
    this.region,
    this.regionName,
    this.costIndex,
    this.description,
    this.cpi,
    this.usAverageCPI,
    this.period,
    this.note,
  });

  factory CostlivingData.fromJson(Map<String, dynamic> json) => CostlivingData(
      searchedLocation: json['searchedLocation'],
      region: json['region'],
      regionName: json['regionName'],
      costIndex: json['costIndex'],
      description: json['description'],
      cpi: json['cpi'],
      usAverageCPI: json['usAverageCPI'],
      period: json['period'],
      note: json['note'],
    );
}

class CostlivingRequest {
  String location;

  CostlivingRequest({
    required this.location,
  });

  Map<String, dynamic> toJson() => {
      'location': location,
    };
}
