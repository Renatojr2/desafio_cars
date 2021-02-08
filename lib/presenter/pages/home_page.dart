import 'package:desafio_carros/factories/appController_factory.dart';
import 'package:desafio_carros/presenter/pages/insertCar.dart';
import 'package:desafio_carros/presenter/widget/custom_listTile.dart';
import 'package:desafio_carros/store/app.store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    var appStore = Provider.of<AppStore>(context);
    var controller = AppControllerFactory.appController(appStore: appStore);
    controller.getAllCars();

    return Scaffold(
      appBar: AppBar(
        title: Text('Carros'),
      ),
      body: Observer(builder: (_) {
        return appStore.isLoading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
                itemCount: appStore.cars.length,
                itemBuilder: (context, index) {
                  var car = appStore.cars[index];

                  return CustomListTile(
                    car: car,
                    onDismissed: (direction) async {
                      var deleted = await controller.deleteCar(car.id);
                      if (deleted) {
                        return ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Carro deletado com sucesso!'),
                          ),
                        );
                      } else {
                        return ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Não foi possivel deletar o carro!'),
                          ),
                        );
                      }
                    },
                    onPressed: () {
                      print('Clicou');
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => InsertCar(
                            // car: car,
                            ),
                      ));
                    },
                  );
                },
              );
        ;
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => InsertCar(),
          ));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
