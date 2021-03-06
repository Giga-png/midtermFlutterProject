import 'package:flutter/material.dart';
import 'package:midterm_giga/utils/car_model.dart';
import 'package:midterm_giga/utils/helper.dart';

class CarDetails extends StatelessWidget {
  const CarDetails({Key? key}) : super(key: key);
  static const routeName = "/details_car";

  @override
  Widget build(BuildContext context) {
    final Car car = ModalRoute.of(context)!.settings.arguments as Car;

    return Scaffold(
        appBar: AppBar(title: const Text("Details"), actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.delete),
            onPressed: () {
              CarMethods().deleteCar(car.id);
              Navigator.pushNamed(context, "/home");
            },
          ),
          const Text(" ")
        ]),
        body: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: Container(),
                ),
                Expanded(
                  flex: 8,
                  child: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        FadeInImage(
                          width: double.infinity,
                          fit: BoxFit.fill,
                          height: 200,
                          image: NetworkImage(car.imageUrl),
                          placeholder:
                              const AssetImage("images/car_placeholder.png"),
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 55, vertical: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Brand: ",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Colors.black),
                  ),
                  Text(
                    car.brand,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Colors.black),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 55, vertical: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Model: ",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Colors.black),
                  ),
                  Text(
                    car.model,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Colors.black),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 55, vertical: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Year: ",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Colors.black),
                  ),
                  Text(
                    car.year.toString(),
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Colors.black),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    car.description,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Colors.black),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
