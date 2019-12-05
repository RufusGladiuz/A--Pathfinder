class TuggelButton extends Controlls{
  
  int rectHeight;
  int rectWidth;
  
  TuggelButton(int x,int y,String schrift,String button){
    super(x,y,schrift,button); 
    rectHeight= 30;
    rectWidth = 80;
  }
  
  void render(){
  
    if(_aktiv == true){
      fill(255,30,30,150);
      rect(_posi.x, _posi.y, rectWidth,rectHeight,100);
      
      stroke(255);
      fill(255);
      text(_lable, _posi.x+5,_posi.y+20);
      
      ellipse(_posi.x+70, _posi.y+15, 15,15);
      fill(0);
      text(_buttonToPress, _posi.x+65, _posi.y+20);
    }
    else{
      noFill();
      rect(_posi.x, _posi.y, rectWidth,rectHeight,100);
      
      stroke(255);
      fill(255);
      text(_lable, _posi.x+5,_posi.y+20);
      
      ellipse(_posi.x+70, _posi.y+15, 15,15);
      fill(0);
      text(_buttonToPress, _posi.x+65, _posi.y+20);
    }
  
  }



}