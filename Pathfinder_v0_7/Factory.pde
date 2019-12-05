class Factory{

  ArrayList<Tiles> generate(int boxSize){
    
    ArrayList<Tiles> output = new ArrayList<Tiles>();
    
    int walkerX =0;
    int walkerY =100;
    int placeInArray =0;
    for(int i=1; i<= (height-100)/ boxSize; i++){
       for(int j=1; j<=width/ boxSize; j++){
         output.add(new Tiles(walkerX,walkerY, boxSize,placeInArray));
         walkerX+= boxSize;
         placeInArray+=1;
       }
     walkerY+= boxSize;
     walkerX=0;
     }
    
    return output;
  }


 
  
}