import 'package:flutter/material.dart';

class HistoryOrdersScreen extends StatefulWidget {
  const HistoryOrdersScreen({super.key});

  @override
  State<HistoryOrdersScreen> createState() => _HistoryOrdersScreenState();
}

class _HistoryOrdersScreenState extends State<HistoryOrdersScreen>
  with SingleTickerProviderStateMixin {
    late TabController _tabController;
    List<Map<String, dynamic>> processOrders = [];
    List<Map<String, dynamic>> doneOrders = [];

    @override
    void initState() {
      super.initState();
      _tabController = TabController(length: 2, vsync: this);
       _tabController.addListener(() {
        if (_tabController.indexIsChanging) return;

        // Load data cho từng tab
        if (_tabController.index == 0) {
          loadProcessOrders();
        } else {
          loadDoneOrders();
        }
      });

      loadProcessOrders();
      loadDoneOrders();
    }

    void loadProcessOrders() {
      setState(() {
        processOrders = [{"name": "Coffee Milk", "price" : 250, "note" : "Ice, Regular, Normal Sugar, Normal Ice"}, {"name": "Cappuccino", "price" : 300, "note" : " Hot, Regular, No Sugar"}];
      });
    }

    void loadDoneOrders() {
      setState(() {
        doneOrders = [{"name": "Latte", "price" : 350, "note" : "Ice, Regular, No Sugar"}, {"name": "Espresso", "price" : 400, "note" : "Hot, Regular, No Sugar"}];
      });
    }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: Text("History Orders", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
          backgroundColor: Colors.white,
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          elevation: 0,
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(40),
            child: SizedBox(
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: TabBar(
                  controller: _tabController,
                  labelColor: Color(0xFF5B4034),
                  unselectedLabelColor: Colors.grey,
                  labelStyle: TextStyle(fontWeight: FontWeight.w600),
                  indicatorColor: Color(0xFF5B4034),
                  indicatorWeight: 2.5,
                  indicatorSize: TabBarIndicatorSize.tab, 
                  tabs: [
                    Tab(text: "Process"),
                    Tab(text: "Done"),
                  ],
                ),
              ),
            ),
          )
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: TabBarView(
            controller: _tabController,
            children: [
              if (_tabController.index == 0) 
                _buildListContent(processOrders, true)
              else
                _buildListContent(doneOrders, false)
            ],
          ),
        ),       
      );
    }

    Widget _buildListContent(List<Map<String, dynamic>> orders, bool isTypeProcessing) {
      if (orders.isEmpty) {
        return Center(child: Text("No orders in ${isTypeProcessing ? "process" : "done"}"));
      }

      return ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: orders.length,
        itemBuilder: (context, index) {
          final order = orders[index];
          return Container(
            padding: const EdgeInsets.only(bottom: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [                                                    
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(
                      "/screens/home/coffee/coffee1.jpg",
                      width: 60,
                      height: 60,
                      fit: BoxFit.cover,
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(order['name'], style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16, color: Colors.black)),
                          const SizedBox(height: 4),
                          SizedBox(height: 40, 
                            child: Text(
                              order['note'], 
                              style: TextStyle(color: Colors.grey[600], fontSize: 13),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          const SizedBox(height: 8),
                          if(!isTypeProcessing)
                                Container(
                                  width: 80,
                                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                                  decoration: BoxDecoration(
                                    color: Color(0xFFF5F5FF), 
                                    borderRadius: BorderRadius.circular(6),
                                    border: Border.all(color: Color(0xFFB8DBCA), width: 1),
                                  ),
                                  child: Text(
                                    'Success',
                                    style: TextStyle(
                                      color: Color(0xFF43936C),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                        ],
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text("Rp. ${order['price']}",
                            style:
                                TextStyle(fontWeight: FontWeight.w600, fontSize: 14, color: Colors.black)),
                        const SizedBox(height: 4),
                        SizedBox(
                          height: 40,
                          child: Text("x1", style: TextStyle(color: Colors.black)),
                        ),
                        const SizedBox(height: 10),
                        InkWell(
                          onTap: () {
                            // Go to tracking order screen
                          },
                          child: Row(
                            children: [                              
                              Text(isTypeProcessing ? "Tracking Order" : "Order Again",
                                  style: TextStyle(color: Color(0xFF5B4034), fontWeight: FontWeight.w600, fontSize: 16)),
                              const SizedBox(width: 4),
                              Icon(Icons.arrow_forward_ios, size: 13, color: Color(0xFF5B4034)),
                            ],
                          ),
                        ),

                        ],
                    )
                  ],
                ),
                const SizedBox(height: 12),
                if(!isTypeProcessing)
                ...[
                  const Divider(
                    color: Colors.grey,
                    height: 1,
                    indent: 60,
                  ),
                  const SizedBox(height: 12),
                  Container(                    
                    decoration: BoxDecoration(
                      color: Color(0xFFF3F3F3),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 1),
                          width: 60,
                          height: 56,
                          margin: EdgeInsets.only(left: 2),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(8),
                              bottomLeft: Radius.circular(8),
                            ),
                          ),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  '5',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16,
                                    color: Colors.black87,
                                  ),
                                ),
                                SizedBox(width: 4),
                                Icon(Icons.star, color: Color(0xFFFFD232), size: 20),
                            ],
                            ),
                        ),
                        Expanded(
                          child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                          height: 60, 
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center, 
                            children: [
                              Text(
                                  'Review',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 15,
                                    color: Colors.black87,
                                  ),
                                ),
                                SizedBox(height: 4),
                                Flexible(
                                  child: Text(
                                    '“The coffee is delicious, light and reasonably priced. I would definitely order again.”',
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.black54,
                                    ),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                            ],
                          ),
                        ),
                        ),
                      ],
                    ),
                  ),
                ],
                if(index < orders.length - 1) 
                  const Divider(
                    color: Colors.grey,
                    height: 24,
                  ),
              ]
            )
          );
        },
    );
  }
}
