class Vertex {

  PVector position; 
  PVector dPosition;
  PVector size;
  PVector sliderRange;
  PVector sliderPosition;

  boolean overVertex = false;
  boolean locked;
  boolean selected;

  float fill;
  int slideVal;

  String MoveType;
  String type;
  String name; 

  public Vertex() {
    fill = 153; 
    slideVal = 0;
    
    float q = random(20, 40);

    position = new PVector(random(4 * width / 5, width), random(0, height / 5));
    size = new PVector(q, q);
    sliderRange = new PVector(0, 0);
    sliderPosition = new PVector(0, 0);

    MoveType = "Normal";
    type = "Vertex";
    name = "";

    locked = false;
    selected = false;
  }

  public void Initiate() {
    dPosition = new PVector(0, 0);
  }  

  public boolean select() {
    selected = !selected; 

    return selected;
  }

  public void reEvaluate() {

    pushStyle();
    strokeWeight(3);

    if (!selected) fill = 153;

    if (mouseX > position.x - (.5 * size.x) && mouseX < position.x + (.5 * size.x) && 
      mouseY > position.y - (.5 * size.y) && mouseY < position.y + (.5 * size.y)) {
      overVertex = true;

      if (!locked) { 
        stroke(0); 
        fill(fill);
      }
    } else {
      stroke(fill);
      fill(fill);
      overVertex = false;
    }

    if (type == "Vertex") {
      ellipse(position.x, position.y, size.x, size.y);
    }
    if (type == "Button") {
      if (selected) { 
        fill  = 255;
        stroke(0);
      }
      rect(position.x, position.y, size.x, size.y);
    }

    if (type == "Slider") {
      pushStyle();
        fill(0);
        text(sliderRange.y, sliderPosition.x - 15, sliderPosition.y - 105);
        text(sliderRange.x, sliderPosition.x - 15, sliderPosition.y + 112);
  
        stroke(0);
        line(sliderPosition.x, sliderPosition.y, sliderPosition.x, sliderPosition.y + 100);
        line(sliderPosition.x, sliderPosition.y, sliderPosition.x, sliderPosition.y - 100);
      popStyle();

      rect(position.x, position.y, size.x, size.y);
      
      
      float slideDist = dist(position.x, position.y, sliderPosition.x, sliderPosition.y - 100);
      
      slideVal = int(map(slideDist, 100 - (100 - .5 * size.y), 100 + (100 - .5 * size.y), sliderRange.y, sliderRange.x));
      
      slideVal = int(slideVal);
      
      name = "" + slideVal;
    }


    fill(0);
    text(name, position.x - (.5 * size.x) + 4, position.y + (.125 * size.y));
    popStyle();
  }

  public void pressed() {
    pushStyle();
    if (type == "Button") {
      if (overVertex) {
        select();
      }
    }
    if (type == "Vertex") {
      if (overVertex) {
        locked = true; 
        fill(fill);
      } else {
        locked = false;
      } 
      dPosition = new PVector(mouseX - position.x, mouseY - position.y);
    }
    if (type == "Slider") {
      if (overVertex) {
        locked = true; 
        fill(fill);
      } else {
        locked = false;
      } 
    }
    popStyle();
  }

  public void dragged() {

    if (locked) {
      if (MoveType == "Normal") {
        position = new PVector(mouseX - dPosition.x, mouseY - dPosition.y);
      }
      if (MoveType == "Horizontal") {
        position = new PVector(mouseX - dPosition.x, position.y);
      }
      if (MoveType == "Vertical") {
        position = new PVector(position.x, mouseY - dPosition.y);
        
        if(position.y < sliderPosition.y - (100 - .5 * size.y)) position.y = sliderPosition.y - (100 - .5 * size.y);
        if(position.y > sliderPosition.y + (100 - .5 * size.y)) position.y = sliderPosition.y + (100 - .5 * size.y);
        
      }
      if (MoveType == "Fixed") {
        position = position;
      }
    }
  }

  public void released() {
    if (type == "Vertex") {
      locked = false;
    }
    if (type == "Button") {
      //locked = true;
    }
  }
}