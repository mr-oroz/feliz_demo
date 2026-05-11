// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter_store_demo/core/network/client.dart' as _i204;
import 'package:flutter_store_demo/core/network/local_storage/local_storage.dart'
    as _i980;
import 'package:flutter_store_demo/core/network/network_module.dart' as _i341;
import 'package:flutter_store_demo/features/home/data/repo/home_repo.dart'
    as _i726;
import 'package:flutter_store_demo/features/home/presentation/blocs/product_bloc/product_bloc.dart'
    as _i521;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final networkModule = _$NetworkModule();
    gh.lazySingleton<_i980.LocalStorage>(() => networkModule.storage);
    gh.lazySingleton<_i204.ApiClient>(() => networkModule.apiClient);
    gh.lazySingleton<_i726.IHomeRepo>(() => networkModule.homeRepo);
    gh.factory<_i521.ProductBloc>(
        () => _i521.ProductBloc(gh<_i726.IHomeRepo>()));
    return this;
  }
}

class _$NetworkModule extends _i341.NetworkModule {}
