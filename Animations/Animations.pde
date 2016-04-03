Trump trump;
PImage background;
final String BACKGROUND_SOURCE = "background_media/whitehouse.jpg";

//int counter;

void setup()
{
    //counter = 0;
    background = loadImage(BACKGROUND_SOURCE);
    trump = new Trump();
    size(800,600);
    clear();
    trump.draw();
}

void draw()
{
  clear();
  trump.draw();
    //60 frames per second proof
    //String counterString = Integer.toString(counter++/60);
    //textSize(32);
    //fill(color(0,0,0));
    //text(counterString, 100, 100);
}

void clear() {
    image(background, -50, 0);
}

void keyPressed()
{
    if(key == 'a') trump.animateFace(1);
    if(key == 'b') trump.animateLeftArm(1);
}
