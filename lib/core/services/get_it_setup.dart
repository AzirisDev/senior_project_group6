import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

void setup() async {
  final directory = await getApplicationDocumentsDirectory();
  Hive.init(directory.path);
}
