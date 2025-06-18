class block {

  float x, y, z;
  float xsize, ysize, zsize;
  int tall;
  float a = 1.5;
  float blockY;

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
      blockY = y - i * 160;
      bamboo(x, blockY, z, bambooTop, bambooTop, bambooSide, 10);
    }
    world.textureMode(NORMAL);
    world.beginShape(QUADS);
    world.translate(x, blockY, z);
    world.texture(bambooLeaf);
    world.scale(200);
    world.vertex(-a, 16, -a, 0, 0);
    world.vertex(a, 16, -a, 1, 0);
    world.vertex(a, 16, a, 1, 1);
    world.vertex(-a, 16, a, 0, 1);
    world.endShape();

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
