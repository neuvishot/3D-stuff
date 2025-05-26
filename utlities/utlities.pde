float rotx, roty;
PImage diamond;
PImage dirtTop, dirtSide, dirtBottom;

void setup() {
  size(800, 800, P3D);
}

void draw() {
  background(0);
}

// textured cube ------------------------------------------------------------------------ different in all sides
void texturedCube(float x, float y, float z, String top, String bottom, String side, float size) {
  textureMode(NORMAL);
  PImage Top, Side, Bottom;
  
  Top = loadImage(top);
  Side = loadImage(side);
  Bottom = loadImage(bottom);

  pushMatrix();
  translate(x, y, z);
  scale(size);
  rotateX(rotx);
  rotateY(roty);

  noStroke();

  beginShape(QUADS);
  texture(Top);
  // top
  // x, y, z, tx, ty (texture x and texture y)
  vertex(0, 0, 0, 0, 0);
  vertex(1, 0, 0, 1, 0);
  vertex(1, 0, 1, 1, 1);
  vertex(0, 0, 1, 0, 1);
  endShape();
  // bottom
  beginShape();
  texture(Bottom);
  vertex(0, 1, 0, 0, 0);
  vertex(1, 1, 0, 1, 0);
  vertex(1, 1, 1, 1, 1);
  vertex(0, 1, 1, 0, 1);
  endShape();

  beginShape();
  texture(Side);
  // left
  vertex(0, 0, 0, 0, 0); // keep
  vertex(0, 0, 1, 1, 0); // keep
  vertex(0, 1, 1, 1, 1);
  vertex(0, 1, 0, 0, 1);
  endShape();

  // right
  beginShape();
  texture(Side);
  vertex(1, 0, 0, 0, 0); // keep
  vertex(1, 0, 1, 1, 0); // keep
  vertex(1, 1, 1, 1, 1);
  vertex(1, 1, 0, 0, 1);
  endShape();

  // front
  beginShape();
  texture(Side);
  vertex(0, 0, 1, 0, 0); // keep
  vertex(1, 0, 1, 1, 0);
  vertex(1, 1, 1, 1, 1);
  vertex(0, 1, 1, 0, 1);
  endShape();

  // back
  beginShape();
  texture(Side);
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
