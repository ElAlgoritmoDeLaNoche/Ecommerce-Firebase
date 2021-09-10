import 'package:ecommerce_firebase/simple_bloc_observer.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ecommerce_firebase/blocs/cart/cart_bloc.dart';
import 'package:ecommerce_firebase/blocs/category/category_bloc.dart';
import 'package:ecommerce_firebase/blocs/checkout/checkout_bloc.dart';
import 'package:ecommerce_firebase/blocs/product/product_bloc.dart';
import 'package:ecommerce_firebase/blocs/wishlist/wishlist_bloc.dart';
import 'package:ecommerce_firebase/config/theme.dart';
import 'package:ecommerce_firebase/config/app_router.dart';
import 'package:ecommerce_firebase/repositories/category/category_repository.dart';
import 'package:ecommerce_firebase/repositories/checkout/checkout_repository.dart';
import 'package:ecommerce_firebase/screens/screens.dart';

import 'repositories/product/product_repository.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Bloc.observer = SimpleBlocObserver();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => CartBloc()..add(CartStarted())),
        BlocProvider(
          create: (context) => CheckoutBloc(
            cartBloc: context.read<CartBloc>(),
            checkoutRepository: CheckoutRepository(),
          ),
        ),
        BlocProvider(create: (_) => WishlistBloc()..add(WishlistStarted())),
        BlocProvider(
          create: (_) => CategoryBloc(
            categoryRepository: CategoryRepository(),
          )..add(LoadCategories()),
        ),
        BlocProvider(
          create: (_) => ProductBloc(
            productRepository: ProductRepository(),
          )..add(LoadProducts()),
        )
      ],
      child: MaterialApp(
        title: 'Zero To Unicorn',
        debugShowCheckedModeBanner: false,
        theme: theme(),
        onGenerateRoute: AppRouter.onGenerateRoute,
        initialRoute: SplashScreen.routeName,
      ),
    );
  }
}
