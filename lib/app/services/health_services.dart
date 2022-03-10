import 'package:health/health.dart';

class HealthService {
  static HealthFactory health = HealthFactory();

  Future<List<HealthDataPoint>> fetchHealthData() async {
    List<HealthDataType> types = [
      HealthDataType.STEPS,
      HealthDataType.ACTIVE_ENERGY_BURNED,
    ];
    List<HealthDataAccess> permissions = [
      HealthDataAccess.READ,
      HealthDataAccess.READ,
    ];
    DateTime now = DateTime.now();
    DateTime yesterday = now.subtract(const Duration(days: 1));
    List<HealthDataPoint> healthData = [];
    bool requested =
        await health.requestAuthorization(types, permissions: permissions);
    if (requested) {
      healthData = await health.getHealthDataFromTypes(yesterday, now, types);
      print(healthData);
    } else {
      print("error occured in DataFetch");
      throw AuthenticationRequired();
    }
    return healthData;
  }
}

class AuthenticationRequired extends Error {}
