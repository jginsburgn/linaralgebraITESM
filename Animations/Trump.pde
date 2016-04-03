//Important: perspectives (left vs. right) are respective to the user perception.

class Trump {
    final int FPS = 60;

    //Face animation sequence:
    boolean isAnimatingFace = false;
    int faceAnimationStep = 0;
    int faceAnimationSequence = 0;

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

    //Left arm animation sequence:
    boolean isAnimatingLeftArm = false;
    int leftArmAnimationStep = 0;
    int leftArmAnimationSequence = 0;

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

    void drawLeftLeg() {
        pushMatrix();
        translate(leftLegX, leftLegY);
        image(leftLeg, 0, 0);
        popMatrix();
    }

    void drawRightLeg() {
        pushMatrix();
        translate(rightLegX, rightLegY);
        image(rightLeg, 0, 0);
        popMatrix();
    }

    void drawLeftArm() {
        pushMatrix();
        translate(leftArmX, leftArmY);
        if (isAnimatingLeftArm) {
            stepLeftArmAnimation(); //<>//
        }
        image(leftArm, 0, 0);
        popMatrix();
    }

    void drawRightArm() {
        pushMatrix();
        translate(rightArmX, rightArmY);
        image(rightArm, 0, 0);
        popMatrix();
    }

    void drawTorso() {
        pushMatrix();
        translate(torsoX, torsoY);
        image(torso, 0, 0);
        popMatrix();
    }

    void drawFace() {
        pushMatrix();
        translate(faceX, faceY); //<>//
        if (isAnimatingFace) {
            stepFaceAnimation(); //<>//
        }
        image(face, 0, 0);
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
        imageMode(CORNER);
    }

    void stepFaceAnimation() {
        if (faceAnimationSequence == 1) {
            //animation number of steps //<>//
            //first factor of the assigned multiplication
            //the number of seconds for the duration
            int animationTotalSteps = 5*FPS;
            if (faceAnimationStep++ == animationTotalSteps) isAnimatingFace = false;
            else {
                float completionFraction = ((float)faceAnimationStep/(float)animationTotalSteps);
                float angle = completionFraction * 2 * PI;
                rotate(angle);
            }
        }
        else if (faceAnimationSequence == 2) {

        }
    }

    void animateFace(int sequence) {
        if (!isAnimatingFace) {
            faceAnimationStep = 0;
            faceAnimationSequence = sequence;
            isAnimatingFace = true;
        }
    }

    void stepLeftArmAnimation() {
        if (leftArmAnimationSequence == 1) {
            //animation number of steps //<>//
            //first factor of the assigned multiplication
            //the number of seconds for the duration
            int animationTotalSteps = 5*FPS;
            if (leftArmAnimationStep++ == animationTotalSteps) isAnimatingLeftArm = false;
            else {
                float completionFraction = ((float)leftArmAnimationStep/(float)animationTotalSteps);
                float angle = completionFraction * 2 * PI;
                translate(10, -100);
                rotate(angle);
                translate(-10, 100);
            }
        }
        else if (leftArmAnimationSequence == 2) {

        }
    }

    void animateLeftArm(int sequence) {
        if (!isAnimatingLeftArm) {
            leftArmAnimationStep = 0;
            leftArmAnimationSequence = sequence;
            isAnimatingLeftArm = true;
        }
    }
}
