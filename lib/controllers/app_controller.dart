import 'package:desafio_carros/contracts/cars_repository.contract.dart';
import 'package:desafio_carros/contracts/http_cliente.contract.dart';
import 'package:desafio_carros/models/api-response_model.dart';
import 'package:desafio_carros/models/cars_models.dart';
import 'package:desafio_carros/store/app.store.dart';

class AppController {
  AppStore _appStore;
  ICarsRepository _iCarsRepository;
  IHttpClient _iHttpCliente;

  AppController(this._iCarsRepository, this._iHttpCliente,
      {AppStore appStore}) {
    _appStore = appStore;
  }

  Future<List<Cars>> getCarsServices() async {
    var apiResponse = await _iHttpCliente.get();

    if (apiResponse.cars.isEmpty) {
      return [];
    }

    for (var i = 0; i < apiResponse.cars.length; i++) {
      await _iCarsRepository.saveCar(apiResponse.cars[i]);
    }
    return apiResponse.cars;
  }

  Future<int> saveCar(Cars car) async {
    var idCar = await _iCarsRepository.saveCar(car);
    return idCar;
  }

  Future<void> getAllCars() async {
    _appStore.isLoading = true;
    var allCars = await _iCarsRepository.getCars();
    if (allCars.isEmpty) {
      await getCarsServices();
    }

    if (allCars.length > _appStore.cars.length) {
      _appStore.setAllCars(allCars);
    }

    _appStore.isLoading = false;
  }

  Future<bool> deleteCar(int id) async {
    var deleted = await _iCarsRepository.deleteCar(id);
    if (!deleted) {
      return false;
    }
    return true;
  }

  Future<bool> updateCar(Cars car) async {
    var upDated = await _iCarsRepository.updateCar(car);
    if (!upDated) {
      return false;
    }
    return true;
  }

  void setImagePath(String path) {
    _appStore.setImagePath(path);
  }
}
