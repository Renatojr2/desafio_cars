import 'package:desafio_carros/contracts/cars_repository.contract.dart';
import 'package:desafio_carros/infra/dataBase.dart';
import 'package:desafio_carros/models/cars_models.dart';

class CarsRepository implements ICarsRepository {
  DbSQLite _db;

  CarsRepository(this._db);

  @override
  Future<List<Cars>> getCars() async {
    final instance = await _db.getInstance();
    var carDb = await instance.query('cars');
    var cars = carDb.map((car) => Cars.fromJson(car)).toList();
    print('db');
    print('db $cars');
    return cars;
  }

  @override
  Future<int> saveCar(Cars car) async {
    final instance = await _db.getInstance();
    final idCar = await instance.insert('cars', car.toJson());
    print('dbSave $idCar');
    return idCar;
  }

  @override
  Future<bool> updateCar(Cars car) async {
    final instance = await _db.getInstance();
    final effects = await instance
        .update('cars', car.toJson(), where: 'car_id = ?', whereArgs: [car.id]);
    return effects > 0;
  }

  @override
  Future<bool> deleteCar(int id) async {
    final instance = await _db.getInstance();
    var effects = await instance.delete(
      'cars',
      where: 'car_id = ?',
      whereArgs: [id],
    );

    return effects > 0;
  }
}
