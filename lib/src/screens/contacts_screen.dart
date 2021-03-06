import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qwilt/src/services/services.dart';

class ContactsScreen extends StatelessWidget {
  const ContactsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final propertiesProvider =
        Provider.of<PropertiesService>(context, listen: true);
    print(propertiesProvider.onCompleteProperties);
    return Scaffold(
        appBar: AppBar(
          title: const Text("Contacts"),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => {Navigator.pushNamed(context, 'contact_add')},
          tooltip: 'Add Contact',
          child: const Icon(Icons.add),
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
        ));
  }
}
