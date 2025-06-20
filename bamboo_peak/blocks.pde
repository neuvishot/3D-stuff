class block {

  float x, y, z;
  float xsizeStart, xsizeStop, ysize, zsizeStart, zsizeStop;
  int tall;
  float a = 1.5;
  float blockYb, blockyl;
  float [] bamrot;

  block() { //dirtblock floor
  }

  block(float xx, float yy, float zz, int amount) { // bamboo
    x = xx;
    y = yy;
    z = zz;
    tall = amount;
    ysize = amount * -160;
    bamrot = new float[tall];
    for (int i = 0; i < tall; i++) {
      bamrot[i] = radians(random(360)); // Unique rotation per leaf
    }

    //xsize = ysize = 3/2 * 10;
  }


  void show() {
    world.pushMatrix();
    for (int i = 0; i < tall; i++) {
      blockYb = y - i * 160;
      bamboo(x, blockYb, z, bambooTop, bambooTop, bambooSide, 10);
    }
    for (int i = tall-1; i >= 0; i--) { // leaves
      blockyl = y - i * 160;
      if (i >= 3) {
        bamboos(x, blockyl, z, bamrot[i]);
        bamboos(x, blockyl, z, bamrot[i] + HALF_PI);
      }
      if ( i == tall-1){
        bamboos(x, blockyl, z, bamrot[i]);
        bamboos(x, blockyl, z, bamrot[i] + 2*QUARTER_PI);
        bamboos(x, blockyl, z, bamrot[i] + 4*QUARTER_PI);
        bamboos(x, blockyl, z, bamrot[i] + 6*QUARTER_PI);
      }
    }

    //world.textureMode(NORMAL);
    //world.pushMatrix();
    //world.rotateX(radians(180));
    //world.translate(0, -ysize, 200);
    //world.shape(bambour);
    //world.popMatrix();

    texturedCube(0, -800, 0, bambooLeaf, bambooLeaf, bambooLeaf, 200);
    //bamboos(x, blockY, z);

    //world.translate(x, -1*(y+ysize*tall), z);
    //world.texture(bambooLeaf);
    //world.scale(200);
    //world.beginShape(QUADS);
    //world.vertex(-a, 16, -a, 0, 0);
    //world.vertex(a, 16, -a, 1, 0);
    //world.vertex(a, 16, a, 1, 1);
    //world.vertex(-a, 16, a, 0, 1);
    //world.endShape();

    world.popMatrix();
  }

  void bamboos(float x, float y, float z, float r) {
    world.pushMatrix();
    world.textureMode(NORMAL);
    world.translate(x, y, z);
    world.scale(300);
    //world.rotateY(bamrot);
    world.rotateY(r);
    world.beginShape(QUADS);
    world.texture(bambooLeaf);
    world.vertex(0, 0, 0, 0, 0);
    world.vertex(1, 0, 0, 1, 0);
    world.vertex(1, 0, 1, 1, 1);
    world.vertex(0, 0, 1, 0, 1);
    world.endShape();
    world.popMatrix();
  }

  void act() {
    ysize = y * tall;
    xsizeStart = x - (1.5*10);
    xsizeStop = x + (1.5*10);

    zsizeStart = z - (1.5*10);
    zsizeStop = z + (1.5*10);
  }



  //float getWidth() {

  //  return ysize;
  //}

  //float getDepth() {
  //  return zsize;
  //}
}
