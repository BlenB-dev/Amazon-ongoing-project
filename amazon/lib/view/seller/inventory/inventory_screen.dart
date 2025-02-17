import 'package:flutter/material.dart';

import '../../../utils/colors.dart';

class InventoryScreen extends StatefulWidget {
  const InventoryScreen({super.key});

  @override
  State<InventoryScreen> createState() => _InventoryScreenState();
}

class _InventoryScreenState extends State<InventoryScreen> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final TextTheme = Theme.of(context).textTheme;
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          backgroundColor: amber,
          child: Icon(
            Icons.add,
            color: black,
          ),
        ),
        appBar: PreferredSize(
          preferredSize: Size(width, height * 0.1),
          child: Container(
              padding: EdgeInsets.only(
                  left: width * 0.03,
                  right: width * 0.03,
                  bottom: height * 0.012,
                  top: height * 0.045),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: appBarGradientColor,
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
              ),
              child: Row(
                children: [
                  Image(
                    image:
                        const AssetImage('assets/images/amazon_black_logo.png'),
                    height: height * 0.04,
                  ),
                  const Spacer(),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.notifications_none,
                      color: black,
                      size: height * 0.035,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.search,
                      color: black,
                      size: height * 0.035,
                    ),
                  ),
                ],
              )),
        ),
        body: const Center(
          child: Text('Inventory'),
        ));
  }
}
