import 'package:flutter_store_demo/core/constants/api_contants.dart';
import 'package:flutter_store_demo/core/network/client.dart';
import 'package:flutter_store_demo/core/network/local_storage/local_storage.dart';
import 'package:flutter_store_demo/features/home/data/repo/home_repo.dart';
import 'package:injectable/injectable.dart';

@module
abstract class NetworkModule {
  @lazySingleton
  LocalStorage get storage => LocalStorage.instance;

  @lazySingleton
  ApiClient get apiClient => ApiClient(ApiConstants.baseUrl, storage: storage);


  @lazySingleton
  IHomeRepo get homeRepo => HomeRepo(client: apiClient);
}
