import '../data/models/flight.dart';
import '../data/repositories/flight_datarepo.dart';


class FlightDetailsViewModel {
  final FlightRepository _repository = FlightRepository();

  List<Flight> fetchFlights() {
    return _repository.getFlights();
  }
}
