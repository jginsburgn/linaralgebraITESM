//Important: perspectives (left vs. right) are respective to the user perception.

class Trump {
  
    //Face animation sequence:
    boolean isAnimatingFace = false;
    int counter = 0;
    float angle = 0;

    //Face
    int faceX = 397;
    int faceY = 80;
    final String FACE_SOURCE = "trump_media/face.png";
    final PImage face = loadImage(FACE_SOURCE);

    //Torso
    int torsoX = 400;
    int torsoY = 248;
    final String TORSO_SOURCE = "trump_media/torso.png";
    final PImage torso = loadImage(TORSO_SOURCE);

    //Left Arm
    int leftArmX = 310;
    int leftArmY = 260;
    final String LEFTARM_SOURCE = "trump_media/leftarm.png";
    final PImage leftArm = loadImage(LEFTARM_SOURCE);

    //Right Arm
    int rightArmX = 490;
    int rightArmY = 260;
    final String RIGHTARM_SOURCE = "trump_media/rightarm.png";
    final PImage rightArm = loadImage(RIGHTARM_SOURCE);

    //Left Leg
    int leftLegX = 340;
    int leftLegY = 430;
    final String LEFTLEG_SOURCE = "trump_media/leftleg.png";
    final PImage leftLeg = loadImage(LEFTLEG_SOURCE);

    //Right Leg
    int rightLegX = 460;
    int rightLegY = 430;
    final String RIGHTLEG_SOURCE = "trump_media/rightleg.png";
    final PImage rightLeg = loadImage(RIGHTLEG_SOURCE);

    Trump () {
    }

    void drawLeftLeg() {
        image(leftLeg, leftLegX, leftLegY);
    }

    void drawRightLeg() {
        image(rightLeg, rightLegX, rightLegY);
    }

    void drawLeftArm() {
        image(leftArm, leftArmX, leftArmY);
    }

    void drawRightArm() {
        image(rightArm, rightArmX, rightArmY);
    }

    void drawTorso() {
        image(torso, torsoX, torsoY);
    }

    void drawFace() {
        pushMatrix();
        if (isAnimatingFace) {
          if (counter++ == 600) isAnimatingFace = false;
          else {
            angle = angle + 2*PI/600;
            translate(faceX, faceY);
            rotate(angle);
            translate(-faceX, -faceY);
          }
        }
        image(face, faceX, faceY);
        popMatrix();
    }

    void draw()
    {
        imageMode(CENTER);
        drawLeftLeg();
        drawRightLeg();
        drawLeftArm();
        drawRightArm();
        drawTorso();
        drawFace();
        // image(face, faceX, faceY);
        // pushMatrix();
        // rotate(PI/4);
        // image(torso, torsoX, torsoY);
        // popMatrix();
        // image(face, faceX +100, faceY + 100);
        imageMode(CORNER);
    }
    
    void animateFace() {
      counter = 0;
      angle = 0;
      isAnimatingFace = true;
    }

}