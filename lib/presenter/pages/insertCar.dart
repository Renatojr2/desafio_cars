import 'dart:io';

import 'package:desafio_carros/controllers/app_controller.dart';
import 'package:desafio_carros/factories/appController_factory.dart';
import 'package:desafio_carros/models/cars_models.dart';
import 'package:desafio_carros/store/app.store.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class InsertCar extends StatefulWidget {
  @override
  _InsertCarState createState() => _InsertCarState();
}

class _InsertCarState extends State<InsertCar> {
  Cars car;
  File file;

  GlobalKey<FormState> form = GlobalKey();

  getImage(BuildContext context, AppController controller) {
    var imagePiker = ImagePicker();
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Container(
              child: Row(
                children: [
                  RaisedButton(
                    onPressed: () async {
                      var pathImage =
                          await imagePiker.getImage(source: ImageSource.camera);
                      if (pathImage != null) {
                        controller.setImagePath(pathImage.path);

                        setState(() {
                          file = File(pathImage.path);
                          car.photo = pathImage.path;
                        });
                        Navigator.of(context).pop();
                      }
                    },
                    child: Text('Câmera'),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  RaisedButton(
                    onPressed: () async {
                      try {
                        var photo = await imagePiker.getImage(
                            source: ImageSource.gallery);

                        if (photo != null) {
                          controller.setImagePath(photo.path);
                          setState(() {
                            file = File(photo.path);
                            car.photo = photo.path;
                          });
                          Navigator.of(context).pop();
                        }
                      } catch (e) {
                        print(e);
                      }
                    },
                    child: Text('Galeria'),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  void validator(AppController controller) async {
    if (form.currentState.validate()) {
      print(form.currentState.validate());
      form.currentState.save();
      print(car);
      var id = await controller.saveCar(car);

      if (id != 0) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Carro cadastrado com sucesso!'),
          ),
        );
        Navigator.of(context).pop();
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error ao cadastrar um novo carro!'),
          ),
        );
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Existem campos a serem preenchidos'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    var appStore = Provider.of<AppStore>(context);
    var controller = AppControllerFactory.appController(appStore: appStore);

    return Scaffold(
      appBar: AppBar(
        title: Text('Adicionar um carro'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Form(
            key: form,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: () => getImage(context, controller),
                  child: CircleAvatar(
                    backgroundImage:
                        appStore.file.isEmpty ? null : FileImage(file),
                    radius: 60,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Toque no círculo pra adicionar uma imagem',
                  style: TextStyle(
                    fontSize: 14,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  onSaved: (value) {
                    car.model = value;
                  },
                  validator: (value) {
                    return value.isEmpty ? 'Campo Obrigatório' : null;
                  },
                  decoration: InputDecoration(
                    labelText: 'Modelo',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                TextFormField(
                  onSaved: (value) {
                    car.brand = value;
                  },
                  validator: (value) {
                    return value.isEmpty ? 'Campo Obrigatório' : null;
                  },
                  decoration: InputDecoration(
                    labelText: 'Marca',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                TextFormField(
                  keyboardType: TextInputType.number,
                  onSaved: (value) {
                    car.year = int.parse(value);
                  },
                  validator: (value) {
                    return value.isEmpty ? 'Campo Obrigatório' : null;
                  },
                  decoration: InputDecoration(
                    labelText: 'Ano',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                TextFormField(
                  keyboardType: TextInputType.number,
                  onSaved: (value) {
                    car.price = int.parse(value);
                  },
                  validator: (value) {
                    return value.isEmpty ? 'Campo Obrigatório' : null;
                  },
                  decoration: InputDecoration(
                    labelText: 'Preço',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(
                  height: 45,
                ),
                Container(
                  height: 40,
                  width: double.infinity,
                  child: RaisedButton(
                    onPressed: () {
                      validator(controller);
                    },
                    child: Text('Salvar'),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
