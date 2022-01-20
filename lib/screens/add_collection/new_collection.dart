import 'package:flutter/material.dart';
import 'package:furniture_shop_app/data/models/new_collection_model.dart';
import 'package:furniture_shop_app/data/provider/new_collection_provider.dart';

import 'package:furniture_shop_app/repositry/discover_repository.dart';
import 'package:furniture_shop_app/repositry/new_collection_repository.dart';
import 'package:furniture_shop_app/style.dart';
import 'package:furniture_shop_app/widgets/add_image.dart';
import 'package:furniture_shop_app/widgets/container_button.dart';
import 'package:furniture_shop_app/widgets/default_text_form.dart';
import 'package:provider/provider.dart';

class AddCollectionScreen extends StatefulWidget {
  const AddCollectionScreen({Key? key}) : super(key: key);

  @override
  _AddCollectionScreenState createState() => _AddCollectionScreenState();
}

class _AddCollectionScreenState extends State<AddCollectionScreen> {
  var furnitureTitleController = TextEditingController();

  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var repo = Provider.of<NewCollectionProvider>(context, listen: false);
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
                Text(" ADD Collection".toUpperCase(),
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
                          profileImage:
                              Provider.of<NewCollectionProvider>(context)
                                  .profileImage,
                          getImage: () {
                            Provider.of<NewCollectionProvider>(context,
                                    listen: false)
                                .getImage();
                          }),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 35.0,
                ),
                defaultFormText(
                  control: furnitureTitleController,
                  type: TextInputType.text,
                  validator: (value) {
                    if (value.isEmpty) {
                      return "Furniture Title can't be Empty";
                    }
                    return null;
                  },
                  label: "Furniture Title",
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
                                .addNewCollectionProduct(
                                    model: NewCollectionModel(
                                        title: furnitureTitleController.text),
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
