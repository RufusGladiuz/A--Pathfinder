abstract class Controlls{
  PVector _posi;
  boolean _aktiv;
  String _lable;
  String _buttonToPress;
  
  
  Controlls(int x,int y,String schrift,String button){
    _posi = new PVector(x,y);
    _aktiv =false;
    _lable = schrift;
    _buttonToPress= button;
  }
  
  abstract void render();


}