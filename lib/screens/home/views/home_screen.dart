import 'package:flutter/material.dart';
import 'package:shopfee_app/route/route_constants.dart';
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
      'imagePath': 'screens/home/coffee/coffee1.jpg',
      'name': 'Product 1',
      'type': 'Coffee',
      'desc': 'Description for Product 1',
      'price': 100.0,
      'oldPrice': 120.0,
      'rating': 4.5,
      'numberSelledOnWeek': 50,
    },
    {
      'imagePath': 'screens/home/coffee/coffee2.jpg',
      'name': 'Product 2',
      'type': 'Coffee',
      'desc': 'Description for Product 2',
      'price': 200.0,
      'oldPrice': null,
      'rating': 4.0,
      'numberSelledOnWeek': 30,
    },
    {
      'imagePath': 'screens/home/coffee/coffee3.jpg',
      'name': 'Product 3',
      'type': 'Coffee',
      'desc': 'Description for Product 3',
      'price': 300.0,
      'oldPrice': 320.0,
      'rating': 5.0,
      'numberSelledOnWeek': 20,   
    },
    {
      'imagePath': 'screens/home/coffee/coffee4.jpg',
      'name': 'Product 4',
      'type': 'Coffee',
      'desc': 'Description for Product 4',
      'price': 650.0,
      'oldPrice': 720.0,
      'rating': 3.5,
      'numberSelledOnWeek': 10,
    },
    {
      'imagePath': 'screens/home/coffee/coffee5.jpg',
      'name': 'Product 5',
      'type': 'Coffee',
      'desc': 'Description for Product 5',
      'price': 500.0,
      'oldPrice': null as double?,
      'rating': 4.8,
      'numberSelledOnWeek': 101,
    },
    {
      'imagePath': 'screens/home/coffee/coffee6.jpg',
      'name': 'Product 6',
      'type': 'Coffee',
      'desc': 'Description for Product 6',
      'price': 600.0,
      'oldPrice': 620.0,
      'rating': 4.2,
      'numberSelledOnWeek': 78,
    },
    {
      'imagePath': 'screens/home/coffee/coffee7.jpg',
      'name': 'Product 7',
      'type': 'Coffee',
      'desc': 'Description for Product 7',
      'price': 700.0,
      'oldPrice': 720.0,
      'rating': 4.1,
      'numberSelledOnWeek': 60,
    },
    {
      'imagePath': 'screens/home/coffee/coffee8.jpg',
      'name': 'Product 8',
      'type': 'Coffee',
      'desc': 'Description for Product 8',
      'price': 800.0,
      'oldPrice': 820.0,
      'rating': 4.3,
      'numberSelledOnWeek': 40,
    },
    {
      'imagePath': 'screens/home/coffee/coffee9.jpg',
      'name': 'Product 9',
      'type': 'Coffee',
      'desc': 'Description for Product 9',
      'price': 900.0,
      'oldPrice': 920.0,
      'rating': 4.9,
      'numberSelledOnWeek': 130,
    },
    {
      'imagePath': 'screens/home/non-coffee/non-coffee1.jpg',
      'name': 'Product Non1',
      'type': 'Non-Coffee',
      'desc': 'Description for Product Non1',
      'price': 900.0,
      'oldPrice': 920.0,
      'rating': 4.5,
      'numberSelledOnWeek': 50,
    },
    {
      'imagePath': 'screens/home/non-coffee/non-coffee2.jpg',
      'name': 'Product Non2',
      'type': 'Non-Coffee',
      'desc': 'Description for Product Non2',
      'price': 900.0,
      'oldPrice': 920.0,
      'rating': 4.5,
      'numberSelledOnWeek': 36,
    },
    {
      'imagePath': 'screens/home/non-coffee/non-coffee3.jpg',
      'name': 'Product Non3',
      'type': 'Non-Coffee',
      'desc': 'Description for Product Non3',
      'price': 900.0,
      'oldPrice': null as double?,
      'rating': 4.5,
      'numberSelledOnWeek': 12,
    },
    {
      'imagePath': 'screens/home/non-coffee/non-coffee4.jpg',
      'name': 'Product Non4',
      'type': 'Non-Coffee',
      'desc': 'Description for Product Non4',
      'price': 76.0,
      'oldPrice': 920.0,
      'rating': 4.3,
      'numberSelledOnWeek': 108,
    },
    {
      'imagePath': 'screens/home/non-coffee/non-coffee5.jpg',
      'name': 'Product Non5',
      'type': 'Non-Coffee',
      'desc': 'Description for Product Non5',
      'price': 870.0,
      'oldPrice': null as double?,
      'rating': 4.5,
      'numberSelledOnWeek': 36,
    },
    {
      'imagePath': 'screens/home/non-coffee/non-coffee6.jpg',
      'name': 'Product Non6',
      'type': 'Non-Coffee',
      'desc': 'Description for Product Non6',
      'price': 900.0,
      'oldPrice': 920.0,
      'rating': 4.5,
      'numberSelledOnWeek': 12,
    } ,
    {
      'imagePath': 'screens/home/non-coffee/non-coffee7.jpg',
      'name': 'Product Non7',
      'type': 'Non-Coffee',
      'desc': 'Description for Product Non7',
      'price': 900.0,
      'oldPrice': 920.0,
      'rating': 4.5,
      'numberSelledOnWeek': 59,
    },
    {
      'imagePath': 'screens/home/non-coffee/non-coffee8.jpg',
      'name': 'Product Non8',
      'type': 'Non-Coffee',
      'desc': 'Description for Product Non8',
      'price': 900.0,
      'oldPrice': 920.0,
      'rating': 4.5,
      'numberSelledOnWeek': 36,
    }   ,
    {
      'imagePath': 'screens/home/pastry/pastry-1.jpg',
      'name': 'Product Pastry1',
      'type': 'Pastry',
      'desc': 'Description for Product Pastry1',
      'price': 900.0,
      'oldPrice': 920.0,
      'rating': 4.5,
      'numberSelledOnWeek': 51,
    }
    ,
    {
      'imagePath': 'screens/home/pastry/pastry-2.jpg',
      'name': 'Product Pastry2',
      'type': 'Pastry',
      'desc': 'Description for Product Pastry2',
      'price': 900.0,
      'oldPrice': 920.0,
      'rating': 4.5,
      'numberSelledOnWeek': 78,
    }
    ,
    {
      'imagePath': 'screens/home/pastry/pastry-3.jpg',
      'name': 'Product Pastry3',
      'type': 'Pastry',
      'desc': 'Description for Product Pastry3',
      'price': 900.0,
      'oldPrice': null as double?,
      'rating': 4.5,
      'numberSelledOnWeek': 20,   
    }
    ,
    {
      'imagePath': 'screens/home/pastry/pastry-4.jpg',
      'name': 'Product Pastry4',
      'type': 'Pastry',
      'desc': 'Description for Product Pastry4',
      'price': 900.0,
      'oldPrice': 920.0,
      'rating': 4.5,
      'numberSelledOnWeek': 10,
    },
    {
      'imagePath': 'screens/home/pastry/pastry-5.jpg',
      'name': 'Product Pastry5',
      'type': 'Pastry',
      'desc': 'Description for Product Pastry5',
      'price': 900.0,
      'oldPrice': null as double?,
      'rating': 4.5,
      'numberSelledOnWeek': 5,
    },
    {
      'imagePath': 'screens/home/pastry/pastry-6.jpg',
      'name': 'Product Pastry6',
      'type': 'Pastry',
      'desc': 'Description for Product Pastry6',
      'price': 900.0,
      'oldPrice': 920.0,
      'rating': 4.1,
      'numberSelledOnWeek': 12,
    }
  ];

  final objectFilter = {
    "categoryType": "Coffee",
    "isSearchChanged": "",
    "isBestSeller": false,
    "isRateFiltered": false,
    "isPriceSorted": false,
    "isItemsPromotion": false,
  };

 @override
  Widget build(BuildContext context) {
     final filteredProducts = listProducts.where((product) {

      if (objectFilter["isSearchChanged"] as String != "" && 
          !product["name"].toString().toLowerCase().contains((objectFilter["isSearchChanged"] as String).toLowerCase())) {
        return false;
      }

      if (product["type"] != objectFilter["categoryType"]) return false;

      //if (objectFilter["isFiltered"] as bool && (product["price"] as double) > 500) return false;
      
      if (objectFilter["isRateFiltered"] as bool && (product["rating"] as double) < 4.5) return false;

      if (objectFilter["isItemsPromotion"] as bool) {
        final oldPrice = product["oldPrice"] as double?;
        if (oldPrice == null || oldPrice <= product["price"]) return false;
      }

      if (objectFilter["isBestSeller"] as bool )
      {
        if(objectFilter["categoryType"] == "Coffee" && (product["numberSelledOnWeek"] as int) < 100) return false;
        if(objectFilter["categoryType"] == "Non-Coffee" && (product["numberSelledOnWeek"] as int) < 80) return false;
        if(objectFilter["categoryType"] == "Pastry" && (product["numberSelledOnWeek"] as int) < 20) return false;
      } 
      // If all conditions are met, include the product

      return true;
    }).toList();

    if (objectFilter["isPriceSorted"] as bool) {
      filteredProducts.sort((a, b) => (b["price"] as double).compareTo(a["price"] as double));
    } 

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: SearchBarWidget(
                onSearchChanged: (value) {
                  setState(() {
                    objectFilter["isSearchChanged"] = value;
                  });
                },
              ),
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
                        onCategoryChanged: (value) {
                          setState(() {
                            objectFilter["categoryType"] = value;
                          });
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
                      child: FilterButtons(                        
                        onFilterChanged: (filters) {
                          setState(() {
                            objectFilter["isBestSeller"] = filters[0];
                            objectFilter["isRateFiltered"] = filters[1];
                            objectFilter["isPriceSorted"] = filters[2];
                            objectFilter["isItemsPromotion"] = filters[3];
                          });                          
                        },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      child:  ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: filteredProducts.length,
                        itemBuilder: (context, index) {                  
                          final product =  PupularProducts(
                            image: filteredProducts[index]['imagePath'] as String,
                            name: filteredProducts[index]['name'] as String,
                            desc: filteredProducts[index]['desc'] as String,
                            price: filteredProducts[index]['price'] as double,
                            oldPrice: filteredProducts[index]['oldPrice'] as double?,
                            rating: filteredProducts[index]['rating'] as double,
                            numberSelledOnWeek: filteredProducts[index]['numberSelledOnWeek'] as int,
                          );

                          // To handle tap, wrap with GestureDetector or InkWell
                          return GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(
                                context,
                                productDetailScreenRoute,
                                arguments: filteredProducts[index],
                              );
                            },
                            child: product,
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
