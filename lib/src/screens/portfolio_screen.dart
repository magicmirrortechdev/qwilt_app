import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qwilt/src/services/services.dart';
import 'package:qwilt/src/widgets/widgets.dart';

class PortfolioScreen extends StatelessWidget {
  const PortfolioScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final portfolioProvider =
        Provider.of<PortfoliosService>(context, listen: true);
    return Scaffold(
        extendBody: true,
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          elevation: 1,
          backgroundColor: Colors.transparent,
          title: const Text(
            "Portfolios",
          ),
        ),
        floatingActionButton: Padding(
          padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom + 50),
          child: FloatingActionButton(
            onPressed: () => {Navigator.pushNamed(context, 'portfolio_add')},
            tooltip: 'Add Portfolio',
            child: const Icon(Icons.add),
          ),
        ),
        body: Stack(children: <Widget>[
          const BackgroundApp(),
          ListView.builder(
            itemCount: portfolioProvider.onCompletePortfolios.length,
            itemBuilder: (context, index) {
              final item = portfolioProvider.onCompletePortfolios[index];
              return ListTile(
                onTap: () => {Navigator.pushNamed(context, 'portfolio_edit')},
                title: Row(children: [
                  Expanded(
                      child: Text(
                    item.nickname,
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.white70),
                  )),
                  Text(
                    ' Props: ' + item.counterProperties.toString(),
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.white70),
                  ),
                  Icon(
                    Icons.business,
                    color: Colors.white70,
                  ),
                ]),
                subtitle: Expanded(
                    child: Text(
                  item.owner,
                  style: TextStyle(color: Colors.white70),
                )),
              );
            },
          )
        ]));
  }
}
