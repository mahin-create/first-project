import 'package:flutter/material.dart';
import 'package:my_first_project/product_card.dart';
import 'package:my_first_project/product_page.dart';

class BodyPart extends StatefulWidget {
  const BodyPart({super.key});

  @override
  State<BodyPart> createState() => _BodyPartState();
}

class _BodyPartState extends State<BodyPart> {
  final border=OutlineInputBorder(
    borderSide: const BorderSide(
      color: Colors.grey,
    ),
    borderRadius: BorderRadius.circular(10),
  );


  @override
  Widget build(BuildContext context) {
    return  Column(
      children: <Widget>[
        Row(
          children: [
            IconButton(
              onPressed: () {},
              icon:  const Icon(Icons.dehaze_rounded),
            ),
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search here',
                  filled: true,
                  fillColor: Colors.grey[100],
                  focusedBorder: border,
                  enabledBorder: border,
                  suffixIcon: IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.search_sharp,color: Colors.grey),
                  ),
                ),
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.notifications),
            ),
          ],
        ),
        const Divider(
          height: 10,
        ),
        const SizedBox(height: 10),
        Container(
          height: 100,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                Image.network('https://cdn0.tnwcdn.com/wp-content/blogs.dir/1/files/2019/01/Redmi-Note-7-Pro.jpg',
                  width: 100,
                  fit: BoxFit.cover,
                ),
                Image.network('https://cdn0.tnwcdn.com/wp-content/blogs.dir/1/files/2019/01/Redmi-Note-7-Pro.jpg',
                  width: 100,
                  fit: BoxFit.cover,
                ),
                Image.network('https://cdn0.tnwcdn.com/wp-content/blogs.dir/1/files/2019/01/Redmi-Note-7-Pro.jpg',
                  width: 100,
                  fit: BoxFit.cover,
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            width: double.infinity,
            child: Card(
              color: Colors.indigo,
              child: Center(
                child: Column(
                  children: [
                    Text('KYC Pending',style: Theme.of(context).textTheme.bodyLarge),
                    const SizedBox(height: 10),
                    Text('You need to provide the required\ndocuments for your account activation',style: Theme.of(context).textTheme.bodySmall),
                    const SizedBox(height: 10),
                    TextButton(
                      onPressed: () {},
                      child: const Text(
                          'Click here',
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                            decorationColor: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                         ),
                      ),
                    ),
                    ListView.builder(
                      itemCount: products.length,
                      itemBuilder: (context, index) {
                        final product = products[index];
                        return ProductCard(
                            image: product['image'].toString(),
                            name: product['name'] as String,
                        );
                      },
                    ),
                    Expanded(
                      child: Container(
                        width: double.infinity,
                        child: const Card(
                          color: Colors.blue,
                        )
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
