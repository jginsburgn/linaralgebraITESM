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
    fill(0);
    textSize(12);
    text("Presionar a para tristeza.\nPresionar b para enojo.\nPresionar c para felicidad.\nPresionar r para rotación loca.", 2, 14);
    fill(255);
    text("Jonathan Ginsburg A01021617, Alberto Pickering y Sebastian Galguera. Abril 3, 2016. Proyecto parcial Álgebra Lineal.", 4, 594);
}

void keyPressed()
{
    if(key == 'r') trump.animateAll(1); //rotacion loca
    if(key == 'a') trump.animateAll(2); //tristeza
    if(key == 'b') trump.animateAll(3); //enojo
    if(key == 'c') trump.animateAll(4); //felicidad
}
