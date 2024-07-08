import 'package:flutter/material.dart';

import '../../../constant/common_function.dart';
import '../../../utils/colors.dart';
import '../home/home_screen.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final TextTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(width * 1, height * 0.1),
        child: HomePageAppBar(width: width, height: height),
      ),
      body: Container(
        height: height,
        width: width,
        padding: EdgeInsets.symmetric(
            horizontal: width * 0.03, vertical: height * 0.02),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(text: 'Subtotal ', style: TextTheme.bodyLarge),
                    TextSpan(
                        text: '55.40 Birr',
                        style: TextTheme.bodyLarge!
                            .copyWith(fontWeight: FontWeight.bold))
                  ],
                ),
              ),
              CommonFunctions.blankSpace(height * 0.01, 0),
              SizedBox(
                height: height * 0.06,
                child: Row(children: [
                  Icon(
                    Icons.check_circle,
                    color: teal,
                  ),
                  CommonFunctions.blankSpace(
                    0,
                    width * 0.01,
                  ),
                  Expanded(
                    child: Column(children: [
                      RichText(
                          textAlign: TextAlign.justify,
                          text: TextSpan(children: [
                            TextSpan(
                                text:
                                    'Your Order is eligible for FREE Delivery.',
                                style:
                                    TextTheme.bodySmall!.copyWith(color: teal)),
                            TextSpan(
                              text: 'Select this option at checkout.',
                              style: TextTheme.bodySmall,
                            )
                          ]))
                    ]),
                  ),
                ]),
              ),
              ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                        10,
                      )),
                      backgroundColor: amber,
                      minimumSize: Size(width, height * 0.06)),
                  child: Text(
                    'Preceed to Buy',
                    style: TextTheme.bodyMedium,
                  )),
              CommonFunctions.blankSpace(height * 0.02, 0),
              CommonFunctions.divider(),
              CommonFunctions.blankSpace(height * 0.02, 0),
              ListView.builder(
                  itemCount: 2,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Container(
                      // height: height * 0.2,
                      width: width,
                      padding: EdgeInsets.symmetric(
                          horizontal: width * 0.02, vertical: height * 0.01),
                      margin: EdgeInsets.symmetric(
                        vertical: height * 0.01,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: greyShade1,
                      ),
                      child: Row(
                        children: [
                          Expanded(
                              flex: 4,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Image(
                                    image: AssetImage(
                                        'assets/images/todays_deals/todaysDeal1.png'),
                                    fit: BoxFit.fitWidth,
                                  ),
                                  CommonFunctions.blankSpace(height * 0.01, 0),
                                  Container(
                                    height: height * 0.06,
                                    width: width,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(color: greyShade3),
                                    ),
                                    child: Row(
                                      children: [
                                        Expanded(
                                            flex: 2,
                                            child: Container(
                                                decoration: BoxDecoration(
                                                    border: Border(
                                                        right: BorderSide(
                                                            color:
                                                                greyShade3))),
                                                child: Icon(Icons.remove,
                                                    color: black))),
                                        Expanded(
                                            flex: 3,
                                            child: Container(
                                                color: white,
                                                alignment: Alignment.center,
                                                child: Text('1'))),
                                        Expanded(
                                            flex: 2,
                                            child: Container(
                                                decoration: BoxDecoration(
                                                    border: Border(
                                                        left: BorderSide(
                                                            color:
                                                                greyShade3))),
                                                child: Icon(
                                                  Icons.add,
                                                  color: black,
                                                )))
                                      ],
                                    ),
                                  ),
                                ],
                              )),
                          CommonFunctions.blankSpace(0, width * 0.01),
                          Expanded(
                            flex: 11,
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Product name',
                                      style: TextTheme.bodyLarge),
                                  CommonFunctions.blankSpace(height * 0.01, 0),
                                  Text('Birr 464.99',
                                      style: TextTheme.bodyMedium!.copyWith(
                                        fontWeight: FontWeight.bold,
                                      )),
                                  CommonFunctions.blankSpace(0, width * 0.0055),
                                  Text('Eligible for Free Shipping',
                                      style: TextTheme.bodySmall!
                                          .copyWith(color: grey)),
                                  CommonFunctions.blankSpace(0, width * 0.0055),
                                  Text('In Stock',
                                      style: TextTheme.bodySmall!
                                          .copyWith(color: teal)),
                                  Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        ElevatedButton(
                                          onPressed: () {},
                                          style: ElevatedButton.styleFrom(
                                              backgroundColor: white,
                                              side: BorderSide(
                                                color: greyShade3,
                                              )),
                                          child: Text(
                                            'Delete',
                                            style: TextTheme.bodySmall,
                                          ),
                                        ),
                                        ElevatedButton(
                                          onPressed: () {},
                                          style: ElevatedButton.styleFrom(
                                              backgroundColor: white,
                                              side: BorderSide(
                                                color: greyShade3,
                                              )),
                                          child: Text(
                                            'Save For Later',
                                            style: TextTheme.bodySmall,
                                          ),
                                        )
                                      ])
                                ]),
                          )
                        ],
                      ),
                    );
                  })
            ],
          ),
        ),
      ),
    );
  }
}
