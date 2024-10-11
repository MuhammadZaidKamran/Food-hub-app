import 'package:food_hub_2/Services/CounterService/counter_service.dart';
import 'package:stacked/stacked_annotations.dart';

final locator = StackedLocator.instance;

Future<void> setupLocator({
  String? environment,
  EnvironmentFilter? environmentFilter,
}) async{
  //Register environments
  locator.registerEnvironment(
    environment: environment,
    environmentFilter: environmentFilter,
  );

  //Register dependencies
  locator.registerSingleton(CounterService());
}