import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qwilt/src/services/services.dart';
import 'package:qwilt/src/widgets/navigation.dart';

class PortfolioScreen extends StatelessWidget {
  const PortfolioScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final portfolioProvider =
        Provider.of<PortfoliosService>(context, listen: true);
    return Scaffold(
        appBar: AppBar(
          title: const Text("Portfolios"),
        ),
        body: ListView.builder(
          // Let the ListView know how many items it needs to build.
          itemCount: portfolioProvider.onCompletePortfolios.length,
          // Provide a builder function. This is where the magic happens.
          // Convert each item into a widget based on the type of item it is.
          itemBuilder: (context, index) {
            final item = portfolioProvider.onCompletePortfolios[index];

            return ListTile(
              title: Text(item.nickname),
              subtitle: Text(item.owner),
            );
          },
        ),
        bottomNavigationBar: const Navigation());
  }
}
