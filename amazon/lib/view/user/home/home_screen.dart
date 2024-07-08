// ignore_for_file: use_build_context_synchronously

import 'dart:developer';

import 'package:amazon/constant/common_function.dart';
import 'package:amazon/utils/colors.dart';
import 'package:amazon/view/user/address_screen/address_screen.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import '../../../constant/constants.dart';
import '../../../controller/provider/address_provider.dart';
import '../../../controller/services/auth_services/user_data_crud_services/user_data_CRUD_services.dart';
import '../../../model/address_model.dart';
import 'package:flutter/src/material/text_theme.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  CarouselController todaysDealsCarouselController = CarouselController();

  checkUserAddress() async {
    bool userAddressPresent = await UserDataCRUD.checkUsersAddress();
    log('user Address Present:${userAddressPresent.toString()}');
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    if (userAddressPresent == false) {
      showModalBottomSheet(
          backgroundColor: transparent,
          context: context,
          builder: (context) {
            return Container(
                height: height * 0.3,
                padding: EdgeInsets.symmetric(
                    vertical: height * 0.03, horizontal: width * 0.03),
                width: width,
                decoration: BoxDecoration(
                    color: white,
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10))),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Add Address',
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    SizedBox(
                      height: height * 0.15,
                      child: ListView.builder(
                        itemCount: 1,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: ((context, index) {
                          return InkWell(
                            onTap: () {
                              if (index == 0) {
                                Navigator.push(
                                    context,
                                    PageTransition(
                                      child: const AddressScreen(),
                                      type: PageTransitionType.rightToLeft,
                                    ));
                              }
                            },
                            child: Container(
                              width: width * 0.3,
                              padding: EdgeInsets.symmetric(
                                  horizontal: width * 0.03,
                                  vertical: height * 0.01),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(color: greyShade3),
                              ),
                              alignment: Alignment.center,
                              child: Builder(builder: (context) {
                                if (index == 0) {
                                  return Text(
                                    'Add Address',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodySmall!
                                        .copyWith(
                                          fontWeight: FontWeight.bold,
                                          color: greyShade3,
                                        ),
                                  );
                                }
                                return Text(
                                  'Add Address',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall!
                                      .copyWith(
                                        fontWeight: FontWeight.bold,
                                        color: greyShade3,
                                      ),
                                );
                              }),
                            ),
                          );
                        }),
                      ),
                    ),
                  ],
                ));
          });
    }
  }

  headphoneDeals(int index) {
    switch (index) {
      case 0:
        return 'Bose';
      case 1:
        return 'boAt';
      case 2:
        return 'Sony';
      case 3:
        return 'OnePlus';
    }
  }

  clothingDeals(int index) {
    switch (index) {
      case 0:
        return 'Kurtas, saress & more';
      case 1:
        return 'Tops, dresses & more';
      case 2:
        return 'T-Shirt, jeans & more';
      case 3:
        return 'View all';
    }
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      checkUserAddress();
      context.read<AddressProvider>().getCurrentSelectedAddress();
    });
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final TextTheme = Theme.of(context).textTheme;
    return Scaffold(
        backgroundColor: white,
        appBar: PreferredSize(
          preferredSize: Size(width * 1, height * 0.1),
          child: HomePageAppBar(width: width, height: height),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              HomeScreenUserAddressBar(height: height, width: width),
              CommonFunctions.divider(),
              const HomeScreenCategoriesList(),
              CommonFunctions.blankSpace(height * 0.01, 0),
              CommonFunctions.divider(),
              HomeScreenBanner(height: height),
              CommonFunctions.divider(),
              TodaysDealHomeScreenWidget(
                  todaysDealsCarouselController: todaysDealsCarouselController),
              CommonFunctions.divider(),
              OtherOfferGridWidget(
                  title: 'Latest Launches an Headphones',
                  textBtnName: 'Explore More',
                  poductPicNamesList: headphonesDeals,
                  offerFor: 'headphones'),
              CommonFunctions.divider(),
              Container(
                height: height * 0.35,
                width: width,
                child: const Image(
                    image: AssetImage(
                      'assets/images/offersNsponcered/insurance.png',
                    ),
                    fit: BoxFit.fill),
              ),
              CommonFunctions.divider(),
              OtherOfferGridWidget(
                  title: 'Minimum 70% off | Top Offers on Clothing',
                  textBtnName: 'See all deals',
                  poductPicNamesList: clothingDealsList,
                  offerFor: 'clothing'),
              CommonFunctions.divider(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CommonFunctions.blankSpace(height * 0.01, 0),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: width * 0.03),
                    child: Text(
                      'Watch  Sixer only on miniTV',
                      style: TextTheme.bodyMedium!.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Container(
                    height: height * 0.4,
                    width: width,
                    padding: EdgeInsets.symmetric(
                        horizontal: width * 0.03, vertical: height * 0.01),
                    child: const Image(
                        image: AssetImage(
                          'assets/images/offersNsponcered/sixer.png',
                        ),
                        fit: BoxFit.fill),
                  ),
                ],
              )
            ],
          ),
        ));
  }

  Container OtherOfferGridWidget(
      {required title,
      required String textBtnName,
      required List<String> poductPicNamesList,
      required String offerFor}) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final TextTheme = Theme.of(context).textTheme;
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: width * 0.03,
        vertical: height * 0.01,
      ),
      width: width,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(
          title,
          style: TextTheme.bodyMedium!.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
        CommonFunctions.blankSpace(
          height * 0.01,
          0,
        ),
        GridView.builder(
          itemCount: 4,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, mainAxisSpacing: 10, crossAxisSpacing: 10),
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {},
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                            image: AssetImage(
                                'assets/images/offersNsponcered/${poductPicNamesList[index]}'),
                            fit: BoxFit.cover),
                      ),
                    ),
                  ),
                  Text(
                    offerFor == 'headphones'
                        ? headphoneDeals(index)
                        : clothingDeals(index),
                    style: TextTheme.bodyMedium,
                  )
                ],
              ),
            );
          },
        ),
        TextButton(
          onPressed: () {},
          child: Text(
            textBtnName,
            style: TextTheme.bodySmall!.copyWith(color: blue),
          ),
        )
      ]),
    );
  }
}

class TodaysDealHomeScreenWidget extends StatelessWidget {
  const TodaysDealHomeScreenWidget({
    super.key,
    required this.todaysDealsCarouselController,
  });

  final CarouselController todaysDealsCarouselController;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final TextTheme = Theme.of(context).textTheme;
    return SizedBox(
      width: width,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: width * 0.03,
          vertical: height * 0.01,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CommonFunctions.blankSpace(height * 0.01, 0),
            Text(
              '50%-80% off | Latest deals',
              style: TextTheme.displaySmall!.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
            CommonFunctions.blankSpace(height * 0.01, 0),
            CarouselSlider(
              carouselController: todaysDealsCarouselController,
              options: CarouselOptions(
                height: height * 0.2,
                autoPlay: true,
                viewportFraction: 1,
              ),
              items: todaysDeals.map((i) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          color: white,
                          image: DecorationImage(
                            image: AssetImage('assets/images/todays_deals/$i'),
                            fit: BoxFit.fitHeight,
                          )),
                    );
                  },
                );
              }).toList(),
            ),
            CommonFunctions.blankSpace(height * 0.01, 0),
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      5,
                    ),
                    color: red,
                  ),
                  child: Text(
                    'upto 62% off',
                    style: TextTheme.labelMedium!.copyWith(color: white),
                  ),
                ),
                CommonFunctions.blankSpace(0, width * 0.03),
                Text(
                  'Deal of the Day',
                  style: TextTheme.labelMedium!.copyWith(
                    color: red,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            CommonFunctions.blankSpace(height * 0.01, 0),
            GridView.builder(
              itemCount: 4,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4, mainAxisSpacing: 10, crossAxisSpacing: 20),
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return InkWell(
                    onTap: () {
                      log(index.toString());
                      todaysDealsCarouselController.animateToPage(index);
                    },
                    child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: greyShade3,
                            ),
                            image: DecorationImage(
                                image: AssetImage(
                                    'assets/images/todays_deals/${todaysDeals[index]}'),
                                fit: BoxFit.contain))));
              },
            ),
            TextButton(
              onPressed: () {},
              child: Text(
                'See all Deals ',
                style: TextTheme.bodySmall!.copyWith(color: blue),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class HomeScreenBanner extends StatelessWidget {
  const HomeScreenBanner({
    super.key,
    required this.height,
  });

  final double height;

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: height * 0.23,
        autoPlay: true,
        viewportFraction: 1,
      ),
      items: carouselPictures.map((i) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
              width: MediaQuery.of(context).size.width,
              // margin: const EdgeInsets.symmetric(horizontal: 5.0),
              decoration: BoxDecoration(
                  color: Colors.amber,
                  image: DecorationImage(
                    image: AssetImage('assets/images/carousel_slideshow/$i'),
                    fit: BoxFit.cover,
                  )),
            );
          },
        );
      }).toList(),
    );
  }
}

class HomeScreenCategoriesList extends StatelessWidget {
  const HomeScreenCategoriesList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final TextTheme = Theme.of(context).textTheme;
    return SizedBox(
      height: height * 0.1,
      child: ListView.builder(
        itemCount: categories.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.symmetric(
              horizontal: width * 0.01,
            ),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image(
                      image: AssetImage(
                        'assets/images/categories/${categories[index]}.png',
                      ),
                      height: height * 0.07),
                  Text(
                    categories[index],
                    style: TextTheme.labelMedium,
                  )
                ]),
          );
        },
      ),
    );
  }
}

class HomeScreenUserAddressBar extends StatelessWidget {
  const HomeScreenUserAddressBar({
    super.key,
    required this.height,
    required this.width,
  });

  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height * 0.06,
      width: width,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: addressBarGradientColor,
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
      ),
      child:
          Consumer<AddressProvider>(builder: (context, addressProvider, child) {
        if (addressProvider.fetchedCurrentSelectedAddress &&
            addressProvider.addressPresent) {
          AddressModel selectedAddress = addressProvider.currentSelectedAddress;
          return Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Icon(
                Icons.location_pin,
                color: black,
              ),
              CommonFunctions.blankSpace(
                0,
                width * 0.02,
              ),
              Text(
                'Deliver to ${selectedAddress.name} - ${selectedAddress.town}, ${selectedAddress.state}',
              ),
            ],
          );
        } else {
          return Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Icon(
                Icons.location_pin,
                color: black,
              ),
              CommonFunctions.blankSpace(
                0,
                width * 0.02,
              ),
              Text('Deliver to user - City, State')
            ],
          );
        }
      }),
    );
  }
}

class HomePageAppBar extends StatelessWidget {
  const HomePageAppBar({
    super.key,
    required this.width,
    required this.height,
  });

  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(
            left: width * 0.03,
            right: width * 0.03,
            bottom: height * 0.012,
            top: height * 0.045),
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: appBarGradientColor,
              begin: Alignment.centerLeft,
              end: Alignment.centerRight),
        ),
        child: Row(
          children: [
            SizedBox(
              width: width * 0.81,
              child: TextField(
                onTap: () {
                  log('Redirecting yout ti search  product screen');
                },
                cursorColor: black,
                decoration: InputDecoration(
                  fillColor: white,
                  filled: true,
                  hintText: 'Search Amazon.in',
                  prefixIcon: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.search,
                      color: black,
                    ),
                  ),
                  suffixIcon: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.camera_alt_sharp,
                      color: grey,
                    ),
                  ),
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: width * 0.03),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: BorderSide(
                      color: grey,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: BorderSide(
                      color: grey,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: BorderSide(
                      color: grey,
                    ),
                  ),
                  disabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: BorderSide(
                      color: grey,
                    ),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: BorderSide(
                      color: grey,
                    ),
                  ),
                ),
              ),
            ),
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.mic,
                  color: black,
                ))
          ],
        ));
  }
}
