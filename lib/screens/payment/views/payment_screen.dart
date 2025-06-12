import 'package:flutter/material.dart';
import 'package:shopfee_app/screens/payment/views/components/credit_card_list.dart';

class PaymentMethodScreen extends StatefulWidget {
  final double totalPrice;
  final List<Map<String, dynamic>> listTransferBank;
  final bool isChooseTransferBanking;
  final dynamic selectedCard;
  const PaymentMethodScreen({super.key, required this.totalPrice, required this.listTransferBank, required this.isChooseTransferBanking, required this.selectedCard});

  @override
  State<PaymentMethodScreen> createState() => _PaymentMethodScreenState();
}

class _PaymentMethodScreenState extends State<PaymentMethodScreen> {
  int selectedIndex = 0;
  bool isShowBankList = false;
  bool isChooseWallet = false;
  String selectedBank = "";
  bool isChooseBanking = false;
  Map<String, dynamic> selectedCard = {};
  Map<String, dynamic> walletDefault = {
     "cardName": "Momo",
      "iconPath": "/screens/payment/momo_wallet.png"
  };

  @override
  void initState() {
    super.initState();
    isChooseBanking = widget.isChooseTransferBanking;
    selectedIndex = isChooseBanking ? 0 : 1;
    selectedCard = (widget.selectedCard["cardName"] != "")    
    ? widget.selectedCard as Map<String, dynamic> 
    : {
        "cardName": widget.listTransferBank[0]["cardName"],
        "iconPath": widget.listTransferBank[0]["iconPath"]
      };
  }

  void changeTransferBanking(oldIndexSelected, newIndexSelected){
    setState(() {
       var temp = widget.listTransferBank[oldIndexSelected];
      widget.listTransferBank[oldIndexSelected] = widget.listTransferBank[newIndexSelected];
      widget.listTransferBank[newIndexSelected] = temp;

      var tempId = widget.listTransferBank[oldIndexSelected]["id"];
      widget.listTransferBank[oldIndexSelected]["id"] = widget.listTransferBank[newIndexSelected]["id"];
      widget.listTransferBank[newIndexSelected]["id"] = tempId;

      isChooseBanking = true;
      selectedCard = widget.listTransferBank[0];
      selectedIndex = 0;
    });
  }

@override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
                leading: IconButton(
                  icon: Icon(Icons.arrow_back, color: Colors.black),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                backgroundColor: Colors.white,
                elevation: 0,
                title: const Text(
                  'Payment Method',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                centerTitle: false,
                bottom: PreferredSize(
                  preferredSize: Size.fromHeight(2.0),
                  child: Container(
                    color: Colors.grey.shade300,
                    height: 1.0,
                  ),
                ),
              ),

      body: Column(
        children: [
          _buildPaymentItem(
            index: 0,
            icon: Icons.account_balance_wallet,
            hasIconFile: false,
            imagePath: widget.listTransferBank[0]["iconPath"],
            title: widget.listTransferBank[0]["cardName"],
            subtitle: 'Total: ${widget.totalPrice}',            
            trailing: Icon(
              selectedIndex == 0 && isChooseBanking ? Icons.radio_button_checked : Icons.radio_button_off,
              color: selectedIndex == 0 && isChooseBanking ? Color.fromARGB(255, 95, 59, 241) : Color(0xFF5C4033),
            ),
          ),
          const Divider(height: 2, indent: 80,endIndent: 30,),
          _buildPaymentItem(
            index: 1,
            icon: null,
            hasIconFile: false,
            imagePath: isChooseBanking ? walletDefault["iconPath"] : selectedCard["iconPath"],
            title: isChooseBanking ? walletDefault["cardName"] : selectedCard["cardName"],
            subtitle: 'Total: ${widget.totalPrice}',
            trailing: Icon(
              selectedIndex == 1 ? Icons.radio_button_checked : Icons.radio_button_off,
              color: selectedIndex == 1 ? Color.fromARGB(255, 95, 59, 241) : Color(0xFF5C4033),
            ),
          ),
          
          _buildPaymentItem(
            index: 2,
            icon: Icons.credit_card,
            hasIconFile: true,
            imagePath: "",
            title: 'Credit or debit card',
            subtitle: 'Visa, Mastercard, Zalo Pay, and JCB',
            trailing: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF5C4033),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 8),
              ),
              onPressed: () async {
                final rs = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CreditCardList(),
                  ),
                );

                if (rs != null) {
                   setState(() {
                     selectedCard = Map<String, dynamic>.from(rs);
                     isChooseWallet = true;
                   });
                  //  if(selectedIndex == 1)
                  //  {
                    Navigator.pop(context, {"listTransferBank" : widget.listTransferBank, "isChooseTransferBanking" : false, "selectedCard" : selectedCard});
                  // }
                }
              },
              child: Text('Change', style: TextStyle(color: Colors.white)),
            ),
          ),
          const SizedBox(height: 15),
          const Divider(thickness: 3),
          _buildPaymentItem(
            index: 3,
            icon: Icons.account_balance,
            hasIconFile: true,
            imagePath: "",
            title: 'Transfer Bank',
            subtitle: 'Automatic Check',
            trailing: Icon(isShowBankList ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down),
          ),
          if (isShowBankList)
          Column(
            children: [
                const SizedBox(height: 16),
                ListView.builder(
                  shrinkWrap: true, 
                  itemCount: widget.listTransferBank.length - 1,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: Image.asset(
                        widget.listTransferBank[index + 1]["iconPath"],
                        width: 32,
                        height: 32,
                      ),
                      title: Text(widget.listTransferBank[index + 1]["cardName"]),
                      onTap: () {
                        changeTransferBanking(0, index + 1);                        
                        Navigator.pop(context, {"listTransferBank" : widget.listTransferBank, "isChooseTransferBanking" : isChooseBanking, "selectedCard" : selectedCard});
                      },
                    );
                  },
                )
            ],
          ),
        ]
      )
      
    );
  }

  Widget _buildPaymentItem({
    required int index,
    required IconData? icon, 
    required bool hasIconFile,
    required String imagePath,
    required String title,
    required String subtitle,
    required Widget trailing,
  }) {
    return ListTile(
      onTap: () async{
        if(index == 3)
        {
           setState(() {
            isShowBankList = !isShowBankList;
          });
        } else
        {
          setState(() {
            selectedIndex = index;
            isChooseBanking = index == 0;       
            if(index == 1 && !isChooseWallet)
            {
              selectedCard = walletDefault;
            }     
          }); 
           Navigator.pop(context, {"listTransferBank" : widget.listTransferBank, "isChooseTransferBanking" : isChooseBanking, "selectedCard" : selectedCard});
        }
      },
      leading: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          color: Colors.blue[50],
          shape: BoxShape.circle,
        ),
        child: hasIconFile ? Icon(icon, color: Colors.blue, size: 22) 
                          : ClipOval(
                                  child: Image.asset(
                                    imagePath,
                                    fit: BoxFit.cover,
                                  ),
                          ),
      ),
      title: Text(
        title,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
      subtitle: Text(subtitle),
      trailing: trailing,
    );
  }

Future<String?> showBankList() async {
  return await showModalBottomSheet<String>(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (context) {
        return ListView(
          padding: const EdgeInsets.all(16),
          shrinkWrap: true,
          children: [
           ],
        );
      },
    );
  }


}
