import 'package:flutter/material.dart';
import 'package:tic/game_logic.dart';

class homepage extends StatefulWidget {
  const homepage({super.key});

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {

  String activeplayer='x';
  int turn=0;
  bool gameover=false;
  String result='';
  game gamee=game();
  bool isswitch=false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: SafeArea(
        child: Column(
          children: [
            SwitchListTile.adaptive(
              title: Text('turn on /off two player',style: TextStyle(
                color: Colors.white,
                fontSize: 28,
                ),
                textAlign: TextAlign.center,
                ),
                
              value: isswitch,
              onChanged: (newvalue){
                setState(() {
                  isswitch=newvalue;
                });
              }),
            Text('its $activeplayer turn'.toUpperCase() ,style: TextStyle(
                color: Colors.white,
                fontSize: 50,
                ),
                textAlign: TextAlign.center,
                ),
            
            Expanded(child: GridView.count(
              padding: EdgeInsets.all(16),
              mainAxisSpacing: 8.0,
              crossAxisSpacing: 8.0,
              childAspectRatio: 1.0,
              crossAxisCount: 3,
              children:List.generate(9, (index) => InkWell(
                borderRadius: BorderRadius.circular(16),
                onTap:gameover?null: () { _ontap(index);
                  
                },
                child: Container(decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: Colors.indigoAccent),
                  child: Center(
                    child:
                     Text(player.playerx.contains(index)?'x':
                     player.playero.contains(index)?'o':'',
                      style: TextStyle(
                           color: player.playerx.contains(index)? Color.fromARGB(255, 149, 15, 88):
                           Colors.deepOrangeAccent[800],
                           fontSize: 40,
                                  ),),
                  )
                ),
                  ),
               )
               ),
               ),
               
            
            
            
            Text(
                  result,
                  style: TextStyle(
                color: Colors.white,
                fontSize: 40,
                ),
                textAlign: TextAlign.center,
                ),
            ElevatedButton.icon(
              onPressed: (){
                setState(() {
                  player.playero=[];
                  player.playerx=[];
                 activeplayer='x';
                 turn=0;
                 gameover=false;
                 result='';
                  
                });
              },
               icon: const Icon(Icons.replay),
                label: Text('Repeat the game'),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.amber[800])
                ),)

          ],
        )),
    );
  }
  
  void _ontap(int index)async {
   
    ///allow to press
    if((player.playerx.isEmpty ||
     !player.playerx.contains(index)) && //x empty &playerx not contain index
   (player.playero.isEmpty 
   ||!player.playero.contains(index))){
     gamee.playgame(index,activeplayer);  //play the game
    updatestate();  //update game

    if(!isswitch && !gameover && turn !=9){
      await gamee.autoplay(activeplayer);
      updatestate();
    }
  }
  }
  void updatestate() {
    setState(() {
      //change players
      activeplayer=(activeplayer=='x')?'o':'x';
      turn++;   //increase turn
      String winnerplayer=gamee.checkwinner();
      if(winnerplayer!=''){
        gameover=true;
       result='$winnerplayer is the winner';

      }else if(!gameover && turn==9){
         result='it\'s Draw!';

      }
    });
  }
}