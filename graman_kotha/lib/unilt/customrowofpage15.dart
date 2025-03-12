import 'package:flutter/material.dart';

class Customrowofpage15 extends StatelessWidget {
  final String maintext;
  const Customrowofpage15({super.key, required this.maintext});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          width: 20,
        ),
        Container(
          height: 48,
          width: 150,
          decoration: BoxDecoration(
              color: Colors.grey[200], borderRadius: BorderRadius.circular(20)),
          child: Center(
              child: Text(
            maintext,
            style: TextStyle(fontSize: 17, fontWeight: FontWeight.w700),
          )),
        ),
        SizedBox(
          width: 20,
        ),
        Icon(
          Icons.volume_up,
          color: Colors.grey,
        ),
        Text(
          " - - - - - - - - - - - - - - - - - - - - - - - - - - ",
          style: TextStyle(color: Colors.grey),
        )
      ],
    );
  }
}

class customrowmakebystart extends StatelessWidget {
  final String maintext;
  const customrowmakebystart({super.key, required this.maintext});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          width: 20,
        ),
        Text(
          " - - - - - - - - - - - - - - - - - - - - - - - - - - ",
          style: TextStyle(color: Colors.grey),
        ),
        Icon(
          Icons.volume_up,
          color: Colors.grey,
        ),
        SizedBox(
          width: 20,
        ),
        Container(
          height: 48,
          width: 150,
          decoration: BoxDecoration(
              color: Colors.grey[200], borderRadius: BorderRadius.circular(20)),
          child: Center(
              child: Text(
            maintext,
            style: TextStyle(fontSize: 17, fontWeight: FontWeight.w700),
          )),
        ),
      ],
    );
  }
}
