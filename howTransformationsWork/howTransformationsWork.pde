
void setup() {
  size(600, 600);
  background(255);
  drawOrigin(0);
  pushMatrix();
  translate(200, 200);
  drawOrigin(1);
  rotate(radians(45));
  drawOrigin(2);
  translate(100, 0);
  drawOrigin(3);
  rotate(radians(-40));
  drawOrigin(4);
}

void drawOrigin(int number) {
    line(-30, 0, 30, 0);
  line(0, -30, 0, 30);
  textSize(12);
  fill(0);
  text(Integer.toString(number), 2, 14);
}

void draw() {
}