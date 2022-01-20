import 'package:flutter/material.dart';
import 'package:furniture_shop_app/data/models/best_selling_model.dart';
import 'package:furniture_shop_app/data/provider/selling_provider.dart';

import 'package:furniture_shop_app/style.dart';
import 'package:furniture_shop_app/widgets/add_image.dart';
import 'package:furniture_shop_app/widgets/container_button.dart';
import 'package:furniture_shop_app/widgets/default_text_form.dart';
import 'package:provider/provider.dart';

class BestSellingCollection extends StatefulWidget {
  const BestSellingCollection({Key? key}) : super(key: key);

  @override
  _BestSellingCollectionState createState() => _BestSellingCollectionState();
}

class _BestSellingCollectionState extends State<BestSellingCollection> {
  var furnitureNameController = TextEditingController();
  var furniturePriceController = TextEditingController();

  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var repo = Provider.of<SellingProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.close)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Furniture Details",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 30)),
                const SizedBox(
                  height: 30,
                ),
                Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      AddImage(
                          profileImage: Provider.of<SellingProvider>(context)
                              .profileImage,
                          getImage: () {
                            repo.getImage().then((value) {});
                          }),
                    ],
                  ),
                ),
                defaultFormText(
                  control: furnitureNameController,
                  type: TextInputType.name,
                  validator: (value) {
                    if (value.isEmpty) {
                      return "Furniture Name can't be Empty";
                    }
                    return null;
                  },
                  label: "Furniture Name",
                ),
                const SizedBox(
                  height: 25,
                ),
                defaultFormText(
                  control: furniturePriceController,
                  type: TextInputType.number,
                  validator: (value) {
                    if (value.isEmpty) {
                      return "Furniture Price can't be Empty";
                    }
                    return null;
                  },
                  label: "Furniture Price",
                ),
                const SizedBox(
                  height: 60,
                ),
                repo.isloading
                    ? const Center(
                        child: CircularProgressIndicator(
                          color: primaryColor,
                        ),
                      )
                    : ContainerButton(
                        color: const Color(0xff242A37),
                        txtColor: Colors.white,
                        title: "ADD",
                        submit: () {
                          if (repo.profileImage == null) {
                            return showDialog(
                                context: context,
                                builder: (ctx) => const AlertDialog(
                                    title: Text("Warning"),
                                    content: Text("Image can't be empty ")));
                          }
                          if (formKey.currentState!.validate()) {
                            repo.addLoading(true);

                            repo
                                .addSellingProoduct(
                                    model: BestSellingModel(
                                        price: furniturePriceController.text,
                                        title: furnitureNameController.text),
                                    context: context)
                                .then((value) {
                              repo.addLoading(false);

                              showDialog(
                                      context: context,
                                      builder: (ctx) => const AlertDialog(
                                          title: Text(' GOOD JOB'),
                                          content: Text(
                                              'Your Discover Furniture added successfuly ')))
                                  .then((value) {});
                            }).catchError((e) {
                              return e;
                            });
                          }
                        }),
                const SizedBox(
                  height: 12,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
