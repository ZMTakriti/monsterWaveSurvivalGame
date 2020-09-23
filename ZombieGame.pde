PImage img;
boolean jumping = false;
boolean done = false;
boolean forward = false;
boolean backward = false;
boolean onPlat = true;
boolean drop = false;
boolean attacking = false;
boolean damage = false;
boolean field = false;
boolean fieldKnock = false;


ArrayList<enemy> enemyArray = new ArrayList<enemy>();


int msec = 0;
int sec = 0;
int min = 0;
int enemyTime = 0;
int attackTime = 0;
int cHealth = 100;
int inv = 0;
int killCount = 0;
int spawnR = 10;
int fieldCooldown = 0;
int knockCount = 0;

PImage MR1;
PImage MR2;
PImage MR3;
PImage MR4;
PImage MR5;
PImage MR6;
PImage MR7;
PImage MR8;

PImage ML1;
PImage ML2;
PImage ML3;
PImage ML4;
PImage ML5;
PImage ML6;
PImage ML7;
PImage ML8;

PImage MRJ;
PImage MLJ;

PImage MRA;
PImage MLA;

PImage SR;
PImage SL;

PImage MONR1;
PImage MONR2;
PImage MONR3;
PImage MONR4;
PImage MONR5;
PImage MONR6;
PImage MONR7;
PImage MONR8;

PImage MONL1;
PImage MONL2;
PImage MONL3;
PImage MONL4;
PImage MONL5;
PImage MONL6;
PImage MONL7;
PImage MONL8;

PImage over;

int frameRight = 1;
int frameLeft = 1;
int xB = 0;
float yP = 265;
int xP = 150;
int platY = 235;
int platX = 1900;
char press;
int jumpHeight = 130;







void setup() {

  frameRate(60);

  size(800, 500);
  img = loadImage("background.png");

  img.resize(4000, 500);

  background(255, 255, 255);
  fill(0, 0, 0);
  image(img, 0, 0);
  rect(platX, platY, 100, 100);

  MR1 = loadImage("MR1.png");
  MR2 = loadImage("MR2.png");
  MR3 = loadImage("MR3.png");
  MR4 = loadImage("MR4.png");
  MR5 = loadImage("MR5.png");
  MR6 = loadImage("MR6.png");
  MR7 = loadImage("MR7.png");
  MR8 = loadImage("MR8.png");

  ML1 = loadImage("ML1.png");
  ML2 = loadImage("ML2.png");
  ML3 = loadImage("ML3.png");
  ML4 = loadImage("ML4.png");
  ML5 = loadImage("ML5.png");
  ML6 = loadImage("ML6.png");
  ML7 = loadImage("ML7.png");
  ML8 = loadImage("ML8.png");

  MRJ = loadImage("MRJ.png");
  MLJ = loadImage("MLJ.png");

  MRA = loadImage("MRA.png");
  MLA = loadImage("MLA.png");

  SR = loadImage("SR.png");
  SL = loadImage("SL.png");

  MONR1 = loadImage("MONR1.png");
  MONR2 = loadImage("MONR2.png");
  MONR3 = loadImage("MONR3.png");
  MONR4 = loadImage("MONR4.png");
  MONR5 = loadImage("MONR5.png");
  MONR6 = loadImage("MONR6.png");
  MONR7 = loadImage("MONR7.png");
  MONR8 = loadImage("MONR8.png");

  MONL1 = loadImage("MONL1.png");
  MONL2 = loadImage("MONL2.png");
  MONL3 = loadImage("MONL3.png");
  MONL4 = loadImage("MONL4.png");
  MONL5 = loadImage("MONL5.png");
  MONL6 = loadImage("MONL6.png");
  MONL7 = loadImage("MONL7.png");
  MONL8 = loadImage("MONL8.png");

  over = loadImage("game-over.png");

  over.resize(840, 525);

  MR1.resize(128, 128);
  MR2.resize(128, 128);
  MR3.resize(128, 128);
  MR4.resize(128, 128);
  MR5.resize(128, 128);
  MR6.resize(128, 128);
  MR7.resize(128, 128);
  MR8.resize(128, 128);
  MRJ.resize(128, 128);

  ML1.resize(128, 128);
  ML2.resize(128, 128);
  ML3.resize(128, 128);
  ML4.resize(128, 128);
  ML5.resize(128, 128);
  ML6.resize(128, 128);
  ML7.resize(128, 128);
  ML8.resize(128, 128);
  MLJ.resize(128, 128);

  MRA.resize(128, 128);
  MLA.resize(128, 128);

  SR.resize(128, 128);
  SL.resize(128, 128);

  MONR1.resize(128, 128);
  MONR2.resize(128, 128);
  MONR3.resize(128, 128);
  MONR4.resize(128, 128);
  MONR5.resize(128, 128);
  MONR6.resize(128, 128);
  MONR7.resize(128, 128);
  MONR8.resize(128, 128);

  MONL1.resize(128, 128);
  MONL2.resize(128, 128);
  MONL3.resize(128, 128);
  MONL4.resize(128, 128);
  MONL5.resize(128, 128);
  MONL6.resize(128, 128);
  MONL7.resize(128, 128);
  MONL8.resize(128, 128);

  image(MR1, xP, yP);
}

void draw() {

  time();

  if ((press == 'w') && (jumping == false) && (yP == jumpHeight+135)) {
    jumping = true;
    press = '\0';
  }

  if (jumping) {
    if (yP > jumpHeight) {
      yP-=10;
    } else if (yP == jumpHeight) {
      jumping = false;
      done = true;
    }
  }

  if (done) {
    yP+=10;
    if (yP == (jumpHeight+135)) {
      done = false;
      yP=jumpHeight+135;
    }
  }


  if ((forward)&&(xB!=-3200)&&(xP==150)) {
    xB -= 5;
    platX-=5;
    press = '\0';
  } else if ((forward)&&(xP<800)) {
    xP += 5;
  }

  if ((backward)&&(xB!=0)&&(xP==150)) {
    xB += 5;
    platX+=5;
    press = '\0';
  } else if ((backward)&&(xP>0)) {
    xP -= 5;
  }

  if ((press == 's')&&(onPlat == true)&&(yP <= platY-105)) {
    drop = true;
    press = '\0';
  }
  if ((xP>platX-100)&&(xP<platX+60)&&(yP <= platY-105)) {
    if ((onPlat == false)&&(yP <= platY-105)) {
      onPlat = true;
      jumping = false;
      done = false;
    }
  } else if ((((platX>150)||(platX<220))&&(yP<=platY-105))) {
    done = true;
    jumping = false;
    jumpHeight = 130;
    onPlat = false;
  }

  if (drop == true) {
    jumpHeight = 130;
    done = true;
    jumping = false;
    drop = false;
    onPlat = false;
  }


  fill(255, 255, 255);
  image(img, xB, 0);
  fill(0, 0, 0);

  if ((mousePressed == true)&&(backward)&&(attackTime<10)&&(yP==265)) {
    image(MLA, xP, yP);
    image(SL, xP-60, yP+10);
    attackTime+=1;
    if (attacking == false) {
      attacking = true;
    }
  } else if ((mousePressed == true)&&(attackTime<10)&&(yP==265)) {
    image(MRA, xP, yP);
    image(SR, xP+60, yP+10);
    attackTime+=1;
    if (attacking == false) {
      attacking = true;
    }
  } else if ((forward)&&(jumping == false)&&(done == false)) {
    if ((frameRight==1)||(frameRight==2)) {
      image(MR1, xP, yP);
      frameRight += 1;
    } else if ((frameRight==3)||(frameRight==4)) {
      image(MR2, xP, yP);
      frameRight += 1;
    } else if ((frameRight==5)||(frameRight==6)) {
      image(MR3, xP, yP);
      frameRight += 1;
    } else if ((frameRight==7)||(frameRight==8)) {
      image(MR4, xP, yP);
      frameRight += 1;
    } else if ((frameRight==9)||(frameRight==10)) {
      image(MR5, xP, yP);
      frameRight += 1;
    } else if ((frameRight==11)||(frameRight==12)) {
      image(MR6, xP, yP);
      frameRight += 1;
    } else if ((frameRight==13)||(frameRight==14)) {
      image(MR7, xP, yP);
      frameRight += 1;
    } else if (frameRight==15) {
      image(MR8, xP, yP);
      frameRight += 1;
    } else if (frameRight==16) {
      image(MR8, xP, yP);
      frameRight = 1;
    }
  } else if ((backward)&&(jumping == false)&&(done == false)) {
    if ((frameLeft==1)||(frameLeft==2)) {
      image(ML1, xP, yP);
      frameLeft += 1;
    } else if ((frameLeft==3)||(frameLeft==4)) {
      image(ML2, xP, yP);
      frameLeft += 1;
    } else if ((frameLeft==5)||(frameLeft==6)) {
      image(ML3, xP, yP);
      frameLeft += 1;
    } else if ((frameLeft==7)||(frameLeft==8)) {
      image(ML4, xP, yP);
      frameLeft += 1;
    } else if ((frameLeft==9)||(frameLeft==10)) {
      image(ML5, xP, yP);
      frameLeft += 1;
    } else if ((frameLeft==11)||(frameLeft==12)) {
      image(ML6, xP, yP);
      frameLeft += 1;
    } else if ((frameLeft==13)||(frameLeft==14)) {
      image(ML7, xP, yP);
      frameLeft += 1;
    } else if (frameLeft==15) {
      image(ML8, xP, yP);
      frameLeft += 1;
    } else if (frameLeft == 16) {
      image(ML8, xP, yP);
      frameLeft = 1;
    }
  } else if (((jumping)&&(forward))||((done)&&(forward))) {
    image(MRJ, xP, yP);
  } else if (((jumping)&&(backward))||((done)&&(backward))) {
    image(MLJ, xP, yP);
  } else if ((jumping)||(done)) {
    image(MRJ, xP, yP);
  } else {
    image(MR1, xP, yP);
  }

  if (attackTime >= 20) {
    attackTime = 0;
    attacking = false;
  } else if (attackTime >= 10) {
    attackTime+=1;
    attacking = false;
  }

  // enemy code

  for (int i = 0; i < enemyArray.size()-1; i++) {
    enemy drake = enemyArray.get(i);

    drake.update();
    if ((attacking)&&(((drake.xVal+40 > xP-60)&&(drake.xVal+40 < xP-40))||((drake.xVal > xP-60)&&(drake.xVal < xP-40)))&&(backward)) {
      drake.takeDamage();
      drake.knockB = true;
    } else if ((attacking)&&(((drake.xVal < xP+60)&&(drake.xVal > xP+40))||((drake.xVal+40 < xP+60)&&(drake.xVal+40 > xP+40)))) {
      drake.takeDamage();
      drake.knockF = true;
    }
    if (drake.health <= 0) {
      enemyArray.remove(i);
      killCount++;
    }

    if ((drake.knockB==true)&&(drake.startX <= 5)) {
      drake.xVal -= 20;
      drake.startX+=1;
      if (drake.startX==5) {
        drake.knockB = false;
        drake.startX = 0;
      }
    } else if ((drake.knockF==true)&&(drake.startX <= 5)) {
      drake.xVal += 20;
      drake.startX+=1;
      if (drake.startX==5) {
        drake.knockF = false;
        drake.startX = 0;
      }
    }
    attacking = false;
    if ((drake.xVal > xP)&&(drake.xVal< xP+40)&&(jumping == false)&&(done == false)&&(yP == 265)) {
      if (damage == false) {
        cHealth-=5;
        damage = true;
      }
    } else if ((drake.xVal+40>xP)&&(drake.xVal+40<xP+40)&&(jumping == false)&&(done == false)&&(yP == 265)) {
      if (damage == false) {
        cHealth-=5;
        damage = true;
      }
    }
    if (inv<=120) {
      inv++;
      if (inv == 120) {
        damage = false;
        inv = 0;
      }
    }
  }

  if (fieldCooldown > 0) {
    fieldCooldown--;
  }
  
  if (field == true) {
    fieldKnock = true;
    field = false;
  }
  
  if ((fieldKnock == true)&&(knockCount <= 10)) {
    knockCount ++;
    if (knockCount == 10) {
      knockCount = 0;
      fieldKnock = false;
    }
    
    for (int i = 0; i < enemyArray.size()-1; i++) {
      enemy drake = enemyArray.get(i);
      if (drake.xVal >= xP) {
        drake.knockFF = true;
      } else if (drake.xVal < xP) {
        drake.knockBF = true;
      }
      
      if (drake.knockBF == true) {
        drake.xVal-=20;
        drake.knockBF = false;
      } else if (drake.knockFF == true) {
        drake.xVal+=20;
        drake.knockFF = false;
      }
      
      if (knockCount == 10) {
        drake.knockBF = false;
        drake.knockFF = false;
      }
    }
  }

  /*if ((kb)&&(knockCount <= 5)&&(xP == 150)) {
   xB += 20;
   drake.xVal += 20;
   knockCount ++;
   if (knockCount == 5) {
   kb = false;
   damage = false;
   knockCount = 0;
   }
   } else if ((kb)&&(knockCount <= 5)&&((xP < 150)||(xP > 150))) {
   xP -= 20;
   knockCount ++;
   if (knockCount == 5) {
   kb = false;
   damage = false;
   knockCount = 0;
   }
   } else if ((kf)&&(knockCount <= 5)&&(xP == 150)) {
   xB -= 20;
   drake.xVal -= 20;
   knockCount ++;
   if (knockCount == 5) {
   kf = false;
   damage = false;
   knockCount = 0;
   }
   } else if ((kf)&&(knockCount <= 5)&&((xP < 150)||(xP > 150))) {
   xP += 20;
   knockCount ++;
   if (knockCount == 5) {
   kf = false;
   damage = false;
   knockCount = 0;
   }
   }*/

  fill(0);
  rect(platX, platY, 100, 5);
  textSize(28);
  fill(0);
  rect(60, 20, 200, 20);
  fill(139, 0, 0);
  text("HP", 20, 40);
  rect(60, 20, cHealth*2, 20);
  fill(80, 80, 250);
  text("Kills: "+str(killCount), 690, 40);

  if (fieldCooldown == 0) {
    fill(255);
    text("Field ready", 640, 450);
  } else {
    fill(255);
    text("Preparing...", 640, 450);
  }

  if (killCount >= 30) {
    spawnR = 3;
  }

  if (killCount >= 20 && killCount<30) {
    spawnR = 5;
  } 
  if (killCount >= 10 && killCount<20) {
    spawnR = 7;
  }

  if (cHealth <= 0) {
    fill(128, 0, 0);
    rect(0, 0, 800, 500);
    image(over, -20, -20);
    noLoop();
  }
}


void time() {
  if (enemyTime == spawnR) {
    enemyArray.add(new enemy(2600+xB, 265));
    enemyTime = 0;
  }


  if (msec == 60) {
    sec ++;
    enemyTime ++;
    msec = 0;
  }


  msec ++;
}


void keyPressed() {
  if (key ==  'd') {
    forward = true;
  } else if (key ==  'a') {
    backward = true;
  } else if ((key == ' ')&&(fieldCooldown <= 0)) {
    field = true;
    fieldCooldown = 600;
  }
  press = key;
}



void keyReleased() {
  if (key == 'd') {
    forward = false;
  } else if (key ==  'a') {
    backward = false;
  } else if (key == ' ') {
    field = false;
  }
}


class enemy {
  int xVal;
  int yVal;
  int frameR = 1;
  int frameL = 1;
  int health = 3;
  int startX = 0;
  boolean knockB = false;
  boolean knockF = false;
  boolean knockBF = false;
  boolean knockFF = false;

  enemy(int x, int y)
  {
    xVal = x;
    yVal = y;

    // setup


    //image();
  }

  void update() {

    if ((xP == 150)&&((forward)||(backward))) {
      if ((forward)&&(xVal<xP)&&(xVal>xB)) {
        xVal-=2.5;
      } else if ((forward)&&(xVal>xP)) {
        xVal-=7.5;
      } else if ((backward)&&(xVal>xP)&&(xVal<4000-xB)) {
        xVal+=2.5;
      } else if ((backward)&&(xVal<xP)) {
        xVal+=7.5;
      } else if ((forward)&&(xVal==xP)&&(xVal>xB)) {
        xVal-=2.5;
      } else if ((backward)&&(xVal==xP)&&(xVal<4000-xB)) {
        xVal+=2.5;
      }
    } else if (xP<800) {
      if (xVal<xP) {
        xVal += 2.5;
      } else if (xVal>xP) {
        xVal -= 2.5;
      }
    }

    animate();
  }


  void animate() {
    if (xVal<xP) {
      if ((frameR==1)||(frameR==2)) {
        image(MONR1, xVal, yVal);
        frameR += 1;
      } else if ((frameR==3)||(frameR==4)) {
        image(MONR2, xVal, yVal);
        frameR += 1;
      } else if ((frameR==5)||(frameR==6)) {
        image(MONR3, xVal, yVal);
        frameR += 1;
      } else if ((frameR==7)||(frameR==8)) {
        image(MONR4, xVal, yVal);
        frameR += 1;
      } else if ((frameR==9)||(frameR==10)) {
        image(MONR5, xVal, yVal);
        frameR += 1;
      } else if ((frameR==11)||(frameR==12)) {
        image(MONR6, xVal, yVal);
        frameR += 1;
      } else if ((frameR==13)||(frameR==14)) {
        image(MONR7, xVal, yVal);
        frameR += 1;
      } else if (frameR==15) {
        image(MONR8, xVal, yVal);
        frameR += 1;
      } else if (frameR==16) {
        image(MONR8, xVal, yVal);
        frameR = 1;
      }
    } else if (xVal>xP) {
      if ((frameL==1)||(frameL==2)) {
        image(MONL1, xVal, yVal);
        frameL += 1;
      } else if ((frameL==3)||(frameL==4)) {
        image(MONL2, xVal, yVal);
        frameL += 1;
      } else if ((frameL==5)||(frameL==6)) {
        image(MONL3, xVal, yVal);
        frameL += 1;
      } else if ((frameL==7)||(frameL==8)) {
        image(MONL4, xVal, yVal);
        frameL += 1;
      } else if ((frameL==9)||(frameL==10)) {
        image(MONL5, xVal, yVal);
        frameL += 1;
      } else if ((frameL==11)||(frameL==12)) {
        image(MONL6, xVal, yVal);
        frameL += 1;
      } else if ((frameL==13)||(frameL==14)) {
        image(MONL7, xVal, yVal);
        frameL += 1;
      } else if (frameL==15) {
        image(MONL8, xVal, yVal);
        frameL += 1;
      } else if (frameL == 16) {
        image(MONL8, xVal, yVal);
        frameL = 1;
      }
    } else {
      image(MONR1, xVal, yVal);
    }
  }

  void takeDamage() {
    health -= 1;
  }
}
