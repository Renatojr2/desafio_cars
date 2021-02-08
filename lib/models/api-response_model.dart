import 'cars_models.dart';

class ApiResponse {
  bool success;
  String message;
  List<Cars> cars;

  ApiResponse({this.success, this.message, this.cars});

  ApiResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    if (json['cars'] != null) {
      cars = [];
      json['cars'].forEach((c) {
        cars.add(Cars.fromJson(c));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['message'] = this.message;
    if (this.cars != null) {
      data['cars'] = this.cars.map((c) => c.toJson()).toList();
    }
    return data;
  }

  // @override
  //   String toString() {
  //     return '${cars.id} -- $'
  //   }
}
