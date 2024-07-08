import 'package:amazon/utils/theme.dart';
import 'package:amazon/view/auth_screen/sign_inlogic.dart';
import 'package:amazon/view/seller/inventory/inventory_screen.dart';

import 'package:amazon/view/seller/seller_presistant_nav_bar/seller_bottom_nav_bar.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'controller/provider/address_provider.dart';
import 'controller/provider/auth_provider/auth_provider.dart';

import 'firebase_options.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const Amazon());
}

class Amazon extends StatelessWidget {
  const Amazon({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<Authprovider>(create: (_) => Authprovider()),
        ChangeNotifierProvider<AddressProvider>(
            create: (_) => AddressProvider()),
      ],
      child: MaterialApp(
        theme: theme,
        // home: const InventoryScreen(),
        home: const SellerBottomNavBar(),
        // home: const AddProductScreen(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
