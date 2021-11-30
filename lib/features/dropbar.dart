import 'package:flutter/material.dart';

class yearDrop extends StatefulWidget {
  const yearDrop({Key? key}) : super(key: key);

  @override
  _yearDropState createState() => _yearDropState();
}

class _yearDropState extends State<yearDrop> {
  @override
  var _year = [
    '1980',
    '1981',
    '1982',
    '1983',
    '1984',
    '1985',
    '1986',
    '1987',
    '1988',
    '1989',
    '1990',
    '1991',
    '1992',
    '1993',
    '1994',
    '1995',
    '1996',
    '1997',
    '1998',
    '1999',
    '2000',
    '2001',
    '2002',
    '2003',
    '2004',
    '2005',
    '2006',
    '2007',
    '2008',
    '2009',
    '2010',
    '2011',
    '2012',
    '2013',
    '2014',
    '2015',
    '2016',
    '2017',
    '2018',
    '2019',
    '2020',
    '2021',
    '2022',
  ];

  String dropValue = '2000';
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, bottom: 8.0, right: 30.0),
      child: DropdownButton<String>(
        value: dropValue,
        icon: Icon(Icons.arrow_drop_down_sharp),
        iconSize: 25,
        style: TextStyle(
          fontFamily: 'Pacifico',
          fontSize: 28,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
        underline: Container(
          height: 2,
          color: Colors.orange.shade200,
        ),
        onChanged: (String? newValue) {
          setState(() {
            dropValue = newValue!;
          });
        },
        items: _year.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
      ),
    );
  }
}
