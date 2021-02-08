class Cars {
  int id;
  String model;
  String brand;
  int year;
  int price;
  String photo;

  Cars({
    this.id,
    this.model,
    this.brand,
    this.year,
    this.price,
    this.photo,
  });

  Cars.fromJson(Map<String, dynamic> json) {
    id = json['car_id'];
    model = json['model'];
    brand = json['brand'];
    year = json['year'];
    price = json['price'];
    photo = json['photo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['car_id'] = this.id;
    data['model'] = this.model;
    data['brand'] = this.brand;
    data['year'] = this.year;
    data['price'] = this.price;
    data['photo'] = this.photo;
    return data;
  }

  @override
  String toString() {
    return '$id -- $brand -- $model -- $price -- $year';
  }
}
