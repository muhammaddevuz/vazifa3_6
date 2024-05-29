import 'package:dars_6/controllers/category_controller.dart';
import 'package:dars_6/controllers/products_controller.dart';
import 'package:dars_6/controllers/users_controller.dart';
import 'package:flutter/material.dart';

int check = 1;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final categoryController = CategoryController();
  final productsController = ProductsController();
  final usersController = UsersController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          width: double.infinity,
          color: Colors.amber,
          padding: const EdgeInsets.all(20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              InkWell(
                onTap: () {
                  setState(() {
                    check = 1;
                  });
                },
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: check == 1
                          ? null
                          : Border.all(color: Colors.white, width: 5),
                      color: check == 1 ? Colors.white : Colors.amber),
                  padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
                  child: const Text(
                    "Product",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    check = 2;
                  });
                },
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: check == 2
                          ? null
                          : Border.all(color: Colors.white, width: 5),
                      color: check == 2 ? Colors.white : Colors.amber),
                  padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
                  child: const Text(
                    "Categories",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    check = 3;
                  });
                },
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: check == 3
                          ? null
                          : Border.all(color: Colors.white, width: 5),
                      color: check == 3 ? Colors.white : Colors.amber),
                  padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
                  child: const Text(
                    "Users",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ),
        backgroundColor: Colors.amber,
      ),
      body: check == 1
          ? product()
          : check == 2
              ? categories()
              : users(),
    );
  }

  Widget product() {
    return FutureBuilder(
        future: productsController.getProducts(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(
                color: Colors.red,
              ),
            );
          }
          if (!snapshot.hasData) {
            return const Center(
              child: Text("No Products"),
            );
          }
          if (snapshot.hasError) {
            return Center(
              child: Text(snapshot.error.toString()),
            );
          }
          final products = snapshot.data;
          return products == null || products.isEmpty
              ? const Center(
                  child: Text("No Products"),
                )
              : ListView.builder(
                  itemCount: products.length,
                  itemBuilder: (ctx, index) {
                    final product = products[index];
                    return Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.network(product.images[0]),
                          Text(
                            "\$${product.price}",
                            style: const TextStyle(
                                fontSize: 25, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            product.title,
                            style: const TextStyle(
                                fontSize: 25, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    );
                  });
        });
  }

  Widget categories() {
    return FutureBuilder(
        future: categoryController.getCategories(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(
                color: Colors.red,
              ),
            );
          }
          if (!snapshot.hasData) {
            return const Center(
              child: Text("No Categories"),
            );
          }
          if (snapshot.hasError) {
            return Center(
              child: Text(snapshot.error.toString()),
            );
          }
          final categories = snapshot.data;
          return categories == null || categories.isEmpty
              ? const Center(
                  child: Text("No Categories"),
                )
              : ListView.builder(
                  itemCount: categories.length,
                  itemBuilder: (ctx, index) {
                    final categorie = categories[index];
                    return Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.network(categorie.image),
                          Text(
                            categorie.name,
                            style: const TextStyle(
                                fontSize: 25, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    );
                  });
        });
  }

  Widget users() {
    return FutureBuilder(
        future: usersController.getUsers(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(
                color: Colors.red,
              ),
            );
          }
          if (!snapshot.hasData) {
            return const Center(
              child: Text("No Users"),
            );
          }
          if (snapshot.hasError) {
            return Center(
              child: Text(snapshot.error.toString()),
            );
          }
          final users = snapshot.data;
          return users == null || users.isEmpty
              ? const Center(
                  child: Text("No Users"),
                )
              : ListView.builder(
                  itemCount: users.length,
                  itemBuilder: (ctx, index) {
                    final user = users[index];
                    return Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.network(user.avatar),
                          Text(
                            user.email,
                            style: const TextStyle(
                                fontSize: 25, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    );
                  });
        });
  }
}
