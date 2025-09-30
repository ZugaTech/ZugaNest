import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class TransportBookingScreen extends StatefulWidget {
  const TransportBookingScreen({super.key});

  @override
  _TransportBookingScreenState createState() => _TransportBookingScreenState();
}

class _TransportBookingScreenState extends State<TransportBookingScreen> {
  int _passengerCount = 1;
  final double _basePrice = 1000.0;

  double get totalPrice =>
      _basePrice * (_passengerCount > 1 ? _passengerCount * 0.8 : 1);
  double get pricePerPerson => totalPrice / _passengerCount;

  Future<void> _bookRide() async {
    await FirebaseFirestore.instance.collection('bookings').add({
      'passengerCount': _passengerCount,
      'totalPrice': totalPrice,
      'timestamp': FieldValue.serverTimestamp(),
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Ride booked for $_passengerCount passengers')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          const Text('Number of Passengers:'),
          Slider(
            value: _passengerCount.toDouble(),
            min: 1,
            max: 5,
            divisions: 4,
            label: _passengerCount.toString(),
            onChanged: (value) =>
                setState(() => _passengerCount = value.toInt()),
          ),
          Text('Total Price: ₦${totalPrice.toStringAsFixed(2)}'),
          Text('Price per Person: ₦${pricePerPerson.toStringAsFixed(2)}'),
          const SizedBox(height: 20),
          ElevatedButton(onPressed: _bookRide, child: const Text('Book Now')),
        ],
      ),
    );
  }
}
