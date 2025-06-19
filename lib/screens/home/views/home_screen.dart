import 'package:flutter/material.dart';
import 'package:shopfee_app/route/route_constants.dart';
import 'package:shopfee_app/screens/home/views/components/banner_slider.dart';
import 'package:shopfee_app/screens/home/views/components/filter_buttons.dart';
import 'package:shopfee_app/screens/home/views/components/popular_products.dart';
import 'package:shopfee_app/screens/home/views/components/search_bar.dart';
import 'package:shopfee_app/screens/home/views/components/tabbar_menu.dart';
import 'package:shopfee_app/service/api_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}
class _HomeScreenState extends State<HomeScreen> {

  List<dynamic> listProducts = [];

  final objectFilter = {
    "categoryType": "Coffee",
    "isSearchChanged": "",
    "isBestSeller": false,
    "isRateFiltered": false,
    "isPriceSorted": false,
    "isItemsPromotion": false,
  };

  final orderDetail = {
    "productName" : "",
    "quantity" : 0,
    "unitPrice" : 0,
    "note" : "",
    "subTotal" : 0,
    "imagePath" : "",
    "type" :"",
    "oldPrice":0,
    "desc" :"",
    "rating" : 0
  };

  final List<Map<String, dynamic>> listProductOrdered = [
    {
      "countItems" : 0,
      "totalPrice" : 0,
      "orders" : []
    }
  ];

  String itemName = "";

  @override
  void initState() {
    super.initState();
    loadData();
    
    itemName = listProductOrdered[0]["orders"]
      .map((o) => o["productName"])
      .join(", ");
  }

  void loadData() async {
  //load products from API
    try {
      final response = await ApiService.getAllProducts();
       setState(() {
          listProducts = response;
        });
    } catch (e) {
      print("Error loading products: $e");
    }
}

 @override
  Widget build(BuildContext context) {
    List<dynamic> filteredProducts = [];
    final filteredGroup  = listProducts.firstWhere((group) => group["category"] == objectFilter["categoryType"],
                                orElse: () => null,
                              );
    if (filteredGroup  != null) {
      filteredProducts = (filteredGroup["products"] as List).where((product) {
        // Check if the product matches the filter criteria
        if (objectFilter["isSearchChanged"] as String != "" && 
            !product["name"].toString().toLowerCase().contains((objectFilter["isSearchChanged"] as String).toLowerCase())) {
          return false;
        }
        
         if (objectFilter["isRateFiltered"] as bool && (product["rating"] as double) < 4.5) return false;

        if (objectFilter["isItemsPromotion"] as bool) {
          final oldPrice = product["priceNotDiscount"] as double?;
          if (oldPrice == null || oldPrice <= product["price"]) return false;
        }

        // if (objectFilter["isBestSeller"] as bool )
        // {
        //   if(objectFilter["categoryType"] == "Coffee" && (product["numberSelledOnWeek"] as int) < 100) return false;
        //   if(objectFilter["categoryType"] == "Non-Coffee" && (product["numberSelledOnWeek"] as int) < 80) return false;
        //   if(objectFilter["categoryType"] == "Pastry" && (product["numberSelledOnWeek"] as int) < 20) return false;
        // } 
      // If all conditions are met, include the product

        return true;
      }).toList();

      if (objectFilter["isPriceSorted"] as bool) {
        filteredProducts.sort((a, b) => (b["price"] as double).compareTo(a["price"] as double));
      } 
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
                          final product =  PopularProducts(
                            image: filteredProducts[index]['productImage'] as String,
                            name: filteredProducts[index]['name'] as String,
                            desc: filteredProducts[index]['description'] as String,
                            price: filteredProducts[index]['price'] as double,
                            oldPrice: filteredProducts[index]['priceNotDiscount'] as double?,
                            rating: filteredProducts[index]['rating'] as double,
                            //numberSelledOnWeek: filteredProducts[index]['numberSelledOnWeek'] as int,
                          );

                          // To handle tap, wrap with GestureDetector or InkWell
                          return GestureDetector(
                            onTap: () async{
                              final result = await Navigator.pushNamed(
                                context,
                                productDetailScreenRoute,
                                arguments: {
                                  "product": filteredProducts[index],
                                  "flgEdit": false,
                                },
                              );

                              if (result != null && result is Map<String, dynamic>) {
                                listProductOrdered[0]["orders"].add(result);
                                listProductOrdered[0]["countItems"] += result["quantity"];
                                listProductOrdered[0]["totalPrice"] += result["subTotal"];
                                itemName = listProductOrdered[0]["orders"].map((o) => o["productName"]).join(", ");
                                setState(() {});  
                              }
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
         
            if(listProductOrdered[0]["countItems"] >0 )
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, checkoutScreenRoute,
                                arguments: listProductOrdered[0],
                              );
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                      decoration: BoxDecoration(
                        color: const Color(0xFF5C4033),
                        borderRadius: BorderRadius.circular(24),
                      ),
                      child: Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("${listProductOrdered[0]["countItems"]} item",
                                style: const TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w500),
                              ),
                              const SizedBox(width: 12),
                              SizedBox(
                                width: 180,
                                child: Text(
                                  itemName,
                                  style: const TextStyle(color: Colors.white, fontSize: 14),
                                  overflow: TextOverflow.ellipsis, 
                                  maxLines: 1,
                                ),
                              ),
                            ],
                          ),
                          const Spacer(),
                           Row(
                            children: [
                              Text(
                                "Rp${listProductOrdered[0]["totalPrice"].toStringAsFixed(0)}",
                                style: const TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w600),
                              ),
                              const SizedBox(width: 8),
                              const Icon(Icons.shopping_bag_outlined, color: Colors.white),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
        ),
      ),
    );
  }
}
