PImage cara;
PImage cuerpo;
PImage brazoDerecho;
PImage brazoIzquierdo;
PImage piernaDerecha;
PImage piernaIzquierda;

final float SCALE_LIMIT = 1.2;
float scaleFactor = 1;
float scaleChange = 0.01;
float translateHead = 60;
float translateHeadChange = 12.0 / ((SCALE_LIMIT - 1.0) / scaleChange);

final float ANGLE_LIMIT = 30;
float armAngle = 0;
float angleChange = 1.5;
float translateLeftArm = 178;
float translateLeftArmChange = 10.0 / (ANGLE_LIMIT / angleChange);

final float RIGHT_ARM_LIMIT = 190;
float translateRightArm = 170;
float translateRightArmChange = 1;

final float LEFT_LEG_LIMIT_X = 145;
final float LEFT_LEG_LIMIT_Y = 240;
float translateLeftLegX = 120;
float translateLeftLegY = 310;
float translateLeftLegChangeX = 2.5;
float translateLeftLegChangeY = 7;
boolean vertical = true;

void setup() {
  size(600,600);
  cara = loadImage("cara.png");
  cuerpo = loadImage("cuerpo.png");
  brazoDerecho = loadImage("brazo_derecho.png");
  brazoIzquierdo = loadImage("brazo_izquierdo.png");
  piernaDerecha = loadImage("pierna_derecha.png");
  piernaIzquierda = loadImage("pierna_izquierda.png");
  smooth();
  frameRate(30);
}

void draw() {
  background(255);
  pushMatrix();
  translate(50, 25);
  drawTrump();
  
  // Escalar la cabeza
  scaleFactor += scaleChange;
  translateHead -= translateHeadChange;
  if (scaleFactor > SCALE_LIMIT || scaleFactor < 1) {
    scaleChange *= -1;
    translateHeadChange *= -1;
    scaleFactor += scaleChange;
    translateHead -= translateHeadChange;
  }
  
  // Rotar brazo
  armAngle += angleChange;
  translateLeftArm -= translateLeftArmChange;
  if (armAngle > ANGLE_LIMIT || armAngle < 0) {
    angleChange *= -1;
    translateLeftArmChange *= -1; 
    armAngle += angleChange;
    translateLeftArm -= translateLeftArmChange;
  }
  
  // Trasladar brazo
  translateRightArm += translateRightArmChange;
  if (translateRightArm > RIGHT_ARM_LIMIT || translateRightArm < 170) {
    translateRightArmChange *= -1; 
    translateRightArm += translateRightArmChange;
  }
  
  // Trasladar pierna
  if (vertical) {
    translateLeftLegY -= translateLeftLegChangeY;
    if (translateLeftLegY < LEFT_LEG_LIMIT_Y || translateLeftLegY > 310) {
      translateLeftLegChangeY *= -1;
      translateLeftLegY -= translateLeftLegChangeY;
      vertical = false;
    }
  }
  if (!vertical) {
    translateLeftLegX += translateLeftLegChangeX;
    if (translateLeftLegX > LEFT_LEG_LIMIT_X || translateLeftLegX < 120) {
      translateLeftLegChangeX *= -1;
      translateLeftLegX += translateLeftLegChangeX;
      vertical = true;
    }
  }
  
  popMatrix();
}

void drawTrump() {
  image(piernaDerecha,8,310);
  drawPiernaIzquierda();
  image(cuerpo,20,110);
  drawCara();
  drawBrazoDerecho();
  drawBrazoIzquierdo();
}

void drawPiernaIzquierda() {
  pushMatrix();
  translate(translateLeftLegX,translateLeftLegY);
  image(piernaIzquierda,0,0);
  popMatrix();
}

void drawBrazoDerecho() {
  pushMatrix();
  translate(0, translateRightArm);
  scale(1,-1);
  image(brazoDerecho,0,0);
  popMatrix();
}

void drawBrazoIzquierdo() {
  pushMatrix();
  translate(translateLeftArm, 136);
  rotate(radians(-armAngle));
  image(brazoIzquierdo,0,0);
  popMatrix();
}

void drawCara() {
  pushMatrix();
  translate(translateHead, 0);
  scale(scaleFactor);
  image(cara,0,0);
  popMatrix();
}