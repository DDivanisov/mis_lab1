import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Lab1',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> products = [
      {
        "name": "T-shirt",
        "image": "https://th.bing.com/th/id/OIP.aC0n5pzZ80kFX1D37EJJAAHaH8?rs=1&pid=ImgDetMain",
        "description": "A black t-shirt",
        "price": "1000 MKD"
      },
      {
        "name": "Jeans",
        "image": "https://th.bing.com/th/id/R.e3fba521fd80b6fc857fe0b3352bfe83?rik=u%2b4iO9tBo1TvxA&riu=http%3a%2f%2ffxposed.co.uk%2fImages%2fWith+Watermark%2fJeans%2fG72-RIPPED2%2fG72-RIPPED2-BLACK%2fIMG_3491.JPG&ehk=3BX6Exa5KDMRi4DJF7tOVJE34p5em8RZpEe00hdCH%2bM%3d&risl=&pid=ImgRaw&r=0",
        "description": "Black jeans that are torn.",
        "price": "2400 MKD"
      },
      {
        "name": "Jacket",
        "image": "https://th.bing.com/th/id/R.b6b807be147220c714f25ba9b81825d1?rik=RR%2bjzJ8%2bVnQBtg&pid=ImgRaw&r=0",
        "description": "Black leather jacket.",
        "price": "3400 MKD"
      },
      {
        "name": "Shirt",
        "image": "https://th.bing.com/th/id/R.a45d35fa952a2cad9468c5afa872b189?rik=mxR5nsPcdgV3zA&pid=ImgRaw&r=0",
        "description": "Cotton plain black shirt.",
        "price": "3000 MKD"
      },
      {
        "name": "Tank top",
        "image": "https://th.bing.com/th/id/R.3b118c0d1dbd9e7e2417202bd3105ff4?rik=6dXWgzokGcyPcA&pid=ImgRaw&r=0",
        "description": "Black tank top.",
        "price": "900 MKD"
      },
      {
        "name": "Fedora hat",
        "image": "https://images-na.ssl-images-amazon.com/images/I/71oTWOWnfTL._UX679_.jpg",
        "description": "Black fedora hat.",
        "price": "1500 MKD"
      },
      {
        "name": "Boots",
        "image": "https://www.widefitshoes.co.uk/cdn/shop/files/WalkingBoots2_8e2c4cf7-d40a-4ce1-8b71-f4383afb2548_1800x1800.jpg?v=1705398303",
        "description": "Black leather boots.",
        "price": "2600 MKD"
      }
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("201023"),
        backgroundColor: const Color.fromARGB(255, 2, 75, 109),
      ),
      backgroundColor: Colors.lightBlue[50],
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 4,
        ),
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          return Card(
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailsPage(product: product),
                  ),
                );
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    child: Image.network(product["image"], fit: BoxFit.cover),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      product["name"],
                      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class DetailsPage extends StatelessWidget {
  final Map<String, dynamic> product;

  const DetailsPage({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product["name"]),
        backgroundColor: const Color.fromARGB(255, 2, 75, 109),
      ),
      backgroundColor: Colors.lightBlue[50],
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.network(product["image"], height: 400, fit: BoxFit.cover),
            const SizedBox(height: 16),
            Text(product["name"], style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Text(product["description"], style: const TextStyle(fontSize: 16)),
            const SizedBox(height: 16),
            Text("Цена: ${product["price"]}", style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}