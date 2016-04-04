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

    //Torso animation sequence:
    boolean isAnimatingTorso = false;
    int torsoAnimationStep = 0;
    int torsoAnimationSequence = 0;

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
    int leftArmX = 330;
    int leftArmY = 170;
    final String LEFTARM_SOURCE = "trump_media/leftarm.png";
    final PImage leftArm = loadImage(LEFTARM_SOURCE);

    //Right Arm animation sequence:
    boolean isAnimatingRightArm = false;
    int rightArmAnimationStep = 0;
    int rightArmAnimationSequence = 0;

    //Right Arm
    int rightArmX = 470;
    int rightArmY = 170;
    final String RIGHTARM_SOURCE = "trump_media/rightarm.png";
    final PImage rightArm = loadImage(RIGHTARM_SOURCE);

    //Left Leg animation sequence:
    boolean isAnimatingLeftLeg = false;
    int leftLegAnimationStep = 0;
    int leftLegAnimationSequence = 0;

    //Left Leg
    int leftLegX = 370;
    int leftLegY = 330;
    final String LEFTLEG_SOURCE = "trump_media/leftleg.png";
    final PImage leftLeg = loadImage(LEFTLEG_SOURCE);

    //Right Leg animation sequence:
    boolean isAnimatingRightLeg = false;
    int rightLegAnimationStep = 0;
    int rightLegAnimationSequence = 0;

    //Right Leg
    int rightLegX = 430;
    int rightLegY = 330;
    final String RIGHTLEG_SOURCE = "trump_media/rightleg.png";
    final PImage rightLeg = loadImage(RIGHTLEG_SOURCE);

    void drawLeftLeg() {
        pushMatrix();
        translate(leftLegX, leftLegY);
        if (isAnimatingLeftLeg) {
            stepLeftLegAnimation();
        }
        image(leftLeg, -30, 117);
        popMatrix();
    }

    void drawRightLeg() {
        pushMatrix();
        translate(rightLegX, rightLegY);
        if (isAnimatingRightLeg) {
            stepRightLegAnimation();
        }
        image(rightLeg, 30, 117);
        popMatrix();
    }

    void drawLeftArm() {
        pushMatrix();
        translate(leftArmX, leftArmY);
        if (isAnimatingLeftArm) {
            stepLeftArmAnimation();
        }
        image(leftArm, -20, 90);
        popMatrix();
    }

    void drawRightArm() {
        pushMatrix();
        translate(rightArmX, rightArmY);
        if (isAnimatingRightArm) {
            stepRightArmAnimation();
        }
        image(rightArm, 20, 90);
        popMatrix();
    }

    void drawTorso() {
        pushMatrix();
        translate(torsoX, torsoY);
        if (isAnimatingTorso) {
            stepTorsoAnimation();
        }
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
            if (faceAnimationStep++ >= animationTotalSteps) isAnimatingFace = false;
            else {
                float completionFraction = ((float)faceAnimationStep/(float)animationTotalSteps);
                float angle = completionFraction * 2 * PI;
                rotate(angle);
            }
        }
        else if (faceAnimationSequence == 2) {
            float animationTotalSteps = 2*(float)FPS;
            if (faceAnimationStep++ >= animationTotalSteps) isAnimatingFace = false;
            else {
                float localCycle = (float)animationTotalSteps/3;
                float localCounter = (float)faceAnimationStep%localCycle;
                float periodFrac = ((float)localCounter/(float)localCycle)*2*PI;
                float angle = sin(periodFrac) * PI/7;
                float secondPeriodFrac = ((float)faceAnimationStep/(float)animationTotalSteps)*PI;
                float scaleFactor = 1 + -0.2*sin(secondPeriodFrac);
                translate(0, 20*sin(secondPeriodFrac));
                //rotate(angle);
                //scale(scaleFactor, scaleFactor);
            }
        }
        else if (faceAnimationSequence == 3) {
            float animationTotalSteps = 2*(float)FPS;
            if (faceAnimationStep++ >= animationTotalSteps) isAnimatingFace = false;
            else{
                float periodFrac = ((float)faceAnimationStep/(float)animationTotalSteps)*PI;
                float scalingFactor = 1 + 0.2*sin(periodFrac);
                translate(0, -20*sin(periodFrac));
                scale(scalingFactor, scalingFactor);
                tint(255, (255-70*sin(periodFrac)), (255-70*sin(periodFrac)));
            }
        }
        else if (faceAnimationSequence == 4) {
            float animationTotalSteps = 3*(float)FPS;
            if (faceAnimationStep++ >= animationTotalSteps) isAnimatingFace = false;
            else{
                float periodFrac = ((float)faceAnimationStep/(float)animationTotalSteps)*2*PI;
                float angle = radians(30)*sin(3*periodFrac);
                translate(0, 25);
                rotate(angle);
                translate(0, -25);
            }
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
                rotate(angle);
            }
        }
        else if (leftArmAnimationSequence == 2) {
            float animationTotalSteps = 2*(float)FPS;
            if (leftArmAnimationStep++ >= animationTotalSteps) isAnimatingLeftArm = false;
            else {
                float periodFrac = ((float)leftArmAnimationStep/(float)animationTotalSteps)*PI;
                float angle = PI*2/3*sin(periodFrac);
                //rotate(angle);
                float scalingFactor = 1 -0.2*sin(periodFrac);
                //scale(scalingFactor, scalingFactor);
                translate(0, 20*sin(periodFrac));
            }
        }
        else if (leftArmAnimationSequence == 3) {
            float animationTotalSteps = 2*(float)FPS;
            if (leftArmAnimationStep++ >= animationTotalSteps) isAnimatingLeftArm = false;
            else {
                translate(10,0);
                float periodFrac = 10*((float)leftArmAnimationStep/(float)animationTotalSteps)*2*PI;
                float range = (sin(periodFrac)+1)/2;
                rotate(range*(PI*2/4)+PI*2/4-PI*1/4);
            }
        }
        else if (leftArmAnimationSequence == 4) {
            float animationTotalSteps = 3*(float)FPS;
            if (leftArmAnimationStep++ >= animationTotalSteps) isAnimatingLeftArm = false;
            else {
                float periodFrac = ((float)leftArmAnimationStep/(float)animationTotalSteps)*2*PI;
                rotate(PI*5/6*sin(periodFrac/2));
            }
        }
    }

    void animateLeftArm(int sequence) {
        if (!isAnimatingLeftArm) {
            leftArmAnimationStep = 0;
            leftArmAnimationSequence = sequence;
            isAnimatingLeftArm = true;
        }
    }

    void stepRightArmAnimation() {
        if (rightArmAnimationSequence == 1) {
            //animation number of steps //<>//
            //first factor of the assigned multiplication
            //the number of seconds for the duration
            int animationTotalSteps = 5*FPS;
            if (rightArmAnimationStep++ == animationTotalSteps) isAnimatingRightArm = false;
            else {
                float completionFraction = ((float)rightArmAnimationStep/(float)animationTotalSteps);
                float angle = completionFraction * 2 * PI;
                rotate(angle);
            }
        }
        else if (rightArmAnimationSequence == 2) {
            float animationTotalSteps = 2*(float)FPS;
            if (rightArmAnimationStep++ >= animationTotalSteps) isAnimatingRightArm = false;
            else {
                float periodFrac = ((float)rightArmAnimationStep/(float)animationTotalSteps)*PI;
                float angle = -PI*2/3*sin(periodFrac);
                //rotate(angle);
                float scalingFactor = 1 -0.2*sin(periodFrac);
                //scale(scalingFactor, scalingFactor);
                translate(0, 20*sin(periodFrac));
            }
        }
        else if (rightArmAnimationSequence == 3) {
            float animationTotalSteps = 2*(float)FPS;
            if (rightArmAnimationStep++ >= animationTotalSteps) isAnimatingRightArm = false;
            else {
                translate(-10,0);
                float periodFrac = 10*((float)leftArmAnimationStep/(float)animationTotalSteps)*2*PI;
                float range = (sin(periodFrac)+1)/2;
                rotate(-range*(PI*2/4)-PI*2/4+PI*1/4);
            }
        }
        else if (rightArmAnimationSequence == 4) {
            float animationTotalSteps = 3*(float)FPS;
            if (rightArmAnimationStep++ >= animationTotalSteps) isAnimatingRightArm = false;
            else {
                float periodFrac = ((float)rightArmAnimationStep/(float)animationTotalSteps)*2*PI;
                rotate(-PI*5/6*sin(periodFrac/2));
            }
        }
    }

    void animateRightArm(int sequence) {
        if (!isAnimatingRightArm) {
            rightArmAnimationStep = 0;
            rightArmAnimationSequence = sequence;
            isAnimatingRightArm = true;
        }
    }

    void stepLeftLegAnimation() {
        if (leftLegAnimationSequence == 1) {
            //animation number of steps
            //first factor of the assigned multiplication
            //the number of seconds for the duration
            int animationTotalSteps = 5*FPS;
            if (leftLegAnimationStep++ == animationTotalSteps) isAnimatingLeftLeg = false;
            else {
                float completionFraction = ((float)leftLegAnimationStep/(float)animationTotalSteps);
                float angle = completionFraction * 2 * PI;
                rotate(angle);
            }
        }
        else if (leftLegAnimationSequence == 2) {
            //Do nothing
            isAnimatingLeftLeg = false;
            // float animationTotalSteps = 2*(float)FPS;
            // if (leftLegAnimationStep++ >= animationTotalSteps) isAnimatingLeftLeg = false;
            // else {
            //     float periodFrac = ((float)leftLegAnimationStep/(float)animationTotalSteps)*PI;
            //     float angle = PI/5*sin(periodFrac);
            //     rotate(angle);
            //     translate(0, -30*sin(periodFrac));
            // }
        }
        else if (leftLegAnimationSequence == 3) {
            //Do nothing
            isAnimatingLeftLeg = false;
        }
        else if (leftLegAnimationSequence == 4) {
            float animationTotalSteps = 3*(float)FPS;
            if (leftLegAnimationStep++ >= animationTotalSteps) isAnimatingLeftLeg = false;
            else {
                float periodFrac = ((float)leftLegAnimationStep/(float)animationTotalSteps)*2*PI;
                rotate(PI*1/6*sin(periodFrac/2));
            }
        }
    }

    void animateLeftLeg(int sequence) {
        if (!isAnimatingLeftLeg) {
            leftLegAnimationStep = 0;
            leftLegAnimationSequence = sequence;
            isAnimatingLeftLeg = true;
        }
    }

    void stepRightLegAnimation() {
        if (rightLegAnimationSequence == 1) {
            //animation number of steps
            //first factor of the assigned multiplication
            //the number of seconds for the duration
            int animationTotalSteps = 5*FPS;
            if (rightLegAnimationStep++ == animationTotalSteps) isAnimatingRightLeg = false;
            else {
                float completionFraction = ((float)rightLegAnimationStep/(float)animationTotalSteps);
                float angle = completionFraction * 2 * PI;
                rotate(angle);
            }
        }
        else if (rightArmAnimationSequence == 2) {
            //do nothing
            isAnimatingRightLeg = false;
        }
        else if (rightArmAnimationSequence == 3) {
            //do nothing
            isAnimatingRightLeg = false;
        }
        else if (rightArmAnimationSequence == 4) {
            //do nothing
            isAnimatingRightLeg = false;
        }
    }

    void animateRightLeg(int sequence) {
        if (!isAnimatingRightLeg) {
            rightLegAnimationStep = 0;
            rightLegAnimationSequence = sequence;
            isAnimatingRightLeg = true;
        }
    }

    void stepTorsoAnimation() {
        if (torsoAnimationSequence == 1) {
            //animation number of steps
            //first factor of the assigned multiplication
            //the number of seconds for the duration
            int animationTotalSteps = 5*FPS;
            if (torsoAnimationStep++ == animationTotalSteps) isAnimatingTorso = false;
            else {
                float completionFraction = ((float)torsoAnimationStep/(float)animationTotalSteps);
                float angle = completionFraction * 2 * PI;
                rotate(angle);
            }
        }
        else if (torsoAnimationSequence == 2) {
            //DO nothing
            isAnimatingTorso = false;
        }
        else if (torsoAnimationSequence == 3) {
            //DO nothing
            isAnimatingTorso = false;
        }
        else if (torsoAnimationSequence == 4) {
            float animationTotalSteps = 3*(float)FPS;
            if (torsoAnimationStep++ >= animationTotalSteps) isAnimatingTorso = false;
            else {
                float periodFrac = ((float)torsoAnimationStep/(float)animationTotalSteps)*2*PI;
                translate(5*sin(periodFrac*3), 0);
                rotate(-PI*sin(periodFrac*3)/50);
            }
        }
    }

    void animateTorso(int sequence) {
        if (!isAnimatingTorso) {
            torsoAnimationStep = 0;
            torsoAnimationSequence = sequence;
            isAnimatingTorso = true;
        }
    }

    void animateAll(int sequence) {
        trump.animateFace(sequence);
        trump.animateLeftArm(sequence);
        trump.animateLeftLeg(sequence);
        trump.animateRightArm(sequence);
        trump.animateRightLeg(sequence);
        trump.animateTorso(sequence);
    }

    boolean isNumberBetween(float num, float low, float high) {
        return num >= low && num < high;
    }
}
