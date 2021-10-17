import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qwilt/src/services/services.dart';
import 'package:qwilt/src/widgets/navigation.dart';

class PropertyScreen extends StatelessWidget {
  const PropertyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final propertiesProvider =
        Provider.of<PropertiesService>(context, listen: true);
    print(propertiesProvider.onCompleteProperties);
    return Scaffold(
        appBar: AppBar(
          title: const Text("Portfolios"),
        ),
        body: ListView.builder(
          // Let the ListView know how many items it needs to build.
          itemCount: propertiesProvider.onCompleteProperties.length,
          // Provide a builder function. This is where the magic happens.
          // Convert each item into a widget based on the type of item it is.
          itemBuilder: (context, index) {
            final item = propertiesProvider.onCompleteProperties[index];

            return ListTile(
              title: Text(item.name),
              subtitle: Text(item.description),
            );
          },
        ),
        bottomNavigationBar: const Navigation());
  }
}
