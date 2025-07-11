// to ask:
// how to do transparency in processing
// create a water gif block ( 3 frames at most guys



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
PImage map, map2;
PImage diamond;
PImage dirtTop, dirtSide, dirtBottom;
PImage bambooTop, bambooSide, bambooLeaf;
PImage brick, crack, face, ground, bush, fence;

// game objects
ArrayList<GameObject> objects;
ArrayList<block> blocks;

// cavnasses
PGraphics world;
PGraphics HUD; // heads up display
block bam; // was testing it out ---------------------------
boolean drawing2;
PShape sakura, bambour;
int timer;
boolean bamDrawn;

void setup() {
  // create canvases
  drawing2 = false;
  world = createGraphics(width, height, P3D);
  world = createGraphics(width, height, P3D);

  bamDrawn = false;

  fullScreen(P2D);
  objects = new ArrayList<GameObject>();
  blocks = new ArrayList<block>();
  //size(800, 600, P3D);
  //size(displayWidth, displayHeight, P3D);
  world.textureMode(NORMAL);
  wkey = akey = skey = dkey = false;

  sakura = loadShape("Prop_Tree.obj");
  bambour = loadShape("boo/bamboo.obj");

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
  bush = loadImage("bush.png");
  fence = loadImage("fence.png");

  bambooTop = loadImage("bambootop.png");
  bambooSide = loadImage("bamboo.png");
  bambooLeaf = loadImage("bambooLeaf.png");

  //// player view
  //eyeX = -100;
  //eyeY = height-150;
  //eyeZ = -2000;

  // up view
  eyeX = 0;
  eyeY = -height+150;
  eyeZ = 0;

  focusX = -100;
  focusY =  900;
  focusZ = -1700;
  tiltX = 0;
  tiltY = 1;
  tiltZ = 0;

  // initialize map -------------
  map = loadImage("3Dmap.png");
  map2 = loadImage("3Dmap2.png");
  gridSize = 100;

  try {
    rbt = new Robot();
  }
  catch (Exception e) {
    e.printStackTrace();
  }
  skipFrame = false;

  //world.hint(ENABLE_DEPTH_SORT);
  //world.hint(ENABLE_DEPTH_SORT);

  // map
  for (int x = 0; x < map.width; x++) {
    for (int y = 0; y < map.height; y++) {
      color c = map.get(x, y);
      if (c == #B5E61D ) {
        Cube(x*gridSize-2000, height-gridSize, y*gridSize-2000, face, gridSize);
        Cube(x*gridSize-2000, height-gridSize*2, y*gridSize-2000, brick, gridSize);
        Cube(x*gridSize-2000, height-gridSize*3, y*gridSize-2000, crack, gridSize);
        Cube(x*gridSize-2000, height-gridSize*4, y*gridSize-2000, brick, gridSize);
      }
      if (c == #ED1C24) {
        Cube(x*gridSize-2000, height-gridSize, y*gridSize-2000, bush, gridSize);
      }
      if ( c == #FFF200) {
        bamboo(x*gridSize-2000, height-gridSize*1, y*gridSize-2000, bambooTop, bambooTop, bambooSide, 10);
        bamboo(x*gridSize-2000, height-gridSize*2, y*gridSize-2000, bambooTop, bambooTop, bambooSide, 10);
        bamboo(x*gridSize-2000, height-gridSize*3, y*gridSize-2000, bambooTop, bambooTop, bambooSide, 10);
        bamboo(x*gridSize-2000, height-gridSize*4, y*gridSize-2000, bambooTop, bambooTop, bambooSide, 10);
        bamboo(x*gridSize-2000, height-gridSize*5, y*gridSize-2000, bambooTop, bambooTop, bambooSide, 10);
        bamboo(x*gridSize-2000, height-gridSize*6, y*gridSize-2000, bambooTop, bambooTop, bambooSide, 10);
      }
    }
  }

  // bambooo
  for (int x = 0; x < map.width; x++) { // the width and height of the map picture, not of the envirment
    for (int y = 0; y < map.height; y++) {
      color c = map.get(x, y);
      if (c == #22B14C) {
        //blocks.add(new block(0, 950, 0, 7));
        blocks.add(new block(x*gridSize-2000, height-gridSize, y*gridSize-2000, int(random(10))));
        bamDrawn = true;
      }
    }
  }
}

void draw() {
  //println(eyeX, eyeY, eyeZ);
  world.beginDraw();
  world.background(200);

  world.pointLight(255, 255, 255, eyeX, eyeY, eyeZ);
  world.camera(eyeX, eyeY, eyeZ, focusX, focusY, focusZ, tiltX, tiltY, tiltZ);
  drawFocusPoint();
  controlCamera();


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



  if (eyeY > height+ 100) {
    drawing2 = true;
    eyeY = -200;
  }


  if (!drawing2) {
    int a = 0;
    while (a < blocks.size()) {
      bamboo(500, 300, 0, bambooTop, bambooTop, bambooSide, 10);
      //texturedCube(0, 600, 0, dirtTop, dirtBottom, dirtSide, 200);
      drawFloor1(-2000, 2000, height, 100);

      drawMap();
      //world.pushMatrix();
      //world.translate(500, height/2, 0);
      //world.rotateX(radians(180));
      //world.shape(sakura);
      //world.translate(0, height/2, 200); // this ones tranparent?
      //world.shape(bambour);
      //world.popMatrix();

      model(500, height, -100, 3, sakura, radians(180), radians(90), 0);

      texturedCube(0, 800, 0, bambooLeaf, bambooLeaf, bambooLeaf, 200);
      block bams = blocks.get(a);
      bams.act();
      bams.show();
      //if (bams.lives == 0) {
      //  objects.remove(a);
      //} else {
      a++;
      //}
    }
  } else {
    background(200);
    drawFloor2(-2000, 2000, height, 100);
    bamboo(500, 300, 0, bambooTop, bambooTop, bambooSide, 10);
    drawMap2();
    timer ++;


    objects.add(new rain());
    // loop to make the object work
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

void drawBamboo() {
  if (!bamDrawn) {
    for (int x = 0; x < map.width; x++) { // the width and height of the map picture, not of the envirment
      for (int y = 0; y < map.height; y++) {
        color c = map.get(x, y);
        if (c == #22B14C) {
          //blocks.add(new block(0, 950, 0, 7));
          blocks.add(new block(x*gridSize-2000, height-gridSize, y*gridSize-2000, int(random(10))));
          bamDrawn = true;
        }
      }
    }
  }
}


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
  for (int x = 0; x < map.width; x++) {
    for (int y = 0; y < map.height; y++) {
      color c = map.get(x, y);
      if (c == #B5E61D ) {
        Cube(x*gridSize-2000, height-gridSize, y*gridSize-2000, face, gridSize);
        Cube(x*gridSize-2000, height-gridSize*2, y*gridSize-2000, brick, gridSize);
        Cube(x*gridSize-2000, height-gridSize*3, y*gridSize-2000, crack, gridSize);
        Cube(x*gridSize-2000, height-gridSize*4, y*gridSize-2000, brick, gridSize);
      }
      if (c == #ED1C24) {
        Cube(x*gridSize-2000, height-gridSize, y*gridSize-2000, bush, gridSize);
      }
      if ( c == #FFF200) {
        int o = 9;
        bamboo(x*gridSize-2000, height-gridSize*1, y*gridSize-2000, bambooTop, bambooTop, bambooSide, o);
        bamboo(x*gridSize-2000, height-gridSize*2, y*gridSize-2000, bambooTop, bambooTop, bambooSide, o);
        bamboo(x*gridSize-2000, height-gridSize*3, y*gridSize-2000, bambooTop, bambooTop, bambooSide, o);
        bamboo(x*gridSize-2000, height-gridSize*4, y*gridSize-2000, bambooTop, bambooTop, bambooSide, o);
        bamboo(x*gridSize-2000, height-gridSize*5, y*gridSize-2000, bambooTop, bambooTop, bambooSide, o);
        bamboo(x*gridSize-2000, height-gridSize*6, y*gridSize-2000, bambooTop, bambooTop, bambooSide, o);
      }
    }
  }
}


void drawMap2() {
  for (int x = 0; x < map2.width; x++) { // the width and height of the map picture, not of the envirment
    for (int y = 0; y < map2.height; y++) {
      color c = map2.get(x, y);
      if (c == #7092BE) {
        Cube(x*gridSize-2000, height-gridSize, y*gridSize-2000, face, gridSize);
        Cube(x*gridSize-2000, height-gridSize*2, y*gridSize-2000, brick, gridSize);
        Cube(x*gridSize-2000, height-gridSize*3, y*gridSize-2000, crack, gridSize);
      } else if (c == #B5E61D) {
        Cube(x*gridSize-2000, height-gridSize, y*gridSize-2000, face, gridSize);
      } else if (c == #77D621 ) {
        Cube(x*gridSize-2000, height-gridSize*2, y*gridSize-2000, brick, gridSize);
      } else if (c == #22B14C) {
        Cube(x*gridSize-2000, height-gridSize*3, y*gridSize-2000, crack, gridSize);
      }

      // collisions need to be fixed and stchuff
      /*
      colors to remeber height:
       
       lowest =  #8FED14
       medium = #77D621;
       highest = #22B14C;
       boder color = #7092BE;
       
       water: #90FFF5
       
       */
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
