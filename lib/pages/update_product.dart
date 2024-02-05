import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:rating_model/methods/navigation.dart';
import 'package:rating_model/models/product_model.dart';
import 'package:rating_model/pages/home_page.dart';
import 'package:rating_model/services/update_product.dart';
import 'package:rating_model/widgets/back_button.dart';
import 'package:rating_model/widgets/colors.dart';
import 'package:rating_model/widgets/custom_buttom.dart';
import 'package:rating_model/widgets/custom_text_field.dart';
import 'package:rating_model/widgets/text.dart';

// ignore: must_be_immutable
class UpdateProductPage extends StatefulWidget {
  const UpdateProductPage({super.key});

  static String id = 'update product';

  @override
  State<UpdateProductPage> createState() => _UpdateProductPageState();
}

class _UpdateProductPageState extends State<UpdateProductPage> {
  String? productName, desc, image;

  String? price;
  bool isloading = false;

  @override
  Widget build(BuildContext context) {
    ProductModle2 productModle =
        ModalRoute.of(context)!.settings.arguments as ProductModle2;
    return ModalProgressHUD(
      inAsyncCall: isloading,
      child: Scaffold(
        backgroundColor: white.withOpacity(0.9),
        appBar: AppBar(
          leading: const MyBackButton(),
          title: Text(
            'Update Product',
            style: h5Bold,
          ),
        ),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 42),
            child: Column(
              children: [
                CustomTextField(
                  hintText: productModle.title,
                  obscureText: false,
                  onChanged: (data) {
                    productName = data;
                  },
                  keyboardType: TextInputType.text,
                ),
                CustomTextField(
                  hintText: productModle.description,
                  obscureText: false,
                  onChanged: (data) {
                    desc = data;
                  },
                  keyboardType: TextInputType.text,
                ),
                CustomTextField(
                  hintText: productModle.price.toString(),
                  obscureText: false,
                  onChanged: (data) {
                    price = data;
                  },
                  keyboardType: TextInputType.number,
                ),
                CustomTextField(
                  hintText: productModle.image,
                  obscureText: false,
                  onChanged: (data) {
                    image = data;
                  },
                  keyboardType: TextInputType.text,
                ),
                ActionButton(
                  title: 'Save',
                  action: () async {
                    isloading = true;
                    setState(() {});
                    try {
                      await updateProduct(productModle);
                      const SnackBar(
                          content: Text('Products Updated Successfuly'));
                    } on Exception catch (e) {
                      SnackBar(content: Text(e.toString()));
                    }
                    isloading = false;
                    setState(() {});
                    goTo(
                        context: context,
                        routName: HomePage.id,
                        argument: productModle);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> updateProduct(ProductModle2 productModle) async {
    await UpdateProductService().updateProduct(
      title: productName == null ? productModle.title : productName!,
      price: price == null ? productModle.price.toString() : price!,
      desc: desc == null ? productModle.description : desc!,
      image: image == null ? productModle.image : image!,
      category: productModle.category,
      id: productModle.id,
    );
  }
}
