class Vectory extends Factory{

 ArrayList<PVector> vectors(Tiles aTM){
    ArrayList<PVector> output = new ArrayList<PVector>();
    
    for(int y =-aTM.fieldSize; y < aTM.fieldSize*2; y+=aTM.fieldSize){
      for(int x = -aTM.fieldSize; x < aTM.fieldSize*2; x+=aTM.fieldSize){
        if(x!= 0 || y!=0) output.add(new PVector(aTM._mittelPunkt.x+x,aTM._mittelPunkt.y+y));
      }
    }
    
    return output;
  
  }

}