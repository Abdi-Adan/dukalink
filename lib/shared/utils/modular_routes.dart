import 'package:flutter_modular/flutter_modular.dart';

import '../../feature/home/home_screen.dart';
import '../../feature/restaurant/all_restaurant.dart';
import '../../feature/splash/splash_screen.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
        // WildcardRoute(child: (context, args) => NotFoundPage()),
        ChildRoute('/', child: (context, args) => SplashPage()),
        ChildRoute('/home', child: (context, args) => const HomeScreen()),
        ChildRoute('/all-restaurants',
            child: (context, args) => const AllRestaurantScreen()),
        // ChildRoute('/restaurant-detail',
        //     child: (context, args) => RestaurantDetailScreen(
        //         restaurantCode: args.queryParams['restaurantCode'] ?? "")),
        // ChildRoute('/dish-detail',
        //     child: (context, args) => DishScreen(dish: args.data)),
      ];
}
