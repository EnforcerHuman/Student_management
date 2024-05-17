import 'package:hive/hive.dart';
part 'model.g.dart';

@HiveType(typeId: 1)
class studentmodel {
  @HiveField(0)
  String name;
  @HiveField(1)
  String age;
  @HiveField(2)
  String email;
  @HiveField(3)
  String phone;
  studentmodel({
    required this.age,
    required this.name,
    required this.email,
    required this.phone,
  });
}
