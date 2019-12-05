class Checkbox extends Controlls{
  
  PVector boxPositon;
  
  boolean inSideMe;
  
  float pixelLengthLable;
  int rectSize;
  
  Checkbox(int x,int y,String schrift,String button){
    super(x,y,schrift,button);
    pixelLengthLable = textWidth(schrift);
    boxPositon = new PVector(x+3+pixelLengthLable, y-12);
    rectSize= 15;
  }
  
  void render(){
    fill(255);
    text(_lable, _posi.x,_posi.y);
    
    
    if(_aktiv == false){
     
      fill(0);
      inSideMe= false;
    }
    else if (_aktiv == true){
        fill(255,30,30,150);
    }
    
    if(mouseX > boxPositon.x && mouseX < boxPositon.x+rectSize && 
        mouseY > boxPositon.y && mouseY < boxPositon.y+rectSize){
          inSideMe = true;  
          fill(255,30,30,150);
        }
   else inSideMe =false;
   
    rect(boxPositon.x,boxPositon.y,rectSize,rectSize);
  
  }

  void tuggleAktiv(){
    if(_aktiv == false) _aktiv = true;
    else _aktiv = false;
  }
}