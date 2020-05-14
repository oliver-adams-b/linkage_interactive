Vertex[] boxes = new Vertex[7];

Vertex V0;
Vertex V1;
Vertex V2;
Vertex V3;
Vertex V4;
Vertex V5;
Vertex circle;
Vertex ray;
Vertex path;
Vertex clearPath;
Vertex fullScreen;

float theta = 0, dTheta = .1;

ArrayList<PVector> tracePoints = new ArrayList<PVector>();

void setup() {
  fullScreen();

  rectMode(CENTER);
  
  setVertices();
}

void draw() {  
  background(255);
  updateVertices();
  
  theta += dTheta;

  pushStyle();
    fill(153);
    text("Designed and Created by Oliver Adams", 20, height - 20);
  popStyle();
}



void mousePressed() {
  for (int i = 0; i < boxes.length; i++) {
    boxes[i].pressed();
  }

  V0.pressed();
  V1.pressed();
  V2.pressed();
  V3.pressed();
  V4.pressed();
  V5.pressed();
  ray.pressed();
  circle.pressed();
  path.pressed();
  clearPath.pressed();
  fullScreen.pressed();
}

void mouseDragged() {
  for (int i = 0; i < boxes.length; i++) {
    boxes[i].dragged();
  }

  V0.dragged();
  V1.dragged();
  V2.dragged();
  V3.dragged();
  V4.dragged();
  V5.dragged();
  ray.dragged();
  circle.dragged();
  path.dragged();
  clearPath.dragged();
  fullScreen.dragged();
}

void mouseReleased() {
  for (int i = 0; i < boxes.length; i++) {
    boxes[i].released();
  }

  V0.released();
  V1.released();
  V2.released();
  V3.released();
  V4.released();
  V5.released();
  ray.released();
  circle.released();
  path.released();
  clearPath.released();
  fullScreen.released();
}

void setVertices(){
  
  V0 = new Vertex();
  V0.size = new PVector(15, 15);
  V0.position = new PVector(width / 3, 4 * height / 8);
  V0.MoveType = "Horizontal";
  V0.fill = 0;

  V1 = new Vertex();
  V1.size = new PVector(15, 15);
  V1.position = new PVector( 6 * width / 7, V0.position.y);
  V1.MoveType = "Horizontal";
  V1.fill = 0;
  
  V2 = new Vertex();
  V2.size = new PVector(40, 20);
  V2.position = new PVector(40, 500);
  V2.type = "Slider";
  V2.MoveType = "Vertical";
  V2.sliderRange = new PVector(0, 200);
  V2.sliderPosition = new PVector(V2.position.x, V2.position.y);
  
  V3 = new Vertex();
  V3.size = new PVector(40, 20);
  V3.position = new PVector(100, 500);
  V3.type = "Slider";
  V3.MoveType = "Vertical";
  V3.sliderRange = new PVector(0, 200);
  V3.sliderPosition = new PVector(V3.position.x, V3.position.y);
  
  V4 = new Vertex();
  V4.size = new PVector(40, 20);
  V4.position = new PVector(215, 500);
  V4.type = "Slider";
  V4.MoveType = "Vertical";
  V4.sliderRange = new PVector(3, 20);
  V4.sliderPosition = new PVector(V4.position.x, V4.position.y);
  
  V5 = new Vertex();
  V5.size = new PVector(40, 20);
  V5.position = new PVector(155, 500);
  V5.type = "Slider";
  V5.MoveType = "Vertical";
  V5.sliderRange = new PVector(0, 200);
  V5.sliderPosition = new PVector(V5.position.x, V5.position.y);
  
  
  circle = new Vertex();
  circle.size = new PVector(60, 20);
  circle.position = new PVector(40, 660);
  circle.type = "Button";
  circle.name = " Circles";
  
  ray = new Vertex();
  ray.size = new PVector(60, 20);
  ray.position = new PVector(120, 660);
  ray.type = "Button";
  ray.name = "    Ray";
  
  path = new Vertex();
  path.size = new PVector(60, 20);
  path.position = new PVector(40, 690);
  path.type = "Button";
  path.name = "Draw Path";
  
  clearPath = new Vertex();
  clearPath.size = new PVector(60, 20);
  clearPath.position = new PVector(120, 690);
  clearPath.type = "Button";
  clearPath.name = "Clear Path";
  
  fullScreen = new Vertex();
  fullScreen.size = new PVector(80, 20);
  fullScreen.position = new PVector(width - 100, 20);
  fullScreen.type = "Button";
  fullScreen.name = "Full Screen Mode";
  
  

  for (int i = 0; i < boxes.length; i++) {
    boxes[i] = new Vertex();
    boxes[i].position = new PVector(60, (50 * i) + 30);
    boxes[i].size = new PVector(100, 40);
    boxes[i].type = "Button";
    boxes[i].MoveType = "Fixed";
  }
}

void updateVertices(){
  
  if(boxes[0].selected){
    //drawWeirdLink(V0.position, V1.position); 
    
    boxes[1].selected = false;
    boxes[2].selected = false;
    boxes[3].selected = false;
    boxes[4].selected = false;
    boxes[5].selected = false;
    
    PVector P0 = drawWeirdLink(V0.position, V1.position);
    
    if(path.selected){
      tracePoints.add(P0);
      
      for(int i = 1; i < tracePoints.size(); i ++){
        PVector P = tracePoints.get(i);
        PVector Q = tracePoints.get(i - 1);
        
        line(P.x, P.y, Q.x, Q.y);
      }
    }
  }
  if(boxes[1].selected){
    drawStar(V0, V1.position, V3.slideVal, V2.slideVal);
    
    boxes[0].selected = false;
    boxes[2].selected = false;
    boxes[3].selected = false;
    boxes[4].selected = false;
    boxes[5].selected = false;
    boxes[6].selected = false;
  }
  if(boxes[2].selected){ 
    //drawParrallelogram(V0, V1);
    
    boxes[0].selected = false;
    boxes[1].selected = false;
    boxes[3].selected = false;
    boxes[4].selected = false;
    boxes[5].selected = false;
    boxes[6].selected = false;
    
    V0.MoveType = "Normal";
    V1.MoveType = "Normal";
      
    PVector P0 = drawParrallelogram(V0, V1);
    
    if(path.selected){
      tracePoints.add(P0);
      
      for(int i = 1; i < tracePoints.size(); i ++){
        PVector P = tracePoints.get(i);
        PVector Q = tracePoints.get(i - 1);
        
        line(P.x, P.y, Q.x, Q.y);
      }
    }
  }
  if(boxes[3].selected){ 
    linkageWithCircles(V0, V1, V3.slideVal, V2.slideVal);
    
    boxes[0].selected = false;
    boxes[1].selected = false;
    boxes[2].selected = false;
    boxes[4].selected = false;
    boxes[5].selected = false;
    boxes[6].selected = false;
    
    V0.MoveType = "Normal";
    V1.MoveType = "Normal";
  }
  if(boxes[4].selected){
    PVector P0 = drawPolygon(V0, V1, V3.slideVal, V2.slideVal, V4.slideVal, ray.selected, circle.selected);
    
    boxes[0].selected = false;
    boxes[1].selected = false;
    boxes[2].selected = false;
    boxes[3].selected = false;
    boxes[5].selected = false;
    boxes[6].selected = false;
    
    V0.MoveType = "Horizontal";
    V1.MoveType = "Horizontal";
    
    if(path.selected){
      tracePoints.add(P0);
      
      for(int i = 1; i < tracePoints.size(); i ++){
        PVector P = tracePoints.get(i);
        PVector Q = tracePoints.get(i - 1);
        
        line(P.x, P.y, Q.x, Q.y);
      }
    }
    
  }
  
  if(boxes[5].selected){
   PVector P0 = drawPath(V0, V1, 70, 35, V3.slideVal, V2.slideVal, V5.slideVal, theta);
   
   V0.MoveType = "Normal";
   V1.MoveType = "Normal";
   
   boxes[0].selected = false;
   boxes[1].selected = false;
   boxes[2].selected = false;
   boxes[3].selected = false;
   boxes[4].selected = false;
   boxes[6].selected = false;
   
   if(path.selected){
      tracePoints.add(P0);
      
      for(int i = 1; i < tracePoints.size(); i ++){
        PVector P = tracePoints.get(i);
        PVector Q = tracePoints.get(i - 1);
        
        line(P.x, P.y, Q.x, Q.y);
      }
    }
  }
  
  if(boxes[6].selected){
   PVector P0 = twinPoles(V0, ray.selected, circle.selected);
   
   //V0.position = new PVector(width / 2, height / 2);
   V1.position = new PVector(width - 20, height - 20);
   
   V0.MoveType = "Normal";
   
   if(path.selected){
      tracePoints.add(P0);
      
      for(int i = 1; i < tracePoints.size(); i ++){
        PVector P = tracePoints.get(i);
        PVector Q = tracePoints.get(i - 1);
        
        line(P.x, P.y, Q.x, Q.y);
      }
    }
  }
  
  for (int i = 0; i < boxes.length; i++) {
    boxes[i].Initiate();
    boxes[i].reEvaluate();
  }
  
  if(clearPath.selected){
    for(int i = 0; i< tracePoints.size(); i++){
      tracePoints.remove(i);
    }
  }

  V0.Initiate();
  V0.reEvaluate();

  V1.Initiate();
  V1.reEvaluate();
  
  V2.Initiate();
  V2.reEvaluate();
  
  V3.Initiate();
  V3.reEvaluate();
  
  V4.Initiate();
  V4.reEvaluate();
  
  V5.Initiate();
  V5.reEvaluate();
  
  circle.Initiate();
  circle.reEvaluate();
  
  ray.Initiate();
  ray.reEvaluate();
  
  path.Initiate();
  path.reEvaluate();
  
  clearPath.Initiate();
  clearPath.reEvaluate();
  
  
  boxes[0].name = "Parallel Link";
  boxes[1].name = "Star Link";
  boxes[2].name = "Basic Link";
  boxes[3].name = "Circle Link";
  boxes[4].name = "Fancy Star";
  boxes[5].name = "Toroid Figure";
  boxes[6].name = "Twin Poles";
  
  pushStyle();
    fill(0);
    text("Length 1", V2.position.x - 18, V2.sliderPosition.y + 130);
    text("Length 2", V3.position.x - 18, V3.sliderPosition.y + 130);
    text("Length 3", V5.position.x - 18, V5.sliderPosition.y + 130);
    text("# of Pedals", V4.position.x - 18, V4.sliderPosition.y + 130);
  popStyle();
  
}