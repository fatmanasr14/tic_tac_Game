import 'dart:math';

class player{
  static const x='x';
  static const o='o';
  static const empty='';
  static List<int>playerx=[];
   static List<int>playero=[];
}
//extention on list
extension containsAll on List{
  bool containsAlll (int x,int y, [z]){
    if(z==null) 
    return contains(x) && contains(y);
    else
    return contains(x) && contains(y) && contains(z);
  }
}
class game{
  void playgame(int index, String activeplayer) {
    if(activeplayer=='x')
      player.playerx.add(index);
    else
      player.playero.add(index);
    
  }
////check places
String  checkwinner(){
    String winner='';
    if(player.playerx.containsAlll(0,1,2)||
    player.playerx.containsAlll(3,4,5)||
    player.playerx.containsAlll(6,7,8)||
    player.playerx.containsAlll(0,3,6)||
    player.playerx.containsAlll(1,4,7)||
    player.playerx.containsAlll(2,5,8)||
    player.playerx.containsAlll(0,4,8)||
    player.playerx.containsAlll(2,4,6) ) winner='x';

   else if(player.playero.containsAlll(0,1,2)||
    player.playero.containsAlll(3,4,5)||
    player.playero.containsAlll(6,7,8)||
    player.playero.containsAlll(0,3,6)||
    player.playero.containsAlll(1,4,7)||
    player.playero.containsAlll(2,5,8)||
    player.playero.containsAlll(0,4,8)||
    player.playero.containsAlll(2,4,6) ) winner='0';

    else winner='';
    return winner;
  }

  ///to play with device
 Future <void>autoplay(activeplayer)async{
  int index=0;
  List<int> emptycells=[];
//to check empty cells from 0 to 8
  for(var i=0;i<9;i++){
    //i not exist in x or o add to emptycells

    if(!(player.playerx.contains(i)||player.playero.contains(i)))
    emptycells.add(i);
  }
//Ai of device to winn
//-----------------to make o win---------------
//start-center
  if(player.playero.containsAlll(0,1) && emptycells.contains(2))
  index=2;
  else if(player.playero.containsAlll(3,4) && emptycells.contains(5))
  index=5;
   else if(player.playero.containsAlll(6,7) && emptycells.contains(8))
  index=8;
   else if(player.playero.containsAlll(0,3) && emptycells.contains(6))
  index=6;
   else if(player.playero.containsAlll(1,4) && emptycells.contains(7))
  index=7;
   else if(player.playero.containsAlll(2,5) && emptycells.contains(8))
  index=8;
   else if(player.playero.containsAlll(0,4) && emptycells.contains(8))
  index=8;
   else if(player.playero.containsAlll(2,4) && emptycells.contains(6))
  index=6;

  ///start--end
  
  if(player.playero.containsAlll(0,2) && emptycells.contains(1))
  index=1;
  else if(player.playero.containsAlll(3,5) && emptycells.contains(4))
  index=4;
   else if(player.playero.containsAlll(6,8) && emptycells.contains(7))
  index=7;
   else if(player.playero.containsAlll(0,6) && emptycells.contains(3))
  index=3;
   else if(player.playero.containsAlll(1,7) && emptycells.contains(4))
  index=4;
   else if(player.playero.containsAlll(2,8) && emptycells.contains(5))
  index=5;
   else if(player.playero.containsAlll(0,8) && emptycells.contains(4))
  index=4;
   else if(player.playero.containsAlll(2,6) && emptycells.contains(4))
  index=4;

//center--end

  if(player.playero.containsAlll(1,2) && emptycells.contains(0))
  index=0;
  else if(player.playero.containsAlll(4,5) && emptycells.contains(3))
  index=3;
   else if(player.playero.containsAlll(7,8) && emptycells.contains(6))
  index=6;
   else if(player.playero.containsAlll(3,6) && emptycells.contains(0))
  index=0;
   else if(player.playero.containsAlll(4,7) && emptycells.contains(1))
  index=1;
   else if(player.playero.containsAlll(5,8) && emptycells.contains(2))
  index=2;
   else if(player.playero.containsAlll(4,8) && emptycells.contains(0))
  index=0;
   else if(player.playero.containsAlll(4,6) && emptycells.contains(2))
  index=2;


///---------to make x not win-------------


//start-center
  if(player.playerx.containsAlll(0,1) && emptycells.contains(2))
  index=2;
  else if(player.playerx.containsAlll(3,4) && emptycells.contains(5))
  index=5;
   else if(player.playerx.containsAlll(6,7) && emptycells.contains(8))
  index=8;
   else if(player.playerx.containsAlll(0,3) && emptycells.contains(6))
  index=6;
   else if(player.playerx.containsAlll(1,4) && emptycells.contains(7))
  index=7;
   else if(player.playerx.containsAlll(2,5) && emptycells.contains(8))
  index=8;
   else if(player.playerx.containsAlll(0,4) && emptycells.contains(8))
  index=8;
   else if(player.playerx.containsAlll(2,4) && emptycells.contains(6))
  index=6;

   ///start--end
  
  if(player.playerx.containsAlll(0,2) && emptycells.contains(1))
  index=1;
  else if(player.playerx.containsAlll(3,5) && emptycells.contains(4))
  index=4;
   else if(player.playerx.containsAlll(6,8) && emptycells.contains(7))
  index=7;
   else if(player.playerx.containsAlll(0,6) && emptycells.contains(3))
  index=3;
   else if(player.playerx.containsAlll(1,7) && emptycells.contains(4))
  index=4;
   else if(player.playerx.containsAlll(2,8) && emptycells.contains(5))
  index=5;
   else if(player.playerx.containsAlll(0,8) && emptycells.contains(4))
  index=4;
   else if(player.playerx.containsAlll(2,6) && emptycells.contains(4))
  index=4;

//center--end

  if(player.playerx.containsAlll(1,2) && emptycells.contains(0))
  index=0;
  else if(player.playerx.containsAlll(4,5) && emptycells.contains(3))
  index=3;
   else if(player.playerx.containsAlll(7,8) && emptycells.contains(6))
  index=6;
   else if(player.playerx.containsAlll(3,6) && emptycells.contains(0))
  index=0;
   else if(player.playerx.containsAlll(4,7) && emptycells.contains(1))
  index=1;
   else if(player.playerx.containsAlll(5,8) && emptycells.contains(2))
  index=2;
   else if(player.playerx.containsAlll(4,8) && emptycells.contains(0))
  index=0;
   else if(player.playerx.containsAlll(4,6) && emptycells.contains(2))
  index=2;
   
   else{
     //select random number
    Random random=Random();
    int randomindex=random.nextInt(emptycells.length);
    index=emptycells[randomindex];
   }
  playgame(index, activeplayer);
 }

}
