import 'package:desafio_carros/models/cars_models.dart';

abstract class ICarsRepository {
  Future<List<Cars>> getCars();
  Future<int> saveCar(Cars car);

  Future<bool> updateCar(Cars car);
  Future<bool> deleteCar(int id);
}
