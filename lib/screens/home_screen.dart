import 'package:flutter/material.dart';
import '../constant.dart';
import '../models/question_model.dart';
import '../widgets/question_widget.dart';
import '../widgets/next_button.dart';
import '../widgets/option_card.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  List<Question> _questions = [
    Question(
    id: '10',
    title: 'Berapa hasil pengoperasian 6 x 7?', 
    options: {'35': false, '49': false, '42': true, '56': false},
    ),
    Question(
    id: '10',
    title: 'Berapa hasil pengoperasian 90 : 6?', 
    options: {'15': true, '12': false, '8': false, '17': false},
    )
  ];

  int index = 0;

  bool isPressed = false;

  void nextQuestion() {
    if(index == _questions.length - 1) {
      return;
    } else {
      if(isPressed){

      setState((){
        index++;
        isPressed = false;
      });
      } else {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('mohon pilih jawaban'), 
          behavior:SnackBarBehavior.floating, 
          margin: EdgeInsets.symmetric(vertical: 20.0))
        );  
      }
    } 
  }
  
  void changeColor(){
    setState((){
      isPressed = true;
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: background,
        appBar: AppBar(
          title: const Text('Quizter'),
          backgroundColor: background,
          shadowColor: Colors.transparent,
    ),
    body: Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Column(
        children: [
          QuestionWidget(
            indexAction: index,
            question: _questions[index].title,
            totalQuestion: _questions.length,
            ),
            const Divider(color: neutral,),

            const SizedBox(height: 25.0),
            for(int i = 0; i < _questions[index].options.length; i++)
              OptionCard(
                option: _questions[index].options.keys.toList()[i],
                color: isPressed ? _questions[index].options.values.toList()[i] == true 
                ? correct
                : incorrect 
                : neutral,
                onTap: changeColor,
              ),
        ],
      ),
    ),    
    
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0)
        child: NextButton(
          nextQuestion: nextQuestion,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation. centerFloat,
    );
  }
} 