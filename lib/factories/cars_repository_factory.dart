import 'package:desafio_carros/contracts/cars_repository.contract.dart';
import 'package:desafio_carros/infra/dataBase.dart';
import 'package:desafio_carros/repositories/cars_reposytory.dart';

class RepositoryFactory {
  static ICarsRepository carsRepository() {
    return CarsRepository(DbSQLite());
  }
}
