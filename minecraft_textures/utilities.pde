/*

notes from video3:
so basically, use the map and choose different colors to draw the different cube texture.
also find a way to fix the insane lag, like whys it happening


*/

void texturedCube(float x, float y, float z, String top, String bottom, String side, float size) {
  textureMode(NORMAL);
  PImage Top, Side, Bottom;
  
  Top = loadImage(top);
  Side = loadImage(side);
  Bottom = loadImage(bottom);

  pushMatrix();
  translate(x, y, z);
  scale(size);
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

void Cube(float x, float y, float z, String top, float size) {
  textureMode(NORMAL);
  PImage Top;
  
  Top = loadImage(top);

  pushMatrix();
  translate(x, y, z);
  scale(size);
  noStroke();

  beginShape(QUADS);
  texture(Top);
  // top
  // x, y, z, tx, ty (texture x and texture y)
  vertex(0, 0, 0, 0, 0);
  vertex(1, 0, 0, 1, 0);
  vertex(1, 0, 1, 1, 1);
  vertex(0, 0, 1, 0, 1);
  // bottom


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
