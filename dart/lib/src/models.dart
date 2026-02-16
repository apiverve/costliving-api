/// Response models for the Cost of Living API.

/// API Response wrapper.
class CostlivingResponse {
  final String status;
  final dynamic error;
  final CostlivingData? data;

  CostlivingResponse({
    required this.status,
    this.error,
    this.data,
  });

  factory CostlivingResponse.fromJson(Map<String, dynamic> json) => CostlivingResponse(
    status: json['status'] as String? ?? '',
    error: json['error'],
    data: json['data'] != null ? CostlivingData.fromJson(json['data']) : null,
  );

  Map<String, dynamic> toJson() => {
    'status': status,
    if (error != null) 'error': error,
    if (data != null) 'data': data,
  };
}

/// Response data for the Cost of Living API.

class CostlivingData {
  CostlivingDataFrom? from;
  CostlivingDataTo? to;
  CostlivingDataComparison? comparison;

  CostlivingData({
    this.from,
    this.to,
    this.comparison,
  });

  factory CostlivingData.fromJson(Map<String, dynamic> json) => CostlivingData(
      from: json['from'] != null ? CostlivingDataFrom.fromJson(json['from']) : null,
      to: json['to'] != null ? CostlivingDataTo.fromJson(json['to']) : null,
      comparison: json['comparison'] != null ? CostlivingDataComparison.fromJson(json['comparison']) : null,
    );
}

class CostlivingDataFrom {
  String? searchedLocation;
  String? region;
  String? regionName;
  int? costIndex;

  CostlivingDataFrom({
    this.searchedLocation,
    this.region,
    this.regionName,
    this.costIndex,
  });

  factory CostlivingDataFrom.fromJson(Map<String, dynamic> json) => CostlivingDataFrom(
      searchedLocation: json['searchedLocation'],
      region: json['region'],
      regionName: json['regionName'],
      costIndex: json['costIndex'],
    );
}

class CostlivingDataTo {
  String? searchedLocation;
  String? region;
  String? regionName;
  int? costIndex;

  CostlivingDataTo({
    this.searchedLocation,
    this.region,
    this.regionName,
    this.costIndex,
  });

  factory CostlivingDataTo.fromJson(Map<String, dynamic> json) => CostlivingDataTo(
      searchedLocation: json['searchedLocation'],
      region: json['region'],
      regionName: json['regionName'],
      costIndex: json['costIndex'],
    );
}

class CostlivingDataComparison {
  double? costDifference;
  String? direction;
  CostlivingDataComparisonSalaryequivalent? salaryEquivalent;

  CostlivingDataComparison({
    this.costDifference,
    this.direction,
    this.salaryEquivalent,
  });

  factory CostlivingDataComparison.fromJson(Map<String, dynamic> json) => CostlivingDataComparison(
      costDifference: json['costDifference'],
      direction: json['direction'],
      salaryEquivalent: json['salaryEquivalent'] != null ? CostlivingDataComparisonSalaryequivalent.fromJson(json['salaryEquivalent']) : null,
    );
}

class CostlivingDataComparisonSalaryequivalent {
  String? description;
  int? fromSalary;
  int? equivalentSalary;

  CostlivingDataComparisonSalaryequivalent({
    this.description,
    this.fromSalary,
    this.equivalentSalary,
  });

  factory CostlivingDataComparisonSalaryequivalent.fromJson(Map<String, dynamic> json) => CostlivingDataComparisonSalaryequivalent(
      description: json['description'],
      fromSalary: json['fromSalary'],
      equivalentSalary: json['equivalentSalary'],
    );
}

class CostlivingRequest {
  String? location;
  String? compare;

  CostlivingRequest({
    this.location,
    this.compare,
  });

  Map<String, dynamic> toJson() => {
      if (location != null) 'location': location,
      if (compare != null) 'compare': compare,
    };
}
