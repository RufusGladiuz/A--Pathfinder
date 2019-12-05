class aStern implements Observer{
  
  Field board;
  MessageBox shell;
  Vectory vectorBuilder;
  ArrayList<Tiles> openList;
  ArrayList<Tiles> closedList;
  boolean endit;
  
  
  aStern(Field board, MessageBox input){
    this.board = board;
    shell = input;
    openList = new ArrayList<Tiles>();
    closedList = new ArrayList<Tiles>();
    vectorBuilder = new Vectory();
    endit= false;
    
  }

  void aSternAlgo(){
    
    if(endit ==true && board.zielReferenz != null && board.startReferenz != null ){
      
      if(closedList.size() <=0 ){
        findeTheAdjoiningTiles(board.startReferenz);
        calculateCost();
        endit = TargetFound();
        
      }
      else if(openList.size() !=0) {
        Tiles atTheMoment = gettheLowestCost(openList);
        println("Current Tile: "+ atTheMoment.placeInArray);
        deletFormOpenList(atTheMoment);
        println("The current Tile has been shiftet from the OpenList to the ClosedList");
        findeTheAdjoiningTiles(atTheMoment);
        
        calculateCost();
        endit=TargetFound();
        
      }
      else{
        
        
        if(closedList.get(closedList.size()-1).OnMe._myName != "target")  shell.newErrorMessage("Targetpoint cant be reached. Please reset the board!");
        else shell.newErrorMessage("You have to reset the board first!");
        
        endit = false;
      }
      
    }
    
    if(endit == true && board.zielReferenz == null && board.startReferenz == null){ 
      
      shell.newErrorMessage("You have to set a Startpoint & Targetpoint");
      endit = false;
    }
    else if(endit == true && board.zielReferenz == null){
      
      shell.newErrorMessage("You have to set a Targetpoint");
      endit = false;
    }
    else if(endit == true&& board.startReferenz == null){
      
      shell.newErrorMessage("You have to set a Startpoint");
      endit = false;
    }
  }
  
  
  void findeTheAdjoiningTiles(Tiles atTheMoment){
    
    ArrayList<PVector> checkMate = vectorBuilder.vectors(atTheMoment);
    
    for(Tiles item: board.fields){
      for(int i =0; i < checkMate.size(); i++){
        
        if(vectorCompar(item._mittelPunkt,checkMate.get(i))){
          
            if(openList.contains(item) == false 
               && item.OnMe._myName != "wall" && !closedList.contains(item)){
               item.preTile = atTheMoment;
               openList.add(item);
            }   
        }   
      }
    }
    println("Open has been filled: " + openList.size());
    closedList.add(atTheMoment);
    
  }

  void deletFormOpenList(Tiles aTM){
    
    for(int i= 0; i< openList.size(); i++){
      if(vectorCompar(aTM._mittelPunkt,openList.get(i)._mittelPunkt)){
        //println("------>"+openList.get(i).placeInArray);
         openList.remove(i);
         
      }
    }
  
  }
  
  
  void  findTheImportantTiles(){
      boolean walker= true;
      ArrayList paste = new ArrayList<Tiles>();
      Tiles temp = board.zielReferenz;
      while(walker== true){
        paste.add(temp);
        temp.inClosedList = true;
        if(temp.OnMe._myName != "start") temp= temp.preTile;
        
        else if(temp.OnMe._myName =="start") walker =false;
      }
  closedList = paste;
  }
  
  // für messure und Compare neue klasse aufmachen; vielleicht mit Vectory zusammenfassen
  void calculateCost(){
    
    
    println("Ziel Nummer: "+board.zielReferenz.placeInArray+ " Start Nummer: "+ board.startReferenz.placeInArray);
    for(Tiles item: openList){
      if(item.cost == 0){
        //line(item._mittelPunkt.x,item._mittelPunkt.y,board.zielReferenz._mittelPunkt.x,board.zielReferenz._mittelPunkt.y);
        float xZiel =(int) abs(item._mittelPunkt.x -  board.zielReferenz._mittelPunkt.x);
        float yZiel =(int) abs(item._mittelPunkt.y -  board.zielReferenz._mittelPunkt.y);
        
        float xStart =(int) abs(item._mittelPunkt.x -  board.startReferenz._mittelPunkt.x);
        float yStart =(int) abs(item._mittelPunkt.y -  board.startReferenz._mittelPunkt.y);
       
        item.cost = item.OnMe.costToMove+ sqrt((xZiel*xZiel)+(yZiel*yZiel)) + sqrt((xStart*xStart)+(yStart*yStart));
      }
     }
    
    
  }
  
  boolean vectorCompar(PVector a, PVector b){
  
    if(a.x == b.x &&  a.y == b.y) return true;
    else return false;
    
  }
  Tiles gettheLowestCost(ArrayList<Tiles> openListTemp){
    
    Tiles output = openListTemp.get(0);
      
      for(Tiles tile: openListTemp){
        if(output.cost > tile.cost) output = tile;
        //println("Looked at: "+tile.placeInArray +" Value: " +tile.cost);
      }
    println("--------------- ");
    
    return output;
     
    
  }
  
  boolean TargetFound(){
    
    for(int i =0; i< openList.size(); i++){
      if(openList.get(i).OnMe._myName == "target"){ 
        closedList.add(openList.get(i));
        openList.remove(i);
        shell.newMessage("------------");
        shell.newMessage("Felderverlauf: ");
        for(Tiles item: closedList){
          if(item.preTile != null) shell.newMessage("FeldNr: " + item.placeInArray + "; Vorgänger: " + item.preTile.placeInArray + "; Kosten: " + item.cost);
        }
        shell.newMessage("Algorithm finished!");
        shell.newMessage("------------");
        findTheImportantTiles();
        openList.clear();
        return false;
    }
    
    }
    return true;
  }
  
  public void aktualisieren(String aktiv,boolean checkBoxNr, boolean reset, boolean startAlgo){
    
    if(reset == true){
     openList = new ArrayList<Tiles>();
     closedList = new ArrayList<Tiles>();
     endit = true;
    }
    endit = startAlgo;
  }
  
}