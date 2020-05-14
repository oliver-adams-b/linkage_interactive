PVector drawParrallelogram(Vertex V0, Vertex V1) {

  PVector Q = findIntersection(V0.position, V1.position, 200, 200);
  PVector W = findIntersection(V1.position, V0.position, 200, 200);

  drawLink(V1.position, Q, V0.position);
  drawLink(V1.position, W, V0.position);

  drawVertex(Q, "0");
  drawVertex(W, "1");
  drawVertex(V1.position, "V1");
  drawVertex(V0.position, "V0");

  return Q;
}

PVector drawStar(Vertex V0, PVector V1, float L1, float L2) {

  PVector P0 = findIntersection(V0.position, V1, L2, L2);
  PVector P1 = newVertex(P0, V1, -L1);
  PVector P2 = newVertex(P0, V0.position, -L1);
  PVector P3 = findIntersection(P1, P2, -(L2-L1), -(L2-L1));
  PVector P4 = newVertex(P1, P3, L1);
  PVector P5 = newVertex(P2, P3, L1);
  PVector P6 = findIntersection(V0.position, P5, L2-L1, L1 );
  PVector P7 = newVertex(P6, V0.position, L1);
  PVector P8 = newVertex(P6, P5, L2-L1);
  PVector P9 = findIntersection(P8, P7, L2-L1, L1);
  PVector P10 = newVertex(P9, P7, L2-L1);
  PVector P11 = newVertex(P9, P8, L1);
  PVector P12 = findIntersection(P10, P11, L2-L1, L1);
  PVector P13 = newVertex(P12, P11, L2-L1);
  PVector P14 = newVertex(P12, P10, L1);
  PVector P15 = findIntersection(P13, P14, L2-L1, L1);
  PVector P16 = newVertex(P15, P14, L2-L1);
  PVector P17 = newVertex(P15, P13, L1);
  PVector P18 = findIntersection(P16, P17, L2-L1, L1);
  PVector P19 = newVertex(P18, P16, L1);
  PVector P20 = newVertex(P18, P17, L2-L1);
  PVector P21 = findIntersection(P20, P19, L2-L1, L1);
  PVector P22 = newVertex(P21, P19, L2-L1);
  PVector P23 = newVertex(P21, P20, L1);


  drawLink(V1, P0, V0.position);
  drawLink(P4, P3, P5);
  drawLink(P5, P6, V0.position);
  drawLink(P7, P6, P8);
  drawLink(P10, P9, P11);
  drawLink(P7, P9, P8);
  drawLink(P11, P12, P10);
  drawLink(P14, P12, P13);
  drawLink(P13, P15, P14);
  drawLink(P16, P15, P17);
  drawLink(P16, P18, P17);
  drawLink(P19, P18, P20);
  drawLink(P20, P21, P19);
  drawLink(P23, P21, P22);

  drawVertex(V1, "V1");
  drawVertex(V0.position, "V0");
  drawVertex(P0, "0");
  drawVertex(P1, "1");
  drawVertex(P2, "2");
  drawVertex(P3, "3");
  drawVertex(P4, "4");
  drawVertex(P5, "5");
  drawVertex(P6, "6");
  drawVertex(P7, "7");
  drawVertex(P8, "8");
  drawVertex(P9, "9");
  drawVertex(P10, "10");
  drawVertex(P11, "11");
  drawVertex(P12, "12");
  drawVertex(P13, "13");
  drawVertex(P14, "14");
  drawVertex(P15, "15");
  drawVertex(P16, "16");
  drawVertex(P17, "17");
  drawVertex(P18, "18");
  drawVertex(P19, "19");
  drawVertex(P20, "20");
  drawVertex(P21, "21");
  drawVertex(P22, "22");
  drawVertex(P23, "23");

  return P23;
}

void linkageWithCircles(Vertex V0, Vertex V1, float L1, float L2) {

  PVector P0 = findIntersection(V0.position, V1.position, L2, L2);
  PVector P1 = newVertex(P0, V1.position, -L1);
  PVector P2 = newVertex(P0, V0.position, -L1);
  PVector P3 = findIntersection(P1, P2, -(L2-L1), -(L2-L1));
  PVector P4 = newVertex(P1, P3, L1);
  PVector P5 = newVertex(P2, P3, L1);
  PVector P6 = findIntersection(V0.position, P5, L2-L1, L1 );

  drawLink(V1.position, P0, V0.position);
  drawLink(P4, P3, P5);

  drawVertex(V1.position, "V1");
  drawVertex(V0.position, "V0");
  drawVertex(P0, "0");
  drawVertex(P1, "1");
  drawVertex(P2, "2");
  drawVertex(P3, "3");
  drawVertex(P4, "4");
  drawVertex(P5, "5");

  pushStyle();
  noFill();
  circle(P4, P0, P5);
  circle(V0.position, P3, V1.position);
  //circle(V0.position, P2, P3);
  //circle(P3, P1, V1.position);
  //circle(P4, P1, P0);
  //circle(P5, P2, P0);
  popStyle();
}

PVector drawWeirdLink(PVector V0, PVector V1) {

  //background(255);
  PVector P0 = findIntersection(V0, V1, 130, 130);
  PVector P1 = newVertex(V0, P0, -90);
  PVector P2 = newVertex(V1, P0, -80);
  PVector P3 = findIntersection(P2, P1, 50, 40);
  PVector P4 = newVertex(P1, P3, 90);
  PVector P5 = newVertex(P2, P3, 80);

  PVector P6 = findIntersection(P4, P5, 130, 130);
  PVector P7 = newVertex(P5, P6, -90);
  PVector P8 = newVertex(P4, P6, -80);
  PVector P9 = findIntersection(P7, P8, 40, 50);
  PVector P10 = newVertex(P7, P9, 90);
  PVector P11 = newVertex(P8, P9, 80);

  PVector P12 = findIntersection(P11, P10, 130, 130);
  PVector P13 = newVertex(P11, P12, -90);
  PVector P14 = newVertex(P10, P12, -80);
  PVector P15 = findIntersection(P14, P13, 50, 40);
  PVector P16 = newVertex(P13, P15, 90);
  PVector P17 = newVertex(P14, P15, 80);
  PVector P18 = findIntersection(P16, P17, 130, 130);

  drawLink(V0, P0, V1);
  drawLink(P5, P3, P4);
  drawLink(P5, P6, P4);
  drawLink(P10, P9, P11);
  drawLink(P10, P12, P11);
  drawLink(P17, P15, P16);
  drawLink(P16, P18, P17);


  drawVertex(P0, "");
  drawVertex(P1, "");
  drawVertex(P2, "");
  drawVertex(P3, "");
  drawVertex(P4, "");
  drawVertex(P5, "");
  drawVertex(P6, "");
  drawVertex(P7, "");
  drawVertex(P8, "");
  drawVertex(P9, "");
  drawVertex(P10, "");
  drawVertex(P11, "");
  drawVertex(P12, "");
  drawVertex(P13, "");
  drawVertex(P14, "");
  drawVertex(P15, "");
  drawVertex(P16, "");
  drawVertex(P17, "");
  drawVertex(P18, "");

  return P18;
}

PVector basicLink(PVector P0, PVector P1, float L1, float L2, int val) {

  PVector[] twoPoints = new PVector[2];

  PVector P_ = findIntersection(P1, P0, L2, L1);
  PVector P2 = newVertex(P_, P1, L1);
  PVector P3 = newVertex(P_, P0, L2);

  twoPoints[0] = P2;
  twoPoints[1] = P3;

  drawLink(P0, P_, P1);
  drawLink(P2, P_, P3);

  drawVertex(P0);
  drawVertex(P1);
  drawVertex(P_);

  if (val%2 == 0) {
    drawVertex(P3);
    return twoPoints[1];
  } else {
    drawVertex(P2);
    return twoPoints[0];
  }
}

PVector drawPolygon(Vertex V0, Vertex V1, float L1, float L2, int pedals, boolean ray, boolean circle) {
  //if(pedals > 2){
  PVector[] twos = new PVector[pedals];
  PVector[] threes = new PVector[pedals];

  twos[0] = basicLink(V0.position, V1.position, L2, L1, 1);
  threes[0] = basicLink(V0.position, V1.position, L2, L1, 0);

  twos[1] = basicLink(twos[0], threes[0], L2, L1, 0);
  threes[1] = basicLink(twos[0], threes[0], L2, L1, 1);

  twos[2] = basicLink(threes[1], twos[1], L2, L1, 0);
  threes[2] = basicLink(threes[1], twos[1], L2, L1, 1);

  if (ray) {
    ray(V0.position, V1.position);
    ray(twos[0], threes[0]);
    ray(twos[1], threes[1]);
    ray(twos[2], threes[2]);
  }
  if (circle) {
    pushStyle();
    noFill();
    circle(twos[0], threes[1], threes[2]);
    circle(threes[0], twos[1], twos[2]);
    popStyle();
  }

  for (int i = 3; i < pedals; i += 1) {
    twos[i] = basicLink(threes[i-1], twos[i-1], L2, L1, 0);
    threes[i] = basicLink(threes[i-1], twos[i-1], L2, L1, 1);
    if (ray) {
      ray(twos[i], threes[i]);
    }
  }
  PVector P0 = threes[pedals - 1];
  return P0;
  //}
}

PVector drawPath(Vertex V0, Vertex V1, float R0, float R1, float L0, float L1, float L2, float theta) {
  PVector P0 = generateAnchor(V0.position, R0, (theta - 90) * 47);
  PVector P = generateAnchor(V1.position, R1, theta * 47);
  PVector P1 = generateAnchor(P, R1, theta * 13);

  PVector P2 = findIntersection(P0, P1, L0, L0);
  PVector P3 = newVertex(P2, P0, L1);
  PVector P4 = newVertex(P2, P1, L1);
  PVector P5 = findIntersection(P4, P3, L2, L2);

  drawLink(P0, P2, P1);
  drawLink(P3, P2, P4);
  drawLink(P3, P5, P4);

  pushStyle();
    fill(93, 93, 93, 60);
    noStroke();
    ellipse(V0.position.x, V0.position.y, 2 * R0, 2 * R0);
    ellipse(V1.position.x, V1.position.y, 2 * R1, 2 * R1);
    ellipse(P.x, P.y, R1 * 2, R1 * 2);
  popStyle();

  return P5;
}

PVector twinPoles(Vertex V0, boolean links, boolean circles) {
  PVector P0 = new PVector(width / 2 + 200, 60);
  PVector P1 = new PVector(width / 2 + 200, height - 60);

  float dist = (dist(P0.x, P0.y, P1.x, P1.y)) / 2;

  PVector P2 = findIntersection(V0.position, P0, dist, dist);
  PVector P3 = findIntersection(P1, V0.position, dist, dist);

  PVector P4 = findIntersection(P3, P2, dist, dist);

  if (links) {
    drawLink(P0, P2, V0.position);
    drawLink(P1, P3, V0.position);
    drawLink(P3, P4, P2);
  }

  if (circles) {
    pushStyle();
    pushMatrix();
    ellipseMode(CENTER);
    noStroke();
    fill(93, 93, 93, 60);
    ellipse(P0.x, P1.y - dist, dist * 2, dist * 2); 
    ellipse(P3.x, P3.y, dist * 2, dist * 2);
    ellipse(P2.x, P2.y, dist * 2, dist * 2);
    popMatrix();
    popStyle();
  }

  ellipse(P4.x, P4.y, 10, 10);

  return P4;
}