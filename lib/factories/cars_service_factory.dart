import 'package:desafio_carros/contracts/http_cliente.contract.dart';
import 'package:desafio_carros/services/http_client.dart';

class HttpFactory {
  static IHttpClient carsService() {
    return HttpCliente();
  }
}
