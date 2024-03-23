import 'dart:io';

// Abstract class for MotorVehicles representing motor vehicles
abstract class MotorVehicle {
  void start();
  void stop();
}

// Interface for vehicles with wheels
abstract class VehicleWithWheels {
  void drive();
}

// Car class implementing MotorVehicle and VehicleWithWheels interfaces
class Car extends MotorVehicle implements VehicleWithWheels {
  @override
  void start() {
    print('Car started');
  }

  @override
  void stop() {
    print('Car stopped');
  }

  @override
  void drive() {
    print('Car driving');
  }
}

// Method to initialize a MotorVehicle instance from a file
MotorVehicle initializeVehicleFromFile(String filePath) {
  String vehicleType = File(filePath).readAsStringSync().trim().toLowerCase();
  switch (vehicleType) {
    case 'car':
      return Car();
    default:
      throw Exception('Invalid vehicle type in file');
  }
}

// Method demonstrating the use of a loop
void demonstrateLoop() {
  print('Loop demonstration:');
  for (int i = 0; i < 3; i++) {
    print('Iteration $i');
  }
}

void main() {
  try {
    // Initializing vehicle instance from file
    MotorVehicle vehicle = initializeVehicleFromFile('vehicle.txt');
    
    // Start, stop, and drive the vehicle
    vehicle.start();
    vehicle.drive();
    vehicle.stop();
    
    // Demonstrating the use of a loop
    demonstrateLoop();
  } catch (e) {
    print('Error: $e');
  }
}
