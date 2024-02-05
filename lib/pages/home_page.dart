import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rating_model/helper/api.dart';
import 'package:rating_model/models/product_model.dart';
import 'package:rating_model/services/get_all_product_service.dart';
import 'package:rating_model/widgets/colors.dart';
import 'package:rating_model/widgets/custom_card.dart';
import 'package:rating_model/widgets/icons.dart';
import 'package:rating_model/widgets/text.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static String id = 'HomePage';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: white,
        elevation: 0,
        title: Text(
          'New Trend',
          style: h5Bold,
        ),
        actions: [
          MyIconButton(
            icon: FontAwesomeIcons.cartPlus,
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 70, horizontal: 12),
        child: FutureBuilder<List<ProductModle2>>(
          future: GetAllProductServices().getAllProducts(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<ProductModle2> products = snapshot.data!;
              return GridView.builder(
                itemCount: products.length,
                clipBehavior: Clip.none,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1.2,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 80,
                ),
                itemBuilder: (context, index) {
                  return CustomCard(
                    productModle: products[index],
                  );
                },
              );
            } else if (snapshot.hasError) {
              return Center(
                  child: Text(
                'Error while loading data \n $snapshot.error.toString()',
                style: title1Bold,
              ));
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          List<dynamic> data =
              await Api().get(url: 'https://fakestoreapi.com/products');

          List<ProductModle> productLsit = [];
          for (int i = 0; i < data.length; i++) {
            ProductModle productModle = ProductModle.fromJson(data[i]);
            productLsit.add(productModle);
          }
          print(productLsit);
        },
      ),
    );
  }
}
