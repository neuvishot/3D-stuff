class block {

  float x, y, z;
  float xsize, ysize, zsize;
  int tall;

  block() { //dirtblock floor
  }

  block(float xx, float yy, float zz, int amount) { // bamboo
    x = xx;
    y = yy;
    z = zz;
    tall = amount;
    xsize = ysize = 3 * 10;
  }


  void show() {
    pushMatrix();
    for (int i = 0; i < tall; i++) {
      float blockY = y - i * 160;
      bamboo(x, blockY, z, bambooTop, bambooTop, bambooSide, 10);
    }
    popMatrix();
  }

  void act() {
    ysize = y * tall;
  }



  float getWidth() {
    return ysize;
  }

  float getDepth() {
    return zsize;
  }


  //void drawFloor(int start, int end, int level, int gap) {
  //  stroke(255);
  //  strokeWeight(1);
  //  int x = start;
  //  int z = start;
  //  while ( z < end) {
  //    Cube(x, level, z, dirtSide, gap);
  //    x = x + gap;
  //    if (x >= end) {
  //      x = start;
  //      z = z + gap;
  //    }
  //  }
  //}
}
