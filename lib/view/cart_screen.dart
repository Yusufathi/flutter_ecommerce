import 'package:eccomernce/model/item_model.dart';
import 'package:eccomernce/view/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';
import '../services/http_app_request.dart';
import '../services/shared_pref.dart';

class CartScreen extends StatefulWidget {
  static const String id = "cart_screen";

  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  List<ItemModel> items = [];
  late bool _isLoading;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _isLoading = true;
    _loadData();
  }

  void _loadData() async {
    setState(() {
      _isLoading = true;
    });
    List<String> ids = await SharedPref.getCartProducts();
    items.clear();
    for (String id in ids) {
      ItemModel item = await HTTPAppRequest.fetchSingleProduct(id);
      items.add(item);
    }
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: TextButton(
          onPressed: (){
            Navigator.of(context).pushNamed(HomeScreen.id);
          },
          child: Icon(
            Icons.arrow_back
          ),
        ),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Cart Screen'),
      ),
      body: _isLoading
          ? LoadingIndicator(indicatorType: Indicator.ballZigZag)
          : Container(
              child: SingleChildScrollView(
                child: Column(
                  children: _buildItemWidgets(items, context),
                ),
              ),
            ),
    );
  }

  List<Widget> _buildItemWidgets(
      List<ItemModel> activeCategoryProducts, BuildContext context) {
    List<Widget> items = [];

    for (ItemModel item in activeCategoryProducts) {
      items.add(_buildItemWidget(item, context));
    }
    return items;
  }

  Container _buildItemWidget(ItemModel item, BuildContext ctx) {
    return Container(
      height: 150,
      decoration: BoxDecoration(
          color: Colors.white, border: Border.all(color: Colors.blueAccent)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Expanded(child: Image.network(item.imgPath!)),
            Expanded(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    item.title!,
                    style: TextStyle(fontSize: 15),
                  ),
                  // Text(item.briefDescription!,style: TextStyle(overflow: TextOverflow.fade),),
                  Text(("${item.price}\$")),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ElevatedButton(
                          onPressed: () async {
                             SharedPref.removeFromCart(item.id.toString());
                            _loadData();
                          },
                          child: Text("Remove")),
                      SizedBox(
                        width: 10,
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
