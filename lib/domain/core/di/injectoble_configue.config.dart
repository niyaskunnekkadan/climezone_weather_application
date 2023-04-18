// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:clime_zone/application/add_city_bloc/add_city_bloc.dart' as _i7;
import 'package:clime_zone/application/bloc/home_bloc_bloc.dart' as _i9;
import 'package:clime_zone/application/day_hour_forecast/day_hour_forecast_bloc.dart'
    as _i8;
import 'package:clime_zone/domain/add_city/add_city_service.dart' as _i3;
import 'package:clime_zone/domain/home/home_service.dart' as _i5;
import 'package:clime_zone/infrastructure/add_city/i_add_city.dart' as _i4;
import 'package:clime_zone/infrastructure/home/i_home_service.dart' as _i6;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

extension GetItInjectableX on _i1.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.lazySingleton<_i3.AddCityService>(() => _i4.IAddCity());
    gh.lazySingleton<_i5.HomeService>(() => _i6.IHomeService());
    gh.factory<_i7.AddCityBloc>(
        () => _i7.AddCityBloc(gh<_i3.AddCityService>()));
    gh.factory<_i8.DayHourForecastBloc>(
        () => _i8.DayHourForecastBloc(gh<_i5.HomeService>()));
    gh.factory<_i9.HomeBloc>(() => _i9.HomeBloc(gh<_i5.HomeService>()));
    return this;
  }
}
