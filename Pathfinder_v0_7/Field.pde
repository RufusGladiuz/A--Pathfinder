class Field implements Observer{

  ArrayList<Tiles> fields;
  Factory builder;
  boolean showNr;
  
  String lockedButton;
  Tiles startReferenz;
  Tiles zielReferenz;
  
  Field(){
    builder = new Factory();
    fields = builder.generate(20);
  }
  
  ArrayList<Tiles> getTiles(){
    return fields;
  }

  // da muss man was machen
  void checkTiles(){
    
    for(Tiles tile: fields){
      
      tile.showNr = showNr;
     if(mouseX > tile._posi.x && mouseX < tile._posi.x+tile.fieldSize && 
        mouseY > tile._posi.y && mouseY < tile._posi.y+tile.fieldSize){
           tile.inSideMe= true;
         } 
     else{
           tile.inSideMe   = false;
           tile.leftTheTile= true;
         }
      
      
     if(mousePressed == true && tile.inSideMe == true 
        && tile.leftTheTile==true){ 
          
          if(tile.OnMe._myName == "way"){
             manageTile(tile);
          }
          
          else { 
            if(tile.OnMe._myName == "start") startReferenz = null;
            if(tile.OnMe._myName == "target") zielReferenz = null;
            tile.OnMe = new Way();
          }
          
          tile.leftTheTile= false;
     }
    }
  }
  
  void manageTile(Tiles tileToPutSomethingOn){
    
    if(lockedButton == "Start"){
        tileToPutSomethingOn.OnMe = new StartPoint();
        
        if(startReferenz == null) startReferenz= tileToPutSomethingOn;
        
        else{ 
         startReferenz.OnMe = new Way();
         startReferenz = tileToPutSomethingOn;
        }
      
    }
    
    
    
    else if(lockedButton == "Ziel"){
        tileToPutSomethingOn.OnMe = new TargetPoint();
        
        if(zielReferenz == null) zielReferenz= tileToPutSomethingOn;
        
        else{ 
         zielReferenz.OnMe = new Way();
         zielReferenz = tileToPutSomethingOn;
        }
      
    }
    
    
    else{ 
      
      if(lockedButton == "Way"){
        tileToPutSomethingOn.OnMe = new Way();
      }
      
      if(lockedButton == "Wall"){
        tileToPutSomethingOn.OnMe = new Wall();
      }
    }
    
   }
    
    public void aktualisieren(String aktiv, boolean checkBoxNr, boolean reset, boolean startAlgo){
        lockedButton = aktiv;
        showNr= checkBoxNr;
        
        if(reset == true){
          if(startReferenz != null){
            startReferenz.OnMe = new Way();
          }
          if(board.zielReferenz != null){
            zielReferenz.OnMe = new Way();
          }
          
          startReferenz = null;
          zielReferenz = null;
        
        for(Tiles tile: fields){
          tile.cost =0;
          tile.inClosedList = false;
        }
      }
      
      
    }
  
  }
  
 