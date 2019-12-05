class Wall extends TiledContent{

  Wall (){
    _myName = "wall";
  }
  
void render(PVector _posi, int fieldSize){
  fill(0);
  rect(_posi.x, _posi.y,fieldSize,fieldSize);
}

}