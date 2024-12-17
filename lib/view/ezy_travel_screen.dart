import 'package:flutter/material.dart';

class EzyTravelScreen extends StatelessWidget {
  const EzyTravelScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar:AppBar(
        backgroundColor: Colors.lightGreen[300],
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          "Ezy Travel",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: false,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSearchCard(),
          const SizedBox(height: 10),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              "851 Flight Found",
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
          ),
          const SizedBox(height: 10),
          _buildFlightDetailsCard(),
        ],
      ),
    );
  }

  Widget _buildSearchCard() {
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(color: Colors.grey.withOpacity(0.2), blurRadius: 4)
        ],
      ),
      child: Column(
        children: [
          const Text(
            "BLR - Bengaluru to DXB - Dubai",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 4),
          const Text(
            "Departure: Sat, 23 Mar - Return: Sat, 23 Mar",
            style: TextStyle(fontSize: 12, color: Colors.grey),
          ),
          const SizedBox(height: 4),
          RichText(
            text: const TextSpan(
              style: TextStyle(fontSize: 12),
              children: [
                TextSpan(
                  text: "(Round Trip) ",
                  style: TextStyle(color: Colors.orange),
                ),
                TextSpan(
                  text: "Modify Search",
                  style: TextStyle(color: Colors.green),
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildOption("Sort", Icons.keyboard_arrow_down),
              const Text("Non - Stop",
                  style: TextStyle(fontWeight: FontWeight.bold)),
              _buildOption("Filter", Icons.tune),
            ],
          ),
          const SizedBox(height: 12),
         Row(
           children: [
             Row(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: [
                 _buildDateChip("Mar 22 - Mar 23", "From AED 641", false),
                 _buildDateChip("Mar 23 - Mar 24", "From AED 721", true),
                 _buildDateChip("Mar 24 - Mar 25", "From AED 750", false),
               ],
             ),
           ],
         )
        ],
      ),
    );
  }

  Widget _buildFlightDetailsCard() {
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(color: Colors.grey.withOpacity(0.2), blurRadius: 4)
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildFlightRow(
            title: "Onward - Garuda Indonesia",
            timeFrom: "14:35",
            locationFrom: "BLR - Bengaluru",
            duration: "4h 30m",
            stops: "2 Stops",
            timeTo: "21:55",
            locationTo: "DXB - Dubai",
            price: "AED 409",
          ),
          const Divider(),
          _buildFlightRow(
            title: "Return - Garuda Indonesia",
            timeFrom: "21:55",
            locationFrom: "DXB - Dubai",
            duration: "4h 30m",
            stops: "",
            timeTo: "14:35",
            locationTo: "BLR - Bengaluru",
            price: "AED 359",
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildTag("Cheapest", Colors.green),
              _buildTag("Refundable", Colors.blue),
              const Text(
                "Flight Details >",
                style: TextStyle(color: Colors.orange),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildOption(String text, IconData icon) {
    return Row(
      children: [
        Text(text, style: const TextStyle(fontWeight: FontWeight.bold)),
        Icon(icon, size: 16),
      ],
    );
  }

  Widget _buildDateChip(String date, String price, bool isSelected) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: isSelected ? Colors.green[50] : Colors.grey[200],
        border: Border.all(
          color: isSelected ? Colors.green : Colors.grey[300]!,
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          Text(
            date,
            style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: isSelected ? Colors.green : Colors.black),
          ),
          Text(price, style: const TextStyle(fontSize: 10)),
        ],
      ),
    );
  }

  Widget _buildFlightRow({
    required String title,
    required String timeFrom,
    required String locationFrom,
    required String duration,
    required String stops,
    required String timeTo,
    required String locationTo,
    required String price,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title,
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildFlightTime(timeFrom, locationFrom),
            Column(
              children: [
                const Icon(Icons.flight, color: Colors.green),
                Text(duration, style: const TextStyle(fontSize: 10)),
                Text(stops,
                    style: const TextStyle(fontSize: 10, color: Colors.grey)),
              ],
            ),
            _buildFlightTime(timeTo, locationTo),
          ],
        ),
        Align(
          alignment: Alignment.centerRight,
          child: Text(
            price,
            style: const TextStyle(
                color: Colors.green, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }

  Widget _buildFlightTime(String time, String location) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(time,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        Text(location,
            style: const TextStyle(fontSize: 12, color: Colors.grey)),
      ],
    );
  }

  Widget _buildTag(String text, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        border: Border.all(color: color),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        text,
        style: TextStyle(color: color, fontSize: 12),
      ),
    );
  }
}
