import 'package:flutter/material.dart';
import 'package:my_first_project/body_part.dart';
import 'package:my_first_project/cart_page.dart';
import 'package:my_first_project/categories_page.dart';
import 'package:my_first_project/deals_page.dart';
import 'package:my_first_project/login_page.dart';
import 'package:my_first_project/product_card.dart';
import 'package:my_first_project/product_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int currentPage = 0;
  List<Widget> pages =const [BodyPart(),CategoriesPage(),DealsPage(),CartPage(),LoginPage()];

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body:  IndexedStack(
          index: currentPage,
          children: pages,
        ),
        bottomNavigationBar:  BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
            selectedItemColor: Colors.red,
            currentIndex: currentPage,
            onTap: (value) {
              setState(() {
                currentPage = value;
              });
            },
            items:const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home_filled,color: Colors.grey),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.dashboard,color: Colors.grey),
                label: 'Categories',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.dangerous_rounded,color: Colors.grey),
                label: 'Deals',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart,color: Colors.grey),
                label: 'Cart',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person,color: Colors.grey),
                label: 'Profile',
              ),
            ]
        ),
            floatingActionButton: SizedBox(
              width: 100,
              child: FloatingActionButton(
                backgroundColor: Colors.red,
              onPressed: () {},
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Center(
                  child: Row(
                    children: [
                      const SizedBox(width: 15),
                      const Icon(Icons.chat_bubble,color: Colors.white),
                      Text(' Chat',style: Theme.of(context).textTheme.bodySmall),
                    ],
                  ),
                ),
              ),
            ),
      ),
    );
  }
}
