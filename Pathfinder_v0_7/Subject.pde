 interface Subject{
   
   void registerObs(Observer a);
  void deleteObs(Observer a);
  
  abstract void message();
}