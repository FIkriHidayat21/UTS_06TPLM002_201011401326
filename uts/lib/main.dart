import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ProductListScreen(),
    );
  }
}

class Product {
  final String nama;
  final String imageUrl;
  final String desc;
  final double harga;

  Product(this.nama, this.imageUrl, this.desc, this.harga);
}

final List<Product> products = [
  Product('Nike Bomba 1', 'assets/images/nanax.png', 'keren!', 850.0),
  Product('Nike Speeds', 'assets/images/zzzz.png', 'bergaya!', 150.0),
  Product('Nike Sports VXI', 'assets/images/zzzz.png', 'mewah!', 550.0),
  Product('Nike Adult', 'assets/images/nanax.png', 'elegan!', 750.0),
];

class ProductListScreen extends StatelessWidget {
  ProductListScreen({
    super.key,
  });

  final List<Color> colors = [
    const Color.fromARGB(255, 219, 166, 7),
    const Color.fromARGB(255, 129, 13, 13),
    const Color.fromARGB(255, 133, 200, 255),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: const [
                Text('Shoes',
                    style:
                        TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold)),
                Spacer(),
                CircleAvatar(
                  backgroundImage: AssetImage('assets/images/crown-10716.png'),
                  radius: 24.0,
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: products.length,
              itemBuilder: (BuildContext context, int index) {
                final product = products[index];
                return Container(
                  margin: const EdgeInsets.all(10),
                  padding: const EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color: colors[index % colors.length],
                    borderRadius: const BorderRadius.all(Radius.circular(16)),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(product.nama,
                                style: const TextStyle(fontSize: 20.0)),
                            const SizedBox(height: 8.0),
                            Text(product.desc),
                            const SizedBox(height: 8.0),
                            Text('${product.harga}',
                                style: const TextStyle(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ),
                      const SizedBox(width: 16.0),
                      Image.network(product.imageUrl,
                          width: 80.0, height: 80.0),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
