class TargetPoint extends TiledContent{
  
  TargetPoint(){
    _myName = "target";
    costToMove =0;
  }
  
  void render(PVector _posi, int fieldsize){
    stroke(255,60,60);
    strokeWeight(3);
    
    line(_posi.x+(fieldsize/2) , _posi.y+2, _posi.x+(fieldsize/2), _posi.y+fieldsize);
    line(_posi.x +2, _posi.y+(fieldsize/2), _posi.x +fieldsize, _posi.y +(fieldsize/2));
    
    strokeWeight(1);
    stroke(255);
  
  }

}