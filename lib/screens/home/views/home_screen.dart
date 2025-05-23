import 'package:flutter/material.dart';
import 'package:shopfee_app/screens/home/views/components/banner_slider.dart';
import 'package:shopfee_app/screens/home/views/components/filter_buttons.dart';
import 'package:shopfee_app/screens/home/views/components/popular_products.dart';
import 'package:shopfee_app/screens/home/views/components/search_bar.dart';
import 'package:shopfee_app/screens/home/views/components/tabbar_menu.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}
class _HomeScreenState extends State<HomeScreen> {

  final List<Map<String, dynamic>> listProducts = [
    {
      'image': 'screens/home/coffee/coffee1.jpg',
      'name': 'Product 1',
      'type': 'Coffee',
      'desc': 'Description for Product 1',
      'price': 100.0,
      'oldPrice': 120.0,
      'rating': 4.5,
    },
    {
      'image': 'screens/home/coffee/coffee2.jpg',
      'name': 'Product 2',
      'type': 'Coffee',
      'desc': 'Description for Product 2',
      'price': 200.0,
      'oldPrice': 220.0,
      'rating': 4.0,
    },
    {
      'image': 'screens/home/coffee/coffee3.jpg',
      'name': 'Product 3',
      'type': 'Coffee',
      'desc': 'Description for Product 3',
      'price': 300.0,
      'oldPrice': 320.0,
      'rating': 5.0,
    },
    {
      'image': 'screens/home/coffee/coffee4.jpg',
      'name': 'Product 4',
      'type': 'Coffee',
      'desc': 'Description for Product 4',
      'price': 400.0,
      'oldPrice': 420.0,
      'rating': 3.5,
    },
    {
      'image': 'screens/home/coffee/coffee5.jpg',
      'name': 'Product 5',
      'type': 'Coffee',
      'desc': 'Description for Product 5',
      'price': 500.0,
      'oldPrice': 520.0,
      'rating': 4.8,
    },
    {
      'image': 'screens/home/coffee/coffee6.jpg',
      'name': 'Product 6',
      'type': 'Coffee',
      'desc': 'Description for Product 6',
      'price': 600.0,
      'oldPrice': 620.0,
      'rating': 4.2,
    },
    {
      'image': 'screens/home/coffee/coffee7.jpg',
      'name': 'Product 7',
      'type': 'Coffee',
      'desc': 'Description for Product 7',
      'price': 700.0,
      'oldPrice': 720.0,
      'rating': 4.1,
    },
    {
      'image': 'screens/home/coffee/coffee8.jpg',
      'name': 'Product 8',
      'type': 'Coffee',
      'desc': 'Description for Product 8',
      'price': 800.0,
      'oldPrice': 820.0,
      'rating': 4.3,
    }
    ,
    {
      'image': 'screens/home/coffee/coffee9.jpg',
      'name': 'Product 9',
      'type': 'Coffee',
      'desc': 'Description for Product 9',
      'price': 900.0,
      'oldPrice': 920.0,
      'rating': 4.5,
    },
    {
      'image': 'screens/home/non-coffee/non-coffee1.jpg',
      'name': 'Product Non1',
      'type': 'Non-Coffee',
      'desc': 'Description for Product Non1',
      'price': 900.0,
      'oldPrice': 920.0,
      'rating': 4.5,
    }
    ,
    {
      'image': 'screens/home/non-coffee/non-coffee2.jpg',
      'name': 'Product Non2',
      'type': 'Non-Coffee',
      'desc': 'Description for Product Non2',
      'price': 900.0,
      'oldPrice': 920.0,
      'rating': 4.5,
    }
    ,
    {
      'image': 'screens/home/non-coffee/non-coffee3.jpg',
      'name': 'Product Non3',
      'type': 'Non-Coffee',
      'desc': 'Description for Product Non3',
      'price': 900.0,
      'oldPrice': 920.0,
      'rating': 4.5,
    }
    ,
    {
      'image': 'screens/home/non-coffee/non-coffee4.jpg',
      'name': 'Product Non4',
      'type': 'Non-Coffee',
      'desc': 'Description for Product Non4',
      'price': 900.0,
      'oldPrice': 920.0,
      'rating': 4.5,
    }
    ,
    {
      'image': 'screens/home/non-coffee/non-coffee5.jpg',
      'name': 'Product Non5',
      'type': 'Non-Coffee',
      'desc': 'Description for Product Non5',
      'price': 900.0,
      'oldPrice': 920.0,
      'rating': 4.5,
    }
    ,
    {
      'image': 'screens/home/non-coffee/non-coffee6.jpg',
      'name': 'Product Non6',
      'type': 'Non-Coffee',
      'desc': 'Description for Product Non6',
      'price': 900.0,
      'oldPrice': 920.0,
      'rating': 4.5,
    }
    ,
    {
      'image': 'screens/home/non-coffee/non-coffee7.jpg',
      'name': 'Product Non7',
      'type': 'Non-Coffee',
      'desc': 'Description for Product Non7',
      'price': 900.0,
      'oldPrice': 920.0,
      'rating': 4.5,
    }
    ,
    {
      'image': 'screens/home/non-coffee/non-coffee8.jpg',
      'name': 'Product Non8',
      'type': 'Non-Coffee',
      'desc': 'Description for Product Non8',
      'price': 900.0,
      'oldPrice': 920.0,
      'rating': 4.5,
    }
    ,
    {
      'image': 'screens/home/pastry/pastry-1.jpg',
      'name': 'Product Pastry1',
      'type': 'Pastry',
      'desc': 'Description for Product Pastry1',
      'price': 900.0,
      'oldPrice': 920.0,
      'rating': 4.5,
    }
    ,
    {
      'image': 'screens/home/pastry/pastry-2.jpg',
      'name': 'Product Pastry2',
      'type': 'Pastry',
      'desc': 'Description for Product Pastry2',
      'price': 900.0,
      'oldPrice': 920.0,
      'rating': 4.5,
    }
    ,
    {
      'image': 'screens/home/pastry/pastry-3.jpg',
      'name': 'Product Pastry3',
      'type': 'Pastry',
      'desc': 'Description for Product Pastry3',
      'price': 900.0,
      'oldPrice': 920.0,
      'rating': 4.5,
    }
    ,
    {
      'image': 'screens/home/pastry/pastry-4.jpg',
      'name': 'Product Pastry4',
      'type': 'Pastry',
      'desc': 'Description for Product Pastry4',
      'price': 900.0,
      'oldPrice': 920.0,
      'rating': 4.5,
    }
    ,
    {
      'image': 'screens/home/pastry/pastry-5.jpg',
      'name': 'Product Pastry5',
      'type': 'Pastry',
      'desc': 'Description for Product Pastry5',
      'price': 900.0,
      'oldPrice': 920.0,
      'rating': 4.5,
    } 
    ,
    {
      'image': 'screens/home/pastry/pastry-6.jpg',
      'name': 'Product Pastry6',
      'type': 'Pastry',
      'desc': 'Description for Product Pastry6',
      'price': 900.0,
      'oldPrice': 920.0,
      'rating': 4.5,
    }
  ];
  String selectedCategory = "Coffee";

  @override
  Widget build(BuildContext context) {
     final filteredProducts = listProducts
        .where((product) => product["type"] == selectedCategory)
        .toList();


    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: SearchBarWidget(),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      child: BannerSlider(),
                    ),
                     
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      child: TabbarMenu(
                        selectedCategory: selectedCategory,
                        onCategoryChanged: (value) {
                          setState(() {
                            selectedCategory = value;
                          });
                        },
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 0),
                      child: FilterButtons(),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      child:  ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: filteredProducts.length,
                        itemBuilder: (context, index) {                  
                          return PupularProducts(
                            image: filteredProducts[index]['image'] as String,
                            name: filteredProducts[index]['name'] as String,
                            desc: filteredProducts[index]['desc'] as String,
                            price: filteredProducts[index]['price'] as double,
                            oldPrice: filteredProducts[index]['oldPrice'] as double,
                            rating: filteredProducts[index]['rating'] as double,
                          );
                        },
                      ),
                    ),
                    const SizedBox(height: 16),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
