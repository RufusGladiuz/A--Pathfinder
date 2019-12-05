  /*
  Noch zu erschaffen:
  -Iterator pattern erstellen
  -Field klasse erstellen, die sich überall hin austeilen kann.
  */

  KeyboardControlls Controlls;
  Field board;
  aStern searcher;
  MessageBox shell;
  
  void setup(){
    smooth(8);
    size(1281,721);
    background(0);
  
    Controlls = new KeyboardControlls();
    board = new Field();
    shell = new MessageBox(400,0,300,100,"Welcome to Pathfinder v. 0.7");
    searcher = new aStern(board, shell);
    shell.newMessage("You can reset the board by pressing R");
    
    Controlls.registerObs(board);
    Controlls.registerObs(searcher);
    Controlls.message();
    
  }


  void draw(){
    
    background(0);
    line(400,0,400,100);
    fill(255);
    shell.render();
    board.checkTiles();

    
    
    if(searcher.closedList.size() != 0){
      for(Tiles tile: searcher.closedList){
        tile.inSideMe = true;
      }
    }
    
    for(Tiles item: board.getTiles()){
      item.render();
    }
     
    Controlls.render();
    searcher.aSternAlgo();
    
  }

  void keyPressed(){
    println("Closed size: "+searcher.closedList.size());
    if(searcher.endit == false){
      if(key== 'q' || key =='Q') Controlls.setLockedOnButton("Wall");
      if(key== 'w' || key =='W') Controlls.setLockedOnButton("Way");
      if(key== 'a' || key =='A') Controlls.setLockedOnButton("Ziel");
      if(key== 's' || key =='S') Controlls.setLockedOnButton("Start");
      if(key== 'e' || key =='E') Controlls.setLockedOnButton("StartAlgo");
      if(key== 'r' || key =='R') Controlls.reset = true;
   
    Controlls.message();
     }
  }
  
  void mousePressed(){
    
    for(Checkbox checkBox:Controlls.CheckBoxList){
      if(checkBox.inSideMe == true){
        checkBox.tuggleAktiv();
        Controlls.message();
      }
    }
    
    
  }

 void mouseReleased(){
  for(Tiles item: board.getTiles()){
    item.setLeftTheSquaretoTrue();
  }
}

 void mouseWheel(MouseEvent event){
   shell.scroll(event.getCount());
   
 }