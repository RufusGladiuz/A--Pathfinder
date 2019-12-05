class Message{

  PVector posi;
  String lable;
  color coloration;
  
  Message(String message, float x, float y , color c){
    lable = message;
    posi = new PVector(x,y);
    coloration = c;
  }
  
  void render(){
    fill(coloration);
    stroke(coloration);
    text(lable,posi.x,posi.y);
  }

}