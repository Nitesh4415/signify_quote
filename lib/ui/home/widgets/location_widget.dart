import 'package:flutter/cupertino.dart';


class LocationWidget extends StatelessWidget {
  const LocationWidget({
    required this.location,
    Key? key,
  }) : super(key: key);

  final String location;



  @override
  Widget build(BuildContext context) {

    return  Column(
        children: [
          Text(
            location,
            style: const TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.w700,
            ),
          ),
          const Text(
            "Please check your internet connection within your area",
            style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.w700,
            ),
          ),

        ],
      );

  }

}