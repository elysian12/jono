import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:geolocator/geolocator.dart';
import 'package:jono/data/repositories/geolocation/geolocation_repository.dart';

part 'geolocation_event.dart';
part 'geolocation_state.dart';

class GeolocationBloc extends Bloc<GeolocationEvent, GeolocationState> {
  final GeolocationRepository _geolocationRepository;
  GeolocationBloc({required GeolocationRepository geolocationRepository})
      : _geolocationRepository = geolocationRepository,
        super(GeolocationLoadingState()) {
    on<GeolocationEvent>((event, emit) async {
      if (event is LoadGeolocationEvent) {
        final position = await _geolocationRepository.getCurrentLocation();
        add(UpdateGeolocationEvent(position: position!));
      } else if (event is UpdateGeolocationEvent) {
        emit(GeolocationLoadedState(position: event.position));
      }
    });
  }
}
