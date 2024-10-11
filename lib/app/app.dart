

import 'package:food_hub_2/Services/CounterService/counter_service.dart';
import 'package:stacked/stacked_annotations.dart';

@StackedApp(
  routes: [],
  dependencies: [
    Singleton(classType: CounterService),
  ],
)

class App {}