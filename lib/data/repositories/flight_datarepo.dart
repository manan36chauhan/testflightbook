import '../models/flight.dart';

class FlightRepository {
  List<Flight> getFlights() {
    return [
      Flight(onwardTime: '14:35', returnTime: '21:55', price: 'AED 409'),
      Flight(onwardTime: '15:30', returnTime: '22:00', price: 'AED 450'),
      Flight(onwardTime: '16:00', returnTime: '23:00', price: 'AED 500'),
    ];
  }
}
