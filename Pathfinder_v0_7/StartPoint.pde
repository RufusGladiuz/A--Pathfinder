class StartPoint extends TiledContent{

StartPoint(){
  _myName = "start";
  costToMove =0;
}

void render(PVector _posi, int fieldSize){
  fill(30,30,200);
  ellipse(_posi.x+10,_posi.y+10,fieldSize-5,fieldSize-5);
}

}