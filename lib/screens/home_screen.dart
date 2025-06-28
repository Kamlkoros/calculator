import 'package:calculator/components/my_button.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var userInput = '';
  var answer = '';
  
  ShuntingYardParser parser = ShuntingYardParser();
  Expression? expression;

  void equalPress(){
    try{
    expression = parser.parse(userInput);
    ContextModel context = ContextModel();
    setState(() {
      answer = expression?.evaluate(EvaluationType.REAL, context).toString() ?? '';
    });
    }
    catch(e){
      setState(() {
        answer = 'Error';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(20),
                alignment: Alignment.bottomRight,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      userInput,
                      style: const TextStyle(fontSize: 24, color: Colors.white),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      answer,
                      style: const TextStyle(fontSize: 48, color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            
            Row(
              children: [
                MyButton(text: 'AC',onPressed: () {
                  setState(() {
                userInput = '';
                answer = '';
                  });
                },),
                MyButton(text: '+/-',onPressed: () {
                  setState(() {
                    if (userInput.isNotEmpty) {
                      if (userInput.startsWith('-')) {
                        userInput = userInput.substring(1);
                      } else {
                        userInput = '-$userInput';
                      }
                    }
                  });
                },),
                MyButton(text: '%',onPressed: () {
                  setState(() {
                    userInput += '%';
                  });
                },),
                MyButton(text: '/', buttonColor: Colors.orange,onPressed: () {
                  setState(() {
                    userInput += '/';
                  });
                },),
              ],
            ),
            Row(
              children: [
                MyButton(text: '7',onPressed: () {
                  setState(() {
                    userInput += '7';
                  });
                },),
                MyButton(text: '8',onPressed: () {
                  setState(() {
                    userInput += '8';
                  });
                },),
                MyButton(text: '9',onPressed: () {
                  setState(() {
                    userInput += '9';
                  });
                },),
                MyButton(text: '*', buttonColor: Colors.orange,onPressed: () {
                  setState(() {
                    userInput += '*';
                  });
                },),
              ],
            ),
            Row(
              children: [
                MyButton(text: '4',onPressed: () {
                  setState(() {
                    userInput += '4';
                  });
                },),
                MyButton(text: '5',onPressed: () {
                  setState(() {
                    userInput += '5';
                  });
                },),
                MyButton(text: '6',onPressed: () {
                  setState(() {
                    userInput += '6';
                  });
                },),
                MyButton(text: '-', buttonColor: Colors.orange,onPressed: () {
                  setState(() {
                    userInput += '-';
                  });
                },),
              ],
            ),
            Row(
              children: [
                MyButton(text: '1',onPressed: () {
                  setState(() {
                    userInput += '1';
                  });
                },),
                MyButton(text: '2',onPressed: () {
                  setState(() {
                    userInput += '2';
                  });
                },),
                MyButton(text: '3',onPressed: () {
                  setState(() {
                    userInput += '3';
                  });
                },),
                MyButton(text: '+', buttonColor: Colors.orange,onPressed: () {
                  setState(() {
                    userInput += '+';
                  });
                },),
              ],
            ),

            Row(
              children: [
                MyButton(text: '0',onPressed: () {
                  setState(() {
                    userInput += '0';
                  });
                },),
                MyButton(text: '-',onPressed: () {
                  setState(() {
                    userInput += '-';
                  });
                },),
                MyButton(text: 'DEL',onPressed: () {
                  setState(() {
                    userInput = userInput.substring(0, userInput.length - 1);
                  });
                },),
                MyButton(text: '=', buttonColor: Colors.orange,onPressed: equalPress),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
