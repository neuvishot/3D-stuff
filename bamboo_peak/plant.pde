class plants extends GameObject {

  float bamrot;
  float x, y, z;

  plants(float xx, float yy, float zz) {
    super();
    bamrot = radians(random(360));
    x = xx;
    y = yy;
    z = zz;
  }

  void show() {
    world.pushMatrix();
    world.textureMode(NORMAL);
    world.translate(x, y, z);
    world.scale(300);
    world.rotateY(bamrot);
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
  }
}
