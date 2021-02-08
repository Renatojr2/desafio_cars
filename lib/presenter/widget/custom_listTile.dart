import 'dart:io';

import 'package:desafio_carros/models/cars_models.dart';
import 'package:desafio_carros/store/app.store.dart';
import 'package:flutter/material.dart';

class CustomListTile extends StatelessWidget {
  final Cars car;
  final AppStore appStore;
  final Function(DismissDirection direction) onDismissed;
  final Function onPressed;

  const CustomListTile({
    this.car,
    this.onDismissed,
    this.onPressed,
    this.appStore,
  });
  @override
  Widget build(BuildContext context) {
    DismissDirection direction = DismissDirection.startToEnd;
    return Dismissible(
      onDismissed: onDismissed,
      key: Key(car.id.toString()),
      direction: direction,
      background: Container(
        color: Colors.red,
      ),
      child: ListTile(
        leading: appStore?.file == car.photo && appStore?.file != null
            ? Image.file(
                File(appStore.file),
                width: 25,
              )
            : Image(
                image: NetworkImage(car.photo),
                width: 25,
              ),
        title: Text(car.model),
        subtitle: Row(
          children: [
            Text(car.brand),
            SizedBox(
              width: 10,
            ),
            Text(car.year.toString()),
            SizedBox(
              width: 10,
            ),
            Text(
              ' R\$ ${car.price}',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
        contentPadding: EdgeInsets.all(10),
        trailing: IconButton(
          onPressed: onPressed,
          icon: Icon(
            Icons.edit,
          ),
        ),
      ),
    );
  }
}
