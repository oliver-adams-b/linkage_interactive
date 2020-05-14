class Link {

  PVector startPoint; 
  PVector endPoint; 
  PVector direction;

  public Link () {
  }

  public void reDraw() { 
    background(255);
    direction = PVector.sub(startPoint, endPoint);
  }
 

  
    
  
}












