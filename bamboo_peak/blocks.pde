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
    ysize = amount * 160;
    //xsize = ysize = 3/2 * 10;
  }


  void show() {
    world.pushMatrix();
    for (int i = 0; i < tall; i++) {
      blockY = y - i * 160;
      bamboo(x, blockY, z, bambooTop, bambooTop, bambooSide, 10);
    }


    //world.textureMode(NORMAL);
    //world.pushMatrix();
    //world.rotateX(radians(180));
    //world.translate(0, -ysize, 200);
    //world.shape(bambour);
    //world.popMatrix();

    texturedCube(0, -800, 0, bambooLeaf, bambooLeaf, bambooLeaf, 200);

    world.translate(x, -1*(y+ysize*tall), z);
    world.texture(bambooLeaf);
    world.scale(200);
    world.beginShape(QUADS);
    world.vertex(-a, 16, -a, 0, 0);
    world.vertex(a, 16, -a, 1, 0);
    world.vertex(a, 16, a, 1, 1);
    world.vertex(-a, 16, a, 0, 1);
    world.endShape();

    world.popMatrix();
  }

  void bamboos(float x, float y, float z) {
    world.translate(x, y, z);
    world.beginShape(QUADS);
    world.texture(bambooLeaf);
    world.vertex(0, 0, 0, 0, 0);
    world.vertex(1, 0, 0, 1, 0);
    world.vertex(1, 0, 1, 1, 1);
    world.vertex(0, 0, 1, 0, 1);
    world.endShape();
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
