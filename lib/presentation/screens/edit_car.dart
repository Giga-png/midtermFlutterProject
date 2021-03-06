import 'package:flutter/material.dart';
import 'package:midterm_giga/utils/car_model.dart';
import 'package:midterm_giga/utils/helper.dart';

class EditCar extends StatefulWidget {
  const EditCar({Key? key}) : super(key: key);

  @override
  EditCarState createState() => EditCarState();
}

class EditCarState extends State<EditCar> {
  final _formKey = GlobalKey<FormState>();

  late TextEditingController id = TextEditingController();
  late TextEditingController brand = TextEditingController();
  late TextEditingController model = TextEditingController();
  late TextEditingController year = TextEditingController();
  late TextEditingController description = TextEditingController();
  late TextEditingController imageUrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final Map parsedData = ModalRoute.of(context)!.settings.arguments as Map;
    final Car car = parsedData['car'];
    final int index = parsedData['index'];

    id = TextEditingController(text: car.id.toString());
    brand = TextEditingController(text: car.brand);
    model = TextEditingController(text: car.model);
    year = TextEditingController(text: car.year.toString());
    description = TextEditingController(text: car.description);
    imageUrl = TextEditingController(text: car.imageUrl);

    return Scaffold(
      appBar: AppBar(title: const Text("Edit")),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Card(
                    child: TextFormField(
                      controller: id,
                      decoration: const InputDecoration(hintText: "Enter id"),
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter ID';
                        }
                        return null;
                      },
                    ),
                  ),
                  Card(
                    child: TextFormField(
                      controller: brand,
                      decoration:
                          const InputDecoration(hintText: "Enter brand"),
                      keyboardType: TextInputType.text,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter Brand';
                        }
                        return null;
                      },
                    ),
                  ),
                  Card(
                    child: TextFormField(
                      controller: model,
                      decoration:
                          const InputDecoration(hintText: "Enter model"),
                      keyboardType: TextInputType.text,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter model';
                        }
                        return null;
                      },
                    ),
                  ),
                  Card(
                    child: TextFormField(
                      controller: year,
                      decoration: const InputDecoration(hintText: "Enter year"),
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter year';
                        }
                        return null;
                      },
                    ),
                  ),
                  Card(
                    child: TextFormField(
                      controller: description,
                      decoration:
                          const InputDecoration(hintText: "Enter description"),
                      keyboardType: TextInputType.text,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter description';
                        }
                        return null;
                      },
                    ),
                  ),
                  Card(
                    child: TextFormField(
                      controller: imageUrl,
                      decoration:
                          const InputDecoration(hintText: "Enter imageUrl"),
                      keyboardType: TextInputType.text,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter imageUrl';
                        }
                        return null;
                      },
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ElevatedButton(
                          onPressed: () => Navigator.pop(context),
                          child: const Text("back")),
                      ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              Car car = Car(
                                  id: int.parse(id.text),
                                  brand: brand.text,
                                  model: model.text,
                                  year: int.parse(year.text),
                                  description: description.text,
                                  imageUrl: imageUrl.text);
                              CarMethods().editCar(car, index);
                              Navigator.pop(context);
                            }
                          },
                          child: const Text("Save"))
                    ],
                  )
                ],
              )),
        ),
      ),
    );
  }
}
