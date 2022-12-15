import 'package:uplink/app/app.dart';
import 'package:uplink/bootstrap.dart';
import 'package:uplink/dependency/dependency_injection.dart';

void main() {
  registerDependencies();
  bootstrap(() => const App());
}
