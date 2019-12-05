class Tiles{
  
PVector _posi;
PVector _mittelPunkt;
int fieldSize;
TiledContent OnMe;
Tiles preTile;

boolean showNr;
boolean inSideMe;
boolean marked;
boolean leftTheTile;
boolean inClosedList;

int placeInArray;
float cost;

Tiles(float x, float y, int size, int place){
  _posi     = new PVector(x,y);
  _mittelPunkt = new PVector(x+(size/2),y + (size/2));
  OnMe      = new Way();
  fieldSize = size;
  
  inSideMe    = false;
  marked      = false;
  leftTheTile = true;
  inClosedList= false;
  placeInArray= place;
}

  void render(){
    stroke(255);
    if (inSideMe == true){
      fill(200,30,30);
    }
    else if(inClosedList == true){
      fill(0,102,153);
    }
    else fill(100);
      
    rect(_posi.x, _posi.y,fieldSize,fieldSize);
    fill(0);
    if(showNr == true) text(placeInArray,_mittelPunkt.x-10,_mittelPunkt.y);
   
    OnMe.render(_posi, fieldSize);
    
  }

void setLeftTheSquaretoTrue(){
  leftTheTile =true;
}

}