PImage dog;
PImage meat;
Bullet[] bullets;
int bulletNum = 50;
int bulletPointer = 0;
Meat[] meats;
int meatNum = 5;
int score = 0;

void setup() {
  size(600, 600);
  dog = loadImage("dog.png");
  meat = loadImage("meat.png");
  bullets = new Bullet[bulletNum];
  meats = new Meat[meatNum];
  for (int i=0; i<bulletNum; i++) {
    bullets[i] = new Bullet();
  }
  for (int i=0; i<meatNum; i++) {
    meats[i] = new Meat();
    meats[i].meat(int(random(520)), int(random(3))+3);
  }
}

void draw() {
  background(0);
  image(dog, mouseX-40, mouseY, 80, 80);
  for (int i=0; i<bulletNum; i++) {
    bullets[i].show();
    bullets[i].shoot();
  }
  for (int i=0; i<meatNum; i++) {
    meats[i].drop();
    meats[i].show();
    if (meats[i].life == false) {
      meats[i].meat(int(random(520)), int(random(3))+3);
    }
  }
  //hit
  for (int i=0; i<bulletNum; i++) {
    for (int j=0; j<meatNum; j++) {
      if (bullets[i].life == true && meats[j].life == true) {
        if (meats[j].x < bullets[i].x && bullets[i].x < meats[j].x+80 && meats[j].y < bullets[i].y && bullets[i].y < meats[j].y+80) {
          meats[j].life = false;
          bullets[i].life = false;
          score += 5;
        }
      }
    }
  }
  textSize(20);
  text("SCORE:"+score, 10, 30);
}

void mousePressed() {
  if (mouseButton == LEFT) {
    bullets[bulletPointer].bullet(mouseX, mouseY);
    bulletPointer+=1;
    if (bulletPointer >= bulletNum) {
      bulletPointer = 0;
    }
  }
}
