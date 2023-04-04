import 'package:senior_project_group6/core/globals/constants.dart';
import 'package:senior_project_group6/core/models/data_response.dart';
import 'package:senior_project_group6/core/utils/mixin.dart';
import 'package:senior_project_group6/features/auth/model/user.dart';

abstract class ProfileApiProvider<T> {
  Future<DataResponse> getUser(String studenId);
}

class ProfileApiProviderImpl
    with ApiProviderMixin
    implements ProfileApiProvider<MainUser> {
  @override
  Future<DataResponse> getUser(String studenId) async {
    final object = await provideData(endPoint: '$usersEndpoint/$studenId');
    return DataResponse.fromJson(object);
  }
}
