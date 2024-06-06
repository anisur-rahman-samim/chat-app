import 'package:flutter/material.dart';

final List<Color> colors = [
  Colors.red,
  Colors.green,
  Colors.blue,
  Colors.orange,
  Colors.purple,
  Colors.pink,
  Colors.yellow,
  Colors.cyan,
  Colors.indigo,
  Colors.lime,
  Colors.teal,
  Colors.brown,
  Colors.grey,
  Colors.amber,
  Colors.deepPurple,
  Colors.lightBlue,
  Colors.lightGreen,
  Colors.deepOrange,
  Colors.blueGrey,
  Colors.redAccent,
  Colors.greenAccent,
  Colors.blueAccent,
  Colors.orangeAccent,
  Colors.purpleAccent,
  Colors.pinkAccent,
  Colors.yellowAccent
];

final Map<String, Color> letterColors = {
  'A': colors[0],
  'B': colors[1],
  'C': colors[2],
  'D': colors[3],
  'E': colors[4],
  'F': colors[5],
  'G': colors[6],
  'H': colors[7],
  'I': colors[8],
  'J': colors[9],
  'K': colors[10],
  'L': colors[11],
  'M': colors[12],
  'N': colors[13],
  'O': colors[14],
  'P': colors[15],
  'Q': colors[16],
  'R': colors[17],
  'S': colors[18],
  'T': colors[19],
  'U': colors[20],
  'V': colors[21],
  'W': colors[22],
  'X': colors[23],
  'Y': colors[24],
  'Z': colors[25],
};


class ColorfulText extends StatelessWidget {
  final String text;

  ColorfulText(this.text);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: text.split('').map((char) {
        return Text(
          char,
          style: TextStyle(
            color: letterColors[char.toUpperCase()] ?? Colors.black, // default to black if char is not a letter
            fontSize: 24,
          ),
        );
      }).toList(),
    );
  }
}

class ColorfulCircleAvatarText extends StatelessWidget {
  final String text;

  ColorfulCircleAvatarText(this.text);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: text.split('').map((char) {
        final color = letterColors[char.toUpperCase()] ?? Colors.black;
        return CircleAvatar(
          radius: 30,
          backgroundColor: color.withOpacity(0.5),
          child: Text(
            char.toUpperCase().toString(),
            style: TextStyle(
              color: color,
              fontSize: 24,
            ),
          ),
        );
      }).toList(),
    );
  }
}