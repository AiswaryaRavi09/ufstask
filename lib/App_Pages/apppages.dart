
import 'package:get/get_navigation/src/routes/get_route.dart';

import '../App-Routes/approutes.dart';
import '../Assessment/View/RiskAssessmentViewScreen.dart';

class AppPages {
  static List<GetPage> appPages = <GetPage>[
  GetPage(
  name: AppRoute.riskassessment,
  page: () =>  RiskAssessmentViewScreen(),
  ),
  ];
}