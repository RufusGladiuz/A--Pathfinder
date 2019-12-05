/* Diese Klasse sollte ein Singelton pattern bekommen. Ist in Prosessing scheinbar, aber nicht möglich*/
class KeyboardControlls implements Subject{

  ArrayList<TuggelButton> TuggleList;
  ArrayList <Checkbox > CheckBoxList;
  ArrayList<Observer> observerList;
  
  String lockedButton;
  boolean reset;
  boolean startAlgo;
  
  KeyboardControlls(){
    lockedButton= "Wall";
    CheckBoxList = new ArrayList<Checkbox>();
    TuggleList   = new ArrayList<TuggelButton>();
    observerList = new ArrayList<Observer>();
    reset = false;
    startAlgo = false;
    
    int walkerX= 20;
    int walkerY= 10;
    
    for(int i =0; i<=1; i++){
      for(int j=0; j<=1; j++) {
        
        TuggleList.add(new TuggelButton(walkerX, walkerY, "Trolol","a"));
        walkerX+=90;
      }
     walkerX =20;
     walkerY+=40;
    }
    
    
    TuggleList.get(0)._lable = "Wall";
    TuggleList.get(1)._lable = "Way";
    TuggleList.get(2)._lable = "Ziel";
    TuggleList.get(3)._lable = "Start";
    
    TuggleList.get(0)._buttonToPress = "Q";
    TuggleList.get(1)._buttonToPress = "W";
    TuggleList.get(2)._buttonToPress = "A";
    TuggleList.get(3)._buttonToPress = "S";
    TuggleList.add(new TuggelButton((int)TuggleList.get(1)._posi.x + 90, 10, "StartAlgo","E"));
    
    TuggleList.get(0)._aktiv = true;
    int a = (int)TuggleList.get(3)._posi.x + 80;
    
    CheckBoxList.add(new Checkbox(a+20,70,"FieldNr", ""));
  }
  
  void render(){
    
    for(TuggelButton Keys:TuggleList ){
      Keys.render();
    }
    
   for(Checkbox box: CheckBoxList){
     box.render();
   }
  }

  
  void setLockedOnButton(String next){
    for(Controlls Keys:TuggleList){
      if(Keys._aktiv == true){
        Keys._aktiv = false;
      }
    
    }
    
    for(Controlls Keys:TuggleList){
      if(Keys._lable == next){
        lockedButton = next;
        Keys._aktiv =true;
      }
    }
  }

  public void registerObs(Observer a){
    observerList.add(a);
  }

  public void deleteObs(Observer a){
    int i = observerList.indexOf(a);
    if(i >= 0) observerList.remove(a);
  }
  
  public void message(){
    println("message");
    boolean fieldNr = false;
    
    if(lockedButton == "StartAlgo")  startAlgo = true;
    
    for(int i =0; i< CheckBoxList.size();i++){
      if(CheckBoxList.get(i)._lable == "FieldNr"){
          fieldNr = CheckBoxList.get(i)._aktiv;
      }
    }
    
    for(Observer ob: observerList){
      ob.aktualisieren(lockedButton,fieldNr,reset,startAlgo );
    }
    reset= false;
    startAlgo = false;
  }
  
}