import 'package:desafio_carros/controllers/app_controller.dart';
import 'package:desafio_carros/factories/cars_repository_factory.dart';
import 'package:desafio_carros/factories/cars_service_factory.dart';
import 'package:desafio_carros/store/app.store.dart';

class AppControllerFactory {
  static AppController appController({AppStore appStore}) {
    return AppController(
      RepositoryFactory.carsRepository(),
      HttpFactory.carsService(),
      appStore: appStore,
    );
  }
}
