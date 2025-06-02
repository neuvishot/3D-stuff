import java.awt.Robot;
Robot rbt;

boolean skipFrame;

boolean wkey, akey, skey, dkey, shiftkey, upkey, downkey, qkey;
float leftRightHeadAngle, topBottomAngle;

//camera variables
float eyeX, eyeY, eyeZ, focusX, focusY, focusZ, tiltX, tiltY, tiltZ;

// map sctuff
color black = #000000;
color white = #FFFFFF;

int gridSize;
PImage map;
PImage diamond;
PImage dirtTop, dirtSide, dirtBottom;

void setup() {
  fullScreen(P3D);

  //size(800, 600, P3D);
  //size(displayWidth, displayHeight, P3D);
  textureMode(NORMAL);
  wkey = akey = skey = dkey = false;

  // textures -----------
  diamond = loadImage("Diamond.png");
  dirtTop = loadImage("Grass_Block_Top_C.png");
  dirtSide = loadImage("Grass_Block_Side.png");
  dirtBottom = loadImage("Dirt_(texture)_JE2_BE2.png");

  eyeX = width/ 2;
  eyeY = height / 2;
  eyeZ = 0;
  focusX = width/2;
  focusY =  height/2;
  focusZ = 10;
  tiltX = 0;
  tiltY = 1;
  tiltZ = 0;

  // initialize map -------------
  map = loadImage("3Dmap.png");
  gridSize = 100;

  try {
    rbt = new Robot();
  }
  catch (Exception e) {
    e.printStackTrace();
  }
  skipFrame = false;
}

void draw() {
  background(255);
  
  pointLight(0, 255, 0, eyeX, eyeY, eyeZ);
  camera(eyeX, eyeY, eyeZ, focusX, focusY, focusZ, tiltX, tiltY, tiltZ);
  
 
  texturedCube(0, 600, 0, dirtTop, dirtBottom, dirtSide, 200);
  drawFloor(-2000, 2000, height, 100);
  drawFocusPoint();
  controlCamera();
  drawMap();
}

void drawMap() {
  for (int x = 0; x < map.width; x++) { // the width and height of the map picture, not of the envirment
    for (int y = 0; y < map.height; y++) {
      color c = map.get(x, y);
      if (c != white) {
        Cube(x*gridSize-2000, height-gridSize, y*gridSize-2000, diamond, gridSize);
        Cube(x*gridSize-2000, height-gridSize*2, y*gridSize-2000, diamond, gridSize);
        Cube(x*gridSize-2000, height-gridSize*3, y*gridSize-2000, diamond, gridSize);

        //pushMatrix();
        //fill(c);
        //stroke(100); // the height below is to make sure that it doesnt draw cewnter at 0,0
        //translate(x*gridSize - 2000, height/2, y*gridSize-2000); // -20000 to make sure that things dont start getting built at 0,0
        //box(gridSize, height, gridSize);
        //popMatrix();
      }
    }
  }
}



void drawFocusPoint() {
  pushMatrix();
  translate(focusX, focusY, focusZ);
  sphere(5);
  popMatrix();
}

void controlCamera() {
  if (wkey) {
    eyeX = eyeX + cos(leftRightHeadAngle)*10;
    eyeZ = eyeZ + sin(leftRightHeadAngle)*10;
  }
  if (skey) {
    eyeX = eyeX - cos(leftRightHeadAngle)*10;
    eyeZ = eyeZ - sin(leftRightHeadAngle)*10;
  }
  if (akey) {
    eyeX = eyeX - cos(leftRightHeadAngle + PI/2)*10;
    eyeZ = eyeZ - sin(leftRightHeadAngle + PI/2)*10;
  }
  if (dkey) {
    eyeX = eyeX - cos(leftRightHeadAngle - PI/2)*10;
    eyeZ = eyeZ - sin(leftRightHeadAngle - PI/2)*10;
  }
  if (skipFrame == false) {
    leftRightHeadAngle = leftRightHeadAngle + (mouseX - pmouseX)*0.01;
    topBottomAngle = topBottomAngle + (mouseY - pmouseY)*0.01;
  }

  //leftRightHeadAngle = leftRightHeadAngle + (mouseX - pmouseX)*0.01;
  //topBottomAngle = topBottomAngle + (mouseY - pmouseY)*0.01;

  focusX = eyeX + cos(leftRightHeadAngle)*300;
  focusZ = eyeZ + sin(leftRightHeadAngle)*300;
  focusY = eyeY + tan(topBottomAngle)*300;

  if (topBottomAngle > PI/2.5) topBottomAngle = PI/2.5;
  if (topBottomAngle < -PI/2.5) topBottomAngle = -PI/2.5;

  if (shiftkey || downkey) eyeY = eyeY + 3;
  if (upkey || qkey) eyeY = eyeY - 3;

  //if (mouseX > width-2) rbt.mouseMove(3, mouseY);
  //else if (mouseX < 2) rbt.mouseMove(width-3, mouseY);


  // 360 rotation smoothererer
  if (mouseX < 2) {
    rbt.mouseMove(width-3, mouseY);
    skipFrame = true;
  } else if (mouseX > width-2) {
    rbt. mouseMove(3, mouseY);
    skipFrame = true;
  } else {
    skipFrame = false;
  }

  //focusX = mouseX;
  //focusZ = mouseY;

  //focusX = eyeX;
  //focusY = eyeY;
  //focusZ = eyeZ - 10;
}

void mouseDragged() {
  eyeX = eyeX + (pmouseY - mouseY) * 0.1;
  eyeZ = eyeZ + (pmouseX - mouseX) * -0.1;
}

void drawFloor(int start, int end, int level, int gap) {
  stroke(255);
  strokeWeight(1);
  int x = start;
  int z = start;
  while ( z < end) {
    Cube(x, level, z, dirtSide, gap);
    x = x + gap;
    if (x >= end) {
      x = start;
      z = z + gap;
    }
  }

  // draw the lines ------------------------------------
  //for (int x = -2000; x <= 2000; x = x + 100) {
  //  line(x, height, -2000, x, height, 2000);
  //  line(-2000, height, x, 2000, height, x);
  //}
}

void keyPressed() {
  if (key == 'W' || key == 'w') wkey = true;
  if (key == 'A' || key == 'a') akey = true;
  if (key == 'D' || key == 'd') dkey = true;
  if (key == 'S' || key == 's') skey = true;
  if (key == 'Q' || key == 'q')   qkey = true;
  if (keyCode == SHIFT || keyCode == SHIFT) shiftkey = true;
  if (keyCode == UP || keyCode == UP) upkey = true;
  if (keyCode == DOWN || keyCode == DOWN) downkey = true;
}
void keyReleased() {
  if (key == 'W' || key == 'w') wkey = false;
  if (key == 'A' || key == 'a') akey = false;
  if (key == 'D' || key == 'd') dkey = false;
  if (key == 'S' || key == 's') skey = false;
  if (key == 'Q' || key == 'q') qkey = false;
  if (keyCode == SHIFT || keyCode == SHIFT) shiftkey = false;
  if (keyCode == UP || keyCode == UP) upkey = false;
  if (keyCode == DOWN || keyCode == DOWN) downkey = false;
}
