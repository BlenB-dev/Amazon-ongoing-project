import 'package:amazon/utils/colors.dart';
import 'package:flutter/material.dart';

import '../../../constant/common_function.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreen();
}

class _ProfileScreen extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final TextTheme = Theme.of(context).textTheme;
    return Scaffold(
      backgroundColor: white,
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
      body: SingleChildScrollView(
        child: Container(
          width: width,
          padding: EdgeInsets.symmetric(vertical: height * 0.02),
          child: Column(
            children: [
              UserGreetingsYouScreen(
                  width: width, TextTheme: TextTheme, height: height),
              CommonFunctions.blankSpace(height * 0.01, 0),
              YouGridBtons(width: width, TextTheme: TextTheme),
              CommonFunctions.blankSpace(height * 0.02, 0),
              UsersOrders(width: width, height: height, TextTheme: TextTheme),
              CommonFunctions.blankSpace(height * 0.01, 0),
              CommonFunctions.divider(),
              KeepShopping(width: width, height: height, TextTheme: TextTheme),
              CommonFunctions.blankSpace(height * 0.01, 0),
              CommonFunctions.divider(),
              BuyAgain(
                width: width,
                height: height,
                TextTheme: TextTheme,
              )
            ],
          ),
        ),
      ),
    );
  }
}

class KeepShopping extends StatelessWidget {
  const KeepShopping({
    super.key,
    required this.width,
    required this.height,
    required this.TextTheme,
  });

  final double width;
  final double height;
  final TextTheme;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: width * 0.04, vertical: height * 0.01),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Keep Shopping for ',
                  style: TextTheme.bodyLarge!
                      .copyWith(fontWeight: FontWeight.bold)),
              Text(
                'Browsing history ',
                style: TextTheme.bodySmall!.copyWith(
                  color: blue,
                ),
              ),
            ],
          ),
          CommonFunctions.blankSpace(height * 0.02, 0),
          GridView.builder(
            shrinkWrap: true,
            physics: const PageScrollPhysics(),
            itemCount: 5,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                childAspectRatio: 0.9),
            itemBuilder: (context, index) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: greyShade3,
                          ),
                          borderRadius: BorderRadius.circular(
                            10,
                          )),
                    ),
                  ),
                  Text(
                    'Product',
                    style: TextTheme.bodyMedium,
                  )
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}

class BuyAgain extends StatelessWidget {
  const BuyAgain({
    super.key,
    required this.width,
    required this.height,
    required this.TextTheme,
  });

  final double width;
  final double height;
  final TextTheme;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: width * 0.04, vertical: height * 0.01),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Buy Again, ',
                  style: TextTheme.bodyLarge!
                      .copyWith(fontWeight: FontWeight.bold)),
              Text(
                'See all',
                style: TextTheme.bodySmall!.copyWith(
                  color: blue,
                ),
              ),
            ],
          ),
          CommonFunctions.blankSpace(height * 0.02, 0),
          SizedBox(
              height: height * 0.14,
              child: ListView.builder(
                  itemCount: 5,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  physics: const PageScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.symmetric(horizontal: width * 0.02),
                      width: height * 0.14,
                      height: height * 0.14,
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: greyShade3,
                          ),
                          borderRadius: BorderRadius.circular(
                            10,
                          )),
                    );
                  }))
        ],
      ),
    );
  }
}

class UsersOrders extends StatelessWidget {
  const UsersOrders({
    super.key,
    required this.width,
    required this.height,
    required this.TextTheme,
  });

  final double width;
  final double height;
  final TextTheme;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: width * 0.04, vertical: height * 0.01),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Your Orders, ',
                  style: TextTheme.bodyLarge!
                      .copyWith(fontWeight: FontWeight.bold)),
              Text(
                'See all',
                style: TextTheme.bodySmall!.copyWith(
                  color: blue,
                ),
              ),
            ],
          ),
          CommonFunctions.blankSpace(height * 0.02, 0),
          SizedBox(
              height: height * 0.17,
              child: ListView.builder(
                  itemCount: 5,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  physics: const PageScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.symmetric(horizontal: width * 0.02),
                      width: width * 0.4,
                      height: height * 0.17,
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: greyShade3,
                          ),
                          borderRadius: BorderRadius.circular(
                            10,
                          )),
                    );
                  }))
        ],
      ),
    );
  }
}

class YouGridBtons extends StatelessWidget {
  const YouGridBtons({
    super.key,
    required this.width,
    required this.TextTheme,
  });

  final double width;
  final TextTheme;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: 4,
      padding: EdgeInsets.symmetric(horizontal: width * 0.04),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio: 3.4,
      ),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return Container(
          decoration: BoxDecoration(
            border: Border.all(color: grey),
            borderRadius: BorderRadius.circular(50),
            color: greyShade2,
          ),
          alignment: Alignment.center,
          child: Builder(builder: (context) {
            if (index == 0) {
              return Text('Your Orders', style: TextTheme.bodyMedium);
            }
            if (index == 1) {
              return Text('Buy Again', style: TextTheme.bodyMedium);
            }
            if (index == 2) {
              return Text('Your Account', style: TextTheme.bodyMedium);
            }
            return Text(
              'Your Wish List',
              style: TextTheme.bodyMedium,
            );
          }),
        );
      },
    );
  }
}

class UserGreetingsYouScreen extends StatelessWidget {
  const UserGreetingsYouScreen({
    super.key,
    required this.width,
    required this.TextTheme,
    required this.height,
  });

  final double width;
  final TextTheme;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width * 0.04),
      child: Row(
        children: [
          RichText(
            text: TextSpan(
              children: [
                TextSpan(text: 'Hello, ', style: TextTheme.bodyLarge),
                TextSpan(
                  text: 'Blen',
                  style: TextTheme.bodyLarge!.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          const Spacer(),
          CircleAvatar(
            backgroundColor: greyShade3,
            radius: height * 0.025,
          ),
        ],
      ),
    );
  }
}
