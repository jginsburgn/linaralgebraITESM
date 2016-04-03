Trump trump;
int counter;

void setup()
{
    counter = 0;
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
    background(180);
}

void keyPressed()
{
    if(key == 'a') trump.animateFace();
}