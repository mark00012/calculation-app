import 'package:flutter/material.dart';

class BillSplitter extends StatefulWidget {
  const BillSplitter({super.key});

  @override
  State<BillSplitter> createState() => _BillSplitterState();
}

class _BillSplitterState extends State<BillSplitter> {
  int _tipPercentage = 0;
  int _personCounter = 1;
  double _billAmount = 0.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.1),
        alignment: Alignment.center,
        color: Colors.white,
        child: ListView(
          scrollDirection: Axis.vertical,
          padding: const EdgeInsets.all(20.5),
          children: <Widget>[
            Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                  color: Color.fromARGB(255, 237, 221, 239),
                  borderRadius: BorderRadius.circular(12.0)),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const <Widget>[
                    Text(
                      "Total per person",
                      style: TextStyle(
                        color: Colors.deepPurple,
                        fontWeight: FontWeight.normal,
                        fontSize: 15.0,
                      ),
                    ),
                    // SizedBox(
                    //   height: 6,
                    // ),
                    Padding(
                      padding: EdgeInsets.all(12.0),
                      child: Text(
                        "\$123",
                        style: TextStyle(
                          fontSize: 34.9,
                          fontWeight: FontWeight.bold,
                          color: Colors.deepPurple,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(12.0),
              margin: const EdgeInsets.only(top: 20.0),
              decoration: BoxDecoration(
                  color: Colors.transparent,
                  border: Border.all(
                    color: Colors.blueGrey.shade100,
                    style: BorderStyle.solid,
                  ),
                  borderRadius: BorderRadius.circular(12.0)),
              child: Column(
                children: <Widget>[
                  TextField(
                      keyboardType: const TextInputType.numberWithOptions(
                        decimal: true,
                      ),
                      style: const TextStyle(
                        color: Colors.grey,
                      ),
                      decoration: const InputDecoration(
                          prefix: Text("Bill Amount"),
                          prefixIcon: Icon(Icons.attach_money)),
                      onChanged: (String value) {
                        try {
                          _billAmount = double.parse(value);
                        } catch (execption) {
                          _billAmount = 0.0;
                        }
                      }),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "split,",
                        style: TextStyle(
                          color: Colors.grey.shade700,
                        ),
                      ),
                      Row(
                        children: <Widget>[
                          InkWell(
                            onTap: () {
                              setState(() {
                                if (_personCounter > 1) {
                                  _personCounter--;
                                } else {}
                              });
                            },
                            child: Container(
                              height: 40.0,
                              width: 40.0,
                              margin: const EdgeInsets.all(10.0),
                              decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 237, 221, 239),
                                  borderRadius: BorderRadius.circular(7.0)),
                              child: const Center(
                                child: Text(
                                  "-",
                                  style: TextStyle(
                                    color: Colors.deepPurple,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 19.0,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Text(
                            "$_personCounter",
                            style: TextStyle(
                              color: Colors.deepPurple,
                              fontSize: 17.0,
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              setState(() {
                                _personCounter++;
                              });
                            },
                            child: Container(
                              height: 40.0,
                              width: 40.0,
                              margin: const EdgeInsets.all(10.0),
                              decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 237, 221, 239),
                                  borderRadius: BorderRadius.circular(7.0)),
                              child: const Center(
                                child: Text(
                                  "+",
                                  style: TextStyle(
                                    color: Colors.deepPurple,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 19.0,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Tip",
                        style: TextStyle(
                          color: Colors.grey.shade700,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: Text(
                          "\$$_tipPercentage",
                          style: TextStyle(
                            color: Colors.deepPurple,
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      )
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Text(
                        "$_tipPercentage%",
                        style: TextStyle(
                            color: Colors.deepPurple,
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      ),
                      Slider(
                          min: 0,
                          max: 100,
                          activeColor: Colors.deepPurple,
                          inactiveColor: Colors.grey,
                          divisions: 10,
                          value: _tipPercentage.toDouble(),
                          onChanged: ((double value) {
                            setState(() {
                              _tipPercentage = value.round();
                            });
                          }))
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

