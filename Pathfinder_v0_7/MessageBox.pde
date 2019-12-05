//Scrollfunktion muss noch!

class MessageBox{
  ArrayList<Message> messageList;
  PVector firstPosi;
  
  PVector boxPosi;
  int boxLenght;
  int boxHeight;
  
  MessageBox(int x, int y, int horizontalSize, int verticalSize, String Welcome){
    boxLenght= horizontalSize;
    boxHeight = verticalSize;
    boxPosi= new PVector(x,y);
    firstPosi = new PVector(boxPosi.x+5,boxPosi.y+boxHeight-5);
    messageList = new ArrayList<Message>();
    
    if(Welcome != ""){
      Message temp = new Message(Welcome,firstPosi.x,firstPosi.y, color(255,255,255));
      messageList.add(temp);
    }
    
    boxPosi= new PVector(400,0);
  }

  void newMessage(String message){
    Message newMessage;
    
    if(messageList.size() > 0){
      float y= messageList.get(messageList.size()-1).posi.y;
       newMessage = new Message(message,firstPosi.x,y,color(255,255,255));
      
      for(Message msg: messageList){
        msg.posi.y-=12;
      }
    }
    else {
       newMessage = new Message(message, firstPosi.x, firstPosi.y, color(255,255,255));
    
    }
    messageList.add(newMessage);
  }
  
  
  void newErrorMessage(String message){
    Message newMessage;
    
    if(messageList.size() > 0){
      float y= messageList.get(messageList.size()-1).posi.y;
       newMessage = new Message(message,firstPosi.x,y,color(255,0,0));
      
      for(Message msg: messageList){
        msg.posi.y-=12;
      }
    }
    else {
       newMessage = new Message(message, firstPosi.x, firstPosi.y, color(255,0,0));
    
    }
    messageList.add(newMessage);
  }
  
  
  
  
  void render(){
    for(Message msg: messageList){
      if(msg.posi.y >= boxPosi.y && msg.posi.y <= boxPosi.y+boxHeight-5) msg.render();
    }
  }
  
  
  
  void scroll(float oneOone){
    
    if(messageList.size() > 0){
      if(oneOone == 1 && messageList.get(messageList.size()-1).posi.y >boxPosi.y+boxHeight-5){
        for(Message msg: messageList){
          msg.posi.y -=12;
        }
      }
      
      else if(oneOone == -1 && messageList.get(0).posi.y <= boxPosi.y ){
        for(Message msg: messageList){
          msg.posi.y +=12;
        }
      }
    }
  
  }
}