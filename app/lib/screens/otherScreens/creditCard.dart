import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:get/get.dart';
import 'package:shega_cloth_store_app/utils/snackBar.dart';

class credit_card extends StatefulWidget {
  credit_card({super.key});

  @override
  State<credit_card> createState() => _credit_cardState();
}

class _credit_cardState extends State<credit_card> {
  TextEditingController cardNumber = TextEditingController();

  TextEditingController cardpassword = TextEditingController();

  TextEditingController name = TextEditingController();

  TextEditingController day = TextEditingController();
  String cardnumber = '';
  String expiryDate = '';
  String cardHolderName = '';
  String Cvv = '';
  bool IsCvvFocus = false;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(
            Icons.arrow_back_ios,
          ),
        ),
        title: Center(
          child: Text(
            'Credit Card Payment',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 30,
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: ListView(
          children: [
            Column(
              children: [
                CreditCardWidget(
                  cardNumber: cardnumber,
                  expiryDate: expiryDate,
                  cardHolderName: cardHolderName,
                  cvvCode: Cvv,
                  showBackView: IsCvvFocus,
                  onCreditCardWidgetChange: (CreditCardBrand brand) {},
                  bankName: 'Name of the Bank',
                  cardBgColor: Colors.black87,
                  glassmorphismConfig: Glassmorphism.defaultConfig(),
                  enableFloatingCard: true,
                  floatingConfig: FloatingConfig(
                    isGlareEnabled: true,
                    isShadowEnabled: true,
                    shadowConfig: FloatingShadowConfig(),
                  ),
                  backgroundNetworkImage:
                      'https://motuscc.com/wp-content/uploads/2017/04/new-mastercard-2017.png',
                  labelValidThru: 'VALID\nTHRU',
                  obscureCardNumber: true,
                  obscureInitialCardNumber: false,
                  obscureCardCvv: true,
                  labelCardHolder: 'CARD HOLDER',
                  cardType: CardType.mastercard,
                  isHolderNameVisible: true,
                  height: 175,
                  textStyle: TextStyle(color: Colors.yellowAccent),
                  width: MediaQuery.of(context).size.width,
                  isChipVisible: true,
                  isSwipeGestureEnabled: true,
                  animationDuration: Duration(milliseconds: 1000),
                  frontCardBorder: Border.all(color: Colors.grey),
                  backCardBorder: Border.all(color: Colors.grey),
                  chipColor: Colors.red,
                  padding: 16,
                  customCardTypeIcons: <CustomCardTypeIcon>[
                    CustomCardTypeIcon(
                      cardType: CardType.mastercard,
                      cardImage: Image.asset(
                        'assets/R.jpg',
                        height: 48,
                        width: 48,
                      ),
                    ),
                  ],
                ),
                CreditCardForm(
                  formKey: _formKey, // Required
                  cardNumber: cardnumber, // Required
                  expiryDate: expiryDate, // Required
                  cardHolderName: cardHolderName, // Required
                  cvvCode: Cvv, // Required

                  onCreditCardModelChange: onCreditCardChange,
                  obscureCvv: true,
                  obscureNumber: true,
                  isHolderNameVisible: true,
                  isCardNumberVisible: true,
                  isExpiryDateVisible: true,
                  enableCvv: true,
                  cvvValidationMessage: 'Please input a valid CVV',
                  dateValidationMessage: 'Please input a valid date',
                  numberValidationMessage: 'Please input a valid number',
                  cardNumberValidator: (String? cardNumber) {},
                  expiryDateValidator: (String? expiryDate) {},
                  cvvValidator: (String? cvv) {},
                  cardHolderValidator: (String? cardHolderName) {},
                  onFormComplete: () {
                    // callback to execute at the end of filling card data
                  },
                  autovalidateMode: AutovalidateMode.always,
                  disableCardNumberAutoFillHints: false,
                  inputConfiguration: const InputConfiguration(
                    cardNumberDecoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Number',
                      hintText: 'XXXX XXXX XXXX XXXX',
                    ),
                    expiryDateDecoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Expired Date',
                      hintText: 'XX/XX',
                    ),
                    cvvCodeDecoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'CVV',
                      hintText: 'XXX',
                    ),
                    cardHolderDecoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Card Holder',
                    ),
                    cardNumberTextStyle: TextStyle(
                      fontSize: 10,
                      color: Colors.black,
                    ),
                    cardHolderTextStyle: TextStyle(
                      fontSize: 10,
                      color: Colors.black,
                    ),
                    expiryDateTextStyle: TextStyle(
                      fontSize: 10,
                      color: Colors.black,
                    ),
                    cvvCodeTextStyle: TextStyle(
                      fontSize: 10,
                      color: Colors.black,
                    ),
                  ),
                ),
                MaterialButton(
                  height: 50,
                  minWidth: 300,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  color: Color.fromARGB(255, 126, 118, 165),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      showSnack(
                          'The Transaction Is Successfull.ThankYou For Choosing Us! We Are On The Way.',
                          context);
                    } else {
                      showSnack(
                          'Please Enter The Correct Information', context);
                    }
                  },
                  child: Text(
                    'Add Card',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void onCreditCardChange(CreditCardModel? creditCardModel) {
    setState(() {
      cardnumber = creditCardModel!.cardNumber;
      expiryDate = creditCardModel.expiryDate;
      cardHolderName = creditCardModel.cardHolderName;
      Cvv = creditCardModel.cvvCode;
      IsCvvFocus = creditCardModel.isCvvFocused;
    });
  }
}














// Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: TextField(
//                 controller: cardNumber,
//                 decoration: InputDecoration(
//                   border: OutlineInputBorder(),
//                   fillColor: Colors.grey[200],
//                   prefixIcon: Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Icon(
//                       Icons.payment_outlined,
//                     ),
//                   ),
//                   hintText: 'Card Number',
//                 ),
//               ),
//             ),
//             SizedBox(
//               height: 15,
//             ),
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: TextField(
//                 controller: name,
//                 decoration: InputDecoration(
//                   border: OutlineInputBorder(),
//                   fillColor: Colors.grey[200],
//                   prefixIcon: Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Icon(
//                       Icons.person_2_outlined,
//                     ),
//                   ),
//                   hintText: 'Full Name',
//                 ),
//               ),
//             ),
//             SizedBox(
//               height: 15,
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceAround,
//               children: [
//                 SizedBox(
//                   width: 150,
//                   child: TextField(
//                     controller: day,
//                     decoration: InputDecoration(
//                       border: OutlineInputBorder(
//                         borderSide: BorderSide(
//                           color: Colors.white,
//                         ),
//                       ),
//                       fillColor: Colors.grey,
//                       prefixIcon: Padding(
//                         padding: const EdgeInsets.all(8.0),
//                         child: Icon(
//                           Icons.calendar_month_outlined,
//                         ),
//                       ),
//                       hintText: 'MM/YY',
//                     ),
//                   ),
//                 ),
//                 SizedBox(
//                   width: 150,
//                   child: TextField(
//                     controller: cardpassword,
//                     decoration: InputDecoration(
//                       border: OutlineInputBorder(
//                         borderSide: BorderSide(
//                           color: Colors.grey,
//                         ),
//                       ),
//                       fillColor: Colors.grey[200],
//                       prefixIcon: Padding(
//                         padding: const EdgeInsets.all(8.0),
//                         child: Icon(
//                           Icons.password_sharp,
//                         ),
//                       ),
//                       hintText: 'CVV',
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//             SizedBox(
//               height: 20,
//             ),
//             MaterialButton(
//               height: 50,
//               minWidth: 300,
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(20),
//               ),
//               color: Color.fromARGB(255, 126, 118, 165),
//               onPressed: () {},
//               child: Text(
//                 'Add Card',
//                 style: TextStyle(color: Colors.white),
//               ),
//             ),
