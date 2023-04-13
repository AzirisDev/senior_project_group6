import 'dart:convert';
import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:senior_project_group6/core/services/cache_storage.dart';
import 'package:senior_project_group6/features/create_request/cubit/create_request_state.dart';
import 'package:senior_project_group6/features/create_request/model/service.dart';
import 'package:senior_project_group6/features/requests/common/model/service_request.dart';
import 'package:senior_project_group6/features/requests/common/repositories/requests_repository.dart';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:uuid/uuid.dart';

abstract class CreateRequestCubit extends Cubit<CreateRequestState> {
  CreateRequestCubit(CreateRequestState state) : super(state);
  void getServices();

  void createRequest({
    String description,
    String location,
    String requestType,
    String title,
    List<File> selectedImages,
  });
}

class CreateRequestCubitImpl extends CreateRequestCubit {
  final RequestsRepository repository;
  final CacheStorage cacheStorage;
  final FirebaseStorage firebaseStorage;

  CreateRequestCubitImpl({
    required this.repository,
    required this.cacheStorage,
    required this.firebaseStorage,
  }) : super(CreateRequestState());

  @override
  void getServices() async {
    emit(GetServicesLoadingState());

    final data = await repository.getServices();
    if (data?.object != null) {
      final List<Service> result = [];

      data?.object.data.forEach((element) {
        result.add(Service.fromJson(element));
      });

      emit(GetServicesSuccessState(services: result));
    } else {
      emit(GetServicesErrorState(data?.errorMessage));
    }
  }

  @override
  void createRequest({
    String description = '',
    String location = '',
    String requestType = '',
    String title = '',
    List<File> selectedImages = const [],
  }) async {
    emit(CreateRequestLoadingState());

    final downloadUrls = _uploadImages(selectedImages);

    final studentId = await cacheStorage.getUserId();

    final data = await repository.createRequest(
      description,
      location,
      requestType,
      'ACTIVE',
      title,
      studentId.toString(),
      downloadUrls,
    );

    if (data?.object != null) {
      emit(CreateRequestSuccessState(request: ServiceRequest.fromJson(data?.object.data)));
    } else {
      emit(CreateRequestErrorState(data.errorMessage));
    }
  }

  List<String> _uploadImages(List<File> imageList) {
    List<String> downloadURLs = [];
    for (int i = 0; i < imageList.length; i++) {
      String downloadURL = encodeImage(imageList[i]);
      downloadURLs.add(downloadURL);
    }
    return downloadURLs;
  }

  String encodeImage(File image) {
    List<int> imageBytes = image.readAsBytesSync();
    return base64Encode(imageBytes);
  }
}
