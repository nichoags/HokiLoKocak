import 'package:flutter/material.dart';
import 'dart:math';
import '../models/game_models.dart';

class DiceRollScreen extends StatefulWidget {
  @override
  _DiceRollScreenState createState() => _DiceRollScreenState();
}

class _DiceRollScreenState extends State<DiceRollScreen> {
  late String botName;
  late bool playerStarts;
  bool playerRolled = false;
  late Player playerOne;
  late Player botPlayer;

  // Warna tema merah
  final Color primaryRedColor = Color(0xFFD32F2F); // Deep Red
  final Color lightRedColor = Color(0xFFEF5350); // Light Red
  final Color darkRedColor = Color(0xFF8B0000); // Dark Red
  final Color backgroundColor = Color(0xFFFEEAEA); // Light Pink Background

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final args = ModalRoute.of(context)!.settings.arguments as Map;
    botName = args['botName'];
    playerStarts =
        args.containsKey('playerStarts') ? args['playerStarts'] : false;

    playerOne = Player(name: 'Player');
    botPlayer = Player(name: botName);
  }

  void _rollDice() {
    setState(() {
      playerOne.currentDiceRoll = Random().nextInt(6) + 1;
      botPlayer.currentDiceRoll = Random().nextInt(6) + 1;
      playerRolled = true;
    });
  }

  void _navigateToPvP() {
    Navigator.pushReplacementNamed(context, '/pvp', arguments: {
      'playerOne': playerOne,
      'botPlayer': botPlayer,
      'playerStarts': playerStarts
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        title: Text(
          'Dice Roll for Attack/Defense',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: primaryRedColor,
        elevation: 0,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              primaryRedColor.withOpacity(0.1),
              backgroundColor,
            ],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Roll Dice to Determine Attack/Defense',
                style: TextStyle(
                  fontSize: 20,
                  color: primaryRedColor,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildDiceWidget('Player Attack', playerOne.currentDiceRoll),
                  SizedBox(width: 40),
                  _buildDiceWidget(
                      '${botPlayer.name} Defense', botPlayer.currentDiceRoll),
                ],
              ),
              SizedBox(height: 40),
              AnimatedSwitcher(
                duration: Duration(milliseconds: 300),
                child: playerRolled
                    ? ElevatedButton(
                        key: ValueKey('nextButton'),
                        onPressed: _navigateToPvP,
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor: darkRedColor,
                          padding: EdgeInsets.symmetric(
                              horizontal: 60, vertical: 15),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          textStyle: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        child: Text('Next: Battle'),
                      )
                    : ElevatedButton(
                        key: ValueKey('rollButton'),
                        onPressed: _rollDice,
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor: primaryRedColor,
                          padding: EdgeInsets.symmetric(
                              horizontal: 60, vertical: 15),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          textStyle: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        child: Text('Roll Dice'),
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDiceWidget(String name, int diceValue) {
    return Column(
      children: [
        Text(
          name,
          style: TextStyle(
            fontSize: 16,
            color: primaryRedColor,
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(height: 10),
        Container(
          width: 120,
          height: 120,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: primaryRedColor.withOpacity(0.2),
                blurRadius: 10,
                offset: Offset(0, 5),
              ),
            ],
            border:
                Border.all(color: primaryRedColor.withOpacity(0.3), width: 2),
          ),
          child: Center(
            child: Text(
              diceValue > 0 ? diceValue.toString() : '?',
              style: TextStyle(
                fontSize: 56,
                fontWeight: FontWeight.bold,
                color: primaryRedColor,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
