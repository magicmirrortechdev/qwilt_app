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
        floatingActionButton: FloatingActionButton(
          onPressed: () => {Navigator.pushNamed(context, 'portfolio_add')},
          tooltip: 'Add Portfolio',
          child: const Icon(Icons.add),
        ),
        body: ListView.builder(
          itemCount: portfolioProvider.onCompletePortfolios.length,
          itemBuilder: (context, index) {
            final item = portfolioProvider.onCompletePortfolios[index];
            return ListTile(
              onTap: () => {Navigator.pushNamed(context, 'portfolio_edit')},
              title: Row(children: [
                Expanded(
                    child: Text(
                  item.nickname,
                  style: TextStyle(fontWeight: FontWeight.bold),
                )),
                Text(' Props: ' + item.counterProperties.toString()),
                Icon(
                  Icons.business,
                  color: Colors.blueAccent,
                ),
              ]),
              subtitle: Expanded(child: Text(item.owner)),
            );
          },
        ),
        bottomNavigationBar: const Navigation());
  }
}
