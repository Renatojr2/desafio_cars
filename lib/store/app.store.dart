import 'package:desafio_carros/models/cars_models.dart';
import 'package:mobx/mobx.dart';
part 'app.store.g.dart';

class AppStore = _AppStore with _$AppStore;

abstract class _AppStore with Store {
  @observable
  bool isLoading = false;

  @observable
  String file = '';

  @action
  void setImagePath(String path) {
    file = path;
  }

  ObservableList<Cars> cars = ObservableList<Cars>();

  @action
  void setAllCars(List<Cars> allCars) {
    cars.addAll(allCars.asObservable());
  }
}
