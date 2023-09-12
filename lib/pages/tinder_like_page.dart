import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_tindercard/flutter_tindercard.dart';
import 'package:eccomernce/providers/products_provider.dart';

class TinderLikePage extends StatelessWidget {
  static const String id = 'tinder_like_page';

  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<ProductsProvider>(context);
    final products = productsData.items;

    CardController controller;

    return Scaffold(
      appBar: AppBar(
        title: Text('Tinder Like Page'),
      ),
      body: Center(
        child: Container(
          height: MediaQuery.of(context).size.height * 0.6,
          child: TinderSwapCard(
            swipeUp: true,
            swipeDown: true,
            orientation: AmassOrientation.BOTTOM,
            totalNum: products.length,
            stackNum: 3,
            swipeEdge: 4.0,
            maxWidth: MediaQuery.of(context).size.width * 0.9,
            maxHeight: MediaQuery.of(context).size.width * 0.9,
            minWidth: MediaQuery.of(context).size.width * 0.8,
            minHeight: MediaQuery.of(context).size.width * 0.8,
            cardBuilder: (context, index) => Card(
              child: Column(
                children: <Widget>[
                  Image.network(products[index].imageUrl),
                  ListTile(
                    title: Text(products[index].title),
                    subtitle: Text(products[index].description),
                  ),
                ],
              ),
            ),
            cardController: controller = CardController(),
            swipeUpdateCallback:
                (DragUpdateDetails details, Alignment align) {
              if (align.x < 0) {
                //Card is swiped left
              } else if (align.x > 0) {
                //Card is swiped right
                productsData.likeProduct(products[index].id);
              }
            },
            swipeCompleteCallback:
                (CardSwipeOrientation orientation, int index) {
              // Get information about the swiped card's orientation and index
            },
          ),
        ),
      ),
    );
  }
}
