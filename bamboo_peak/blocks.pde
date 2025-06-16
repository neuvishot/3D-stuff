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
    xsize = ysize = 3/2 * 10;
  }


  void show() {
    world.pushMatrix();
    for (int i = 0; i < tall; i++) {
      float blockY = y - i * 160;
      bamboo(x, blockY, z, bambooTop, bambooTop, bambooSide, 10);
    }
    world.popMatrix();
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
}
