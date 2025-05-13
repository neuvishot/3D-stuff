float rotx, roty;
PImage diamond;
PImage dirtTop, dirtSide, dirtBottom;

void setup() {
  size(800, 800, P3D);
  textureMode(NORMAL);
  diamond = loadImage("Diamond.png");
  dirtTop = loadImage("Grass_Block_Top_C.png");
  dirtSide = loadImage("Grass_Block_Side.png");
  dirtBottom = loadImage("Dirt_(texture)_JE2_BE2.png");
}

void draw() {
  background(0);

  pushMatrix();
  translate(width/2, height/2, 0);
  scale(200);
  rotateX(rotx);
  rotateY(roty);

  noStroke();

  beginShape(QUADS);
  texture(dirtTop);
  // top
  // x, y, z, tx, ty (texture x and texture y)
  vertex(0, 0, 0, 0, 0);
  vertex(1, 0, 0, 1, 0);
  vertex(1, 0, 1, 1, 1);
  vertex(0, 0, 1, 0, 1);

  // bottom
  texture(dirtBottom);
  vertex(0, 1, 0, 0, 0);
  vertex(1, 1, 0, 1, 0);
  vertex(1, 1, 1, 1, 1);
  vertex(0, 1, 1, 0, 1);

  // left
  vertex(0, 0, 0, 0, 0); // keep
  vertex(0, 0, 1, 1, 0); // keep
  vertex(0, 1, 1, 1, 1);
  vertex(0, 1, 0, 0, 1);

  // right
  texture(dirtSide);
  vertex(1, 0, 0, 0, 0); // keep
  vertex(1, 0, 1, 1, 0); // keep
  vertex(1, 1, 1, 1, 1);
  vertex(1, 1, 0, 0, 1);

  // front
  vertex(0, 0, 1, 0, 0); // keep
  vertex(1, 0, 1, 1, 0);
  vertex(1, 1, 1, 1, 1);
  vertex(0, 1, 1, 0, 1);

  // back
  vertex(0, 0, 0, 0, 0); // keep
  vertex(1, 0, 0, 1, 0);
  vertex(1, 1, 0, 1, 1);
  vertex(0, 1, 0, 0, 1);
  endShape();
  popMatrix();
}

void mouseDragged() {
  rotx = rotx + (pmouseY - mouseY) * 0.1;
  roty = roty + (pmouseX - mouseX) * -0.1;
}
