import 'package:jono/common/typedefs/typedefs.dart';
import 'package:jono/data/models/place_autocomplete_model.dart';
import 'package:jono/data/models/place_model.dart';

abstract class BasePlacesRepository {
  FutureResult<List<PlaceAutoComplete>> getAutoComplete(String searchInput);
  FutureResult<Place> getPlace(String placeId);
}
