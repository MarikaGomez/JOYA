import 'package:flutter/material.dart';
import 'package:joya/pages/login/cubit/login_page.dart';
import 'package:joya/pages/plant/cubit/sensor_detail_page.dart';
import 'package:joya/pages/plant/sensor_detail_view.dart';

class ItemComponent extends StatelessWidget {

  final String name;
  final String id;
  // final String type;
  // final String img;
  final String serial_number;
  // final String location;
  final Color backgroundColor;
  final destination;

  const ItemComponent({Key? key,
    required this.name,
    required this.id,
    // required this.type,
    // required this.img,
    required this.serial_number,
    // required this.location,
    required this.backgroundColor,
    this.destination,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 2, horizontal: 16),
      width: size.width * 0.45,
      child: GestureDetector(
        onTap: (){Navigator.push(
            context,
            MaterialPageRoute(
                builder:(
                    context) => SensorPage(sensorId: id)
            ));
        },
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: backgroundColor,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(10),
                  topLeft: Radius.circular(10),
                ),
              ),
              child: Container(
                alignment: Alignment.center,
                child: Text(
                  name.toUpperCase(),
                  style: const TextStyle(fontSize: 12.0),
                ),
              ),
            ),
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
                // child: Image.network(
                //   img,
                //   height: double.infinity,
                //   width: double.infinity,
                //   alignment: Alignment.center,
                //   fit: BoxFit.cover,
                // ),
              ),
            ),
          ],
        ),

      ),
    );
  }
}
