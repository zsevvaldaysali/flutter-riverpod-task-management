import 'package:flutter_riverpod_task_management/common/helpers/db_helper.dart';
import 'package:flutter_riverpod_task_management/common/models/user_model.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final userProvider = StateNotifierProvider<UserState, List<UserModel>>((ref) {
  return UserState();
});

class UserState extends StateNotifier<List<UserModel>> {
  UserState() : super([]);
  void refresh() async {
    final data = await DBHelper.getUsers();
    state = data.map((e) => UserModel.fromJson(e)).toList();
  }
}
