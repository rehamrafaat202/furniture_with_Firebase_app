import 'package:flutter/material.dart';
import 'package:furniture_shop_app/data/models/trending_model.dart';
import 'package:furniture_shop_app/data/provider/trending_provider.dart';

import 'package:furniture_shop_app/style.dart';
import 'package:furniture_shop_app/widgets/add_image.dart';
import 'package:furniture_shop_app/widgets/container_button.dart';
import 'package:furniture_shop_app/widgets/default_text_form.dart';
import 'package:provider/provider.dart';

class TrendingCollection extends StatefulWidget {
  const TrendingCollection({Key? key}) : super(key: key);

  @override
  _TrendingCollectionState createState() => _TrendingCollectionState();
}

class _TrendingCollectionState extends State<TrendingCollection> {
  var furnitureNameController = TextEditingController();
  var furniturePriceController = TextEditingController();
  var furnitureDescriptionController = TextEditingController();
  var furnitureSkuController = TextEditingController();
  var furnitureCategoriesController = TextEditingController();
  var furnitureTagsController = TextEditingController();
  var furnitureDimensionsController = TextEditingController();
  var furnitureTypeController = TextEditingController();

  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var repo = Provider.of<TrendingProvider>(context, listen: false);
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
                Text("Add product".toUpperCase(),
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 25)),
                const SizedBox(
                  height: 30,
                ),
                Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      AddImage(
                          profileImage: Provider.of<TrendingProvider>(context)
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
                  height: 25,
                ),
                defaultFormText(
                  control: furnitureTypeController,
                  type: TextInputType.text,
                  validator: (value) {
                    if (value.isEmpty) {
                      return "Furniture Type can't be Empty";
                    }
                    return null;
                  },
                  label: "Furniture Type",
                ),
                const SizedBox(
                  height: 25,
                ),
                defaultFormText(
                  control: furnitureCategoriesController,
                  type: TextInputType.text,
                  validator: (value) {
                    if (value.isEmpty) {
                      return "Furniture Categories can't be Empty";
                    }
                    return null;
                  },
                  label: "Furniture Categories",
                ),
                const SizedBox(
                  height: 25,
                ),
                defaultFormText(
                  control: furnitureSkuController,
                  type: TextInputType.number,
                  validator: (value) {
                    if (value.isEmpty) {
                      return "Furniture SKU can't be Empty";
                    }
                    return null;
                  },
                  label: "Furniture SKU",
                ),
                const SizedBox(
                  height: 25,
                ),
                defaultFormText(
                  control: furnitureDescriptionController,
                  type: TextInputType.text,
                  validator: (value) {
                    if (value.isEmpty) {
                      return "Furniture Description can't be Empty";
                    }
                    return null;
                  },
                  label: "Furniture Description",
                ),
                const SizedBox(
                  height: 25,
                ),
                defaultFormText(
                  control: furnitureDimensionsController,
                  type: TextInputType.text,
                  validator: (value) {
                    if (value.isEmpty) {
                      return "Furniture Dimensions can't be Empty";
                    }
                    return null;
                  },
                  label: "Furniture Dimensions",
                ),
                defaultFormText(
                  control: furnitureTagsController,
                  type: TextInputType.text,
                  validator: (value) {
                    if (value.isEmpty) {
                      return "Furniture Tags can't be Empty";
                    }
                    return null;
                  },
                  label: "Furniture Tags",
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
                                .addTrendingProduct(
                                    model: TrendingModel(
                                        price: furniturePriceController.text,
                                        categories:
                                            furnitureCategoriesController.text,
                                        description:
                                            furnitureDescriptionController.text,
                                        dimensions:
                                            furnitureDimensionsController.text,
                                        sku: furnitureSkuController.text,
                                        tags: furnitureTagsController.text,
                                        type: furnitureTypeController.text,
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
