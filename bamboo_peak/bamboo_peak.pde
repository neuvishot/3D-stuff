import java.awt.Robot;
import java.util.ArrayList;
Robot rbt;

// happyness hihIIIIII
PImage doumaur;

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
PImage bambooTop, bambooSide;
PImage brick, crack, face, ground;

// game objects
ArrayList<GameObject> objects;

// cavnasses
PGraphics world;
PGraphics HUD; // heads up display
block bam;
boolean drawing2;
PShape sakura;

void setup() {
  // create canvases
  drawing2 = false;
  world = createGraphics(width, height, P3D);
  world = createGraphics(width, height, P3D);

  fullScreen(P2D);
  objects = new ArrayList<GameObject>();
  //size(800, 600, P3D);
  //size(displayWidth, displayHeight, P3D);
  world.textureMode(NORMAL);
  wkey = akey = skey = dkey = false;

  sakura = loadShape("Prop_Tree.obj");

  // textures -----------
  diamond = loadImage("Diamond.png");
  dirtTop = loadImage("Grass_Block_Top_C.png");
  dirtSide = loadImage("Grass_Block_Side.png");
  dirtBottom = loadImage("Dirt_(texture)_JE2_BE2.png");
  doumaur = loadImage("doumaour.png");
  brick = loadImage("brick.png");
  crack = loadImage("cracked.png");
  face = loadImage("face.png");
  ground = loadImage("sground.png");

  bambooTop = loadImage("bambootop.png");
  bambooSide = loadImage("bamboo.png");
  bam = new block(0, 950, 0, 5);

  // player view
  eyeX = -100;
  eyeY = height-150;
  eyeZ = -2000;

  //// up view
  //eyeX = 0;
  //eyeY = -height-150;
  //eyeZ = 0;

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
  world.beginDraw();
  world.background(255);

  world.pointLight(255, 255, 255, eyeX, eyeY, eyeZ);
  world.camera(eyeX, eyeY, eyeZ, focusX, focusY, focusZ, tiltX, tiltY, tiltZ);
  drawFocusPoint();
  controlCamera();


  // loop to make the object work
  int i = 0;
  while (i < objects.size()) {
    GameObject obj = objects.get(i);
    obj.act();
    obj.show();
    if (obj.lives == 0) {
      objects.remove(i);
    } else {
      i++;
    }
  }

  if (eyeY > height+ 100) drawing2 = true;

  if (!drawing2) {
    texturedCube(0, 600, 0, dirtTop, dirtBottom, dirtSide, 200);
    bam.show();
    bamboo(500, 300, 0, bambooTop, bambooTop, bambooSide, 10);
    texturedCube(0, 600, 0, dirtTop, dirtBottom, dirtSide, 200);
    drawFloor1(-2000, 2000, height, 100);

    drawMap();

    world.shape(sakura);
  } else {
    background(200);
    drawFloor2(-2000, 2000, height, 100);
    bamboo(500, 300, 0, bambooTop, bambooTop, bambooSide, 10);
  }


  // -------------------------------------------------------
  world.endDraw();
  image(world, 0, 0);

  stroke(255);
  strokeWeight(5);
  line(width/2-20, height/2, width/2+20, height/2);
  line(width/2, height/2-20, width/2, height/2+20);
  //line(width/2, height/2, width, height/2);
  image(doumaur, 0, 0, 200, 200);
}

// change the map for the second world,, load a new image for this map

// blocks.add in the setup while loading the map in setup
// make a new array list for blocks, not in gameobject. make sure the blocks list can read from the png file
// the blocks class just do .show bcs the blocks just need to be able to hold information

/*
(while (i< blocks.size)
 block b = blocks.get(i)
 b.show();
 i++
 
 with this, loop thorough this when checking collisions
 */
void drawFloor2(int start, int end, int level, int gap) {
  world.stroke(255);
  world.strokeWeight(1);
  int x = start;
  int z = start;
  while ( z < end) {
    Cube(x, level, z, diamond, gap);
    x = x + gap;
    if (x >= end) {
      x = start;
      z = z + gap;
    }
  }
}

void drawFloor1(int start, int end, int level, int gap) {
  world.stroke(255);
  world.strokeWeight(1);
  int x = start;
  int z = start;
  while ( z < end) {
    Cube(x, level, z, ground, gap);
    x = x + gap;
    if (x >= end) {
      x = start;
      z = z + gap;
    }
  }
}

void drawMap() {
  for (int x = 0; x < map.width; x++) { // the width and height of the map picture, not of the envirment
    for (int y = 0; y < map.height; y++) {
      color c = map.get(x, y);
      if (c != white) {
        Cube(x*gridSize-2000, height-gridSize, y*gridSize-2000, face, gridSize);
        Cube(x*gridSize-2000, height-gridSize*2, y*gridSize-2000, brick, gridSize);
        Cube(x*gridSize-2000, height-gridSize*3, y*gridSize-2000, crack, gridSize);

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
  world.pushMatrix();
  world.translate(focusX, focusY, focusZ);
  world.sphere(5);
  world.popMatrix();
}



void mouseDragged() {
  eyeX = eyeX + (pmouseY - mouseY) * 0.1;
  eyeZ = eyeZ + (pmouseX - mouseX) * -0.1;
}

void drawFloor(int start, int end, int level, int gap) {
  world.stroke(255);
  world.strokeWeight(1);
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
