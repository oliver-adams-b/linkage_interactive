
PVector newVertex(PVector P0, PVector P1, float dist) { 

  PVector direction = PVector.sub(P0, P1);
  direction.normalize();
  direction.mult(dist);
  PVector P2 = PVector.add(P0, direction);

  return P2;
}

PVector generateAnchor(PVector P0, float r, float theta) {
  PVector P1 = new PVector(P0.x + r * cos(radians(theta)), P0.y + r * sin(radians(theta)));
  ellipse(P1.x, P1.y, 10, 10);
  return P1;
}

PVector newVertex(PVector P0, PVector P1, float dist, float theta) { 

  PVector direction = PVector.sub(P0, P1);
  direction.normalize();
  direction.rotate(theta);
  direction.mult(dist);
  PVector P2 = PVector.add(P0, direction);
   
  return P2;
}

void drawVertex(PVector P0, int size) {
  ellipse(P0.x, P0.y, size, size);
}

void drawVertex(PVector P0) {
  ellipse(P0.x, P0.y, 10, 10);
}

void drawVertex(PVector P0, String g) {
  pushStyle();
    fill(153);
    text(g, P0.x - 20, P0.y);
    ellipse(P0.x, P0.y, 10, 10);
  popStyle();
}

void drawLink(PVector P0, PVector P1, PVector P2) {
  pushStyle();
    strokeWeight(3);
    line(P0.x, P0.y, P1.x, P1.y);
    line(P1.x, P1.y, P2.x, P2.y);
  popStyle();
}

void drawLink(PVector P0, PVector P1) {
  line(P0.x, P0.y, P1.x, P1.y);
}

public PVector findIntersection(PVector P0, PVector P1, float R0, float R1) {

  boolean needs_reverse = false;
  boolean dir = true;
  pushStyle();
    strokeWeight(8);
    
  
    float d = dist(P0.x, P0.y, P1.x, P1.y); 
    float a = (pow(R0, 2) - pow(R1, 2) + pow(d, 2)) / (2 * d); 
    float h = sqrt(pow(R0, 2) - pow(a, 2));
  
    PVector z = (PVector.sub(P1, P0));
    PVector q = new PVector(z.x * (a / d), z.y * (a / d));
    PVector P2 = PVector.add(P0, q);
     
    PVector P3 = dir
      ? new PVector(P2.x + h * (P1.y - P0.y) / (d), P2.y - h * (P1.x - P0.x) / (d))
      : new PVector(P2.x - h * (P1.y - P0.y) / (d), P2.y + h * (P1.x - P0.x) / (d));
      
    popStyle();

  return P3;
}

boolean toggleDir(float h, boolean bool){
 boolean switchNeeded = false;
 
 if(h < 20) switchNeeded = true;
 if(h > 20) switchNeeded = false;
 
 if(switchNeeded && h < 20) bool = !bool;
 if(!switchNeeded && h > 20) bool = bool;
 
 return bool;
}


PVector plotIntersection(PVector P0, PVector P1, float R0, float R1, boolean dir) {

  strokeWeight(8);

  float d = dist(P0.x, P0.y, P1.x, P1.y); 
  float a = (pow(R0, 2) - pow(R1, 2) + pow(d, 2)) / (2 * d);
  float h = sqrt(pow(R0, 2) - pow(a, 2));

  PVector z = (PVector.sub(P1, P0));
  PVector q = new PVector(z.x * (a / d), z.y * (a / d));
  PVector P2 = PVector.add(P0, q);

  PVector P3 = dir
    ? new PVector(P2.x - h * (P1.y - P0.y) / (d), P2.y - h * (P2.x - P1.x) / (d / 2))
    : new PVector(P2.x + h * (P1.y - P0.y) / (d), P2.y + h * (P2.x - P1.x) / (d / 2));

  return P3;
}

void circle(PVector P1, PVector P2, PVector P3) {

  float mA, mB, q, w, e, r, radius;
  
  PVector center = new PVector();

  mA = ((P1.y - P2.y) / (P1.x - P2.x));
  mB = ((P2.y - P3.y) / (P2.x - P3.x));
  
  q = (mA * mB * (P1.y - P3.y)) + (mB * (P1.x + P2.x)) - (mA * (P2.x + P3.x));
  w = 2 * (mB - mA);
  
  center.x = q / w;
  
  e = (-1 / mA) * (center.x - ((P1.x + P2.x) / 2));
  r = ((P1.y + P2.y) / 2);
  
  center.y = e + r;
  radius = dist(center.x, center.y, P1.x, P1.y);
  
  ellipse(center.x, center.y, 2 * radius, 2 * radius);
  point(center.x, center.y);
  
  if(mA == mB){
    ray(P1, P2);
  }
    
  //line(P1.x, P1.y, center.x, center.y);
  //line(P2.x, P2.y, center.x, center.y);
  //line(P3.x, P3.y, center.x, center.y);
}

void ray(PVector P0, PVector P1){
 PVector P2 = newVertex(P0, P1, 10000);
 PVector P3 = newVertex(P1, P0, 10000);
 
 line(P0.x, P0.y, P3.x, P3.y);
 line(P0.x, P0.y, P2.x, P2.y);
}