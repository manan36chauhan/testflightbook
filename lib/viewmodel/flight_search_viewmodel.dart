import 'package:flutter/material.dart';

class FlightSearchScreen extends StatelessWidget {
  const FlightSearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green.shade200,
        title: Text('Search Flights'),
        centerTitle: false,
        elevation: 0,
        leading: Icon(Icons.arrow_back),
        actions: [
          Icon(Icons.menu),
          SizedBox(width: 10),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header Image and Tabs
            _buildHeaderSection(),

            SizedBox(height: 20),

            // Flight Search Form
            _buildSearchForm(),

            SizedBox(height: 20),

            // Travel Inspirations Section
            _buildTravelInspirations(),

            SizedBox(height: 20),

            // Flight & Hotel Packages
            _buildFlightAndHotelPackage(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeaderSection() {
    return Stack(
      children: [
        // Background Image
        Container(
          height: 200,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/flight_header.jpg'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        // Tabs
        Positioned(
          bottom: 10,
          left: 20,
          right: 20,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildTab('Round Trip', false),
              _buildTab('One Way', true),
              _buildTab('Multi-city', false),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildTab(String title, bool isActive) {
    return Expanded(
      child: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          color: isActive ? Colors.green : Colors.white,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Text(
          title,
          style: TextStyle(
            color: isActive ? Colors.white : Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget _buildSearchForm() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          _buildInputField(Icons.flight_takeoff, 'From'),
          SizedBox(height: 10),
          _buildInputField(Icons.location_on, 'To'),
          SizedBox(height: 10),
          Row(
            children: [
              Expanded(
                child: _buildDateField('Departure', 'Sat, 23 Mar - 2024'),
              ),
              SizedBox(width: 10),
              Expanded(
                child: _buildDateField('Return', 'Sat, 23 Mar - 2024',
                    isDisabled: true),
              ),
            ],
          ),
          SizedBox(height: 10),
          Row(
            children: [
              Expanded(
                child: _buildDropdownField('Travelers', '1 Passenger'),
              ),
              SizedBox(width: 10),
              Expanded(
                child: _buildDropdownField('Cabin Class', 'Economy Class'),
              ),
            ],
          ),
          SizedBox(height: 20),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green,
              minimumSize: Size(double.infinity, 50),
            ),
            onPressed: () {},
            child: Text('Search Flights'),
          ),
        ],
      ),
    );
  }

  Widget _buildInputField(IconData icon, String placeholder) {
    return TextField(
      decoration: InputDecoration(
        prefixIcon: Icon(icon, color: Colors.green),
        hintText: placeholder,
        filled: true,
        fillColor: Colors.grey.shade100,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }

  Widget _buildDateField(String title, String date, {bool isDisabled = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: TextStyle(color: Colors.grey.shade600)),
        SizedBox(height: 5),
        Container(
          padding: EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: isDisabled ? Colors.grey.shade300 : Colors.grey.shade100,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            children: [
              Text(date),
              Spacer(),
              Icon(Icons.calendar_today, size: 18, color: Colors.green),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildDropdownField(String title, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: TextStyle(color: Colors.grey.shade600)),
        SizedBox(height: 5),
        Container(
          padding: EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.grey.shade100,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            children: [
              Text(value),
              Spacer(),
              Icon(Icons.arrow_drop_down, color: Colors.green),
            ],
          ),
        ),
      ],
    );
  }

  // Travel Inspirations Section
  Widget _buildTravelInspirations() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Text('Travel Inspirations',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        ),
        SizedBox(height: 10),
        SizedBox(
          height: 150,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              _buildTravelTile(
                  'assets/images/saudi.jpg', 'Saudi Arabia', 'From AED867'),
              _buildTravelTile(
                  'assets/images/kuwait.jpg', 'Kuwait', 'From AED867'),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildTravelTile(String image, String title, String price) {
    return Container(
      margin: EdgeInsets.only(left: 20),
      width: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(image: AssetImage(image), fit: BoxFit.cover),
      ),
      child: Container(
        padding: EdgeInsets.all(10),
        alignment: Alignment.bottomLeft,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          gradient: LinearGradient(
              colors: [Colors.black54, Colors.transparent],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter),
        ),
        child: Text('$title\n$price',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
      ),
    );
  }

  Widget _buildFlightAndHotelPackage() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Flight & Hotel Packages',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          SizedBox(height: 10),
          Container(
            height: 150,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/hotel_package.jpg'),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ],
      ),
    );
  }
}
