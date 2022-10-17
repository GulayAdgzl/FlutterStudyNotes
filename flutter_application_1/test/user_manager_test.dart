import 'package:flutter_full_learn/202/303/generic_learn.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  setUp(() {});

  test('Sample Test', () {
    final users = [
      GenericUser('x', '1', 2),
      GenericUser('x', '2', 9),
      GenericUser('x', '1', 2),
    ];
    final result =
        UserManagemnt(AdminUser('name', 'w', 5, 44)).calculateMoney(users);
    UserManagemnt(AdminUser('name', '1', 2, 33)).showNames(users);
    expect(result, 40);
  });
}
