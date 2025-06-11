/*

 notes from video3:
 so basically, use the map and choose different colors to draw the different cube texture.
 also find a way to fix the insane lag, like whys it happening
 
 
 */

void bamboo(float x, float y, float z, PImage Top, PImage Bottom, PImage Side, float size) {
  textureMode(NORMAL);

  float a = 1.5;

  pushMatrix();
  translate(x, y, z);
  scale(size);
  noStroke();

  beginShape(QUADS);
  texture(Top);
  // top
  // x, y, z, tx, ty (texture x and texture y)
  vertex(-a, 16, -a, 0, 0);
  vertex(a, 16, -a, 1, 0);
  vertex(a, 16, a, 1, 1);
  vertex(-a, 16, a, 0, 1);
  endShape();

  // bottom
  beginShape();
  texture(Bottom);
  vertex(-a, 0, -a, 0, 0);
  vertex(a, 0, -a, 1, 0);
  vertex(a, 0, a, 1, 1);
  vertex(-a, 0, a, 0, 1);
  endShape();

  beginShape();
  texture(Side); // 1
  // left
  vertex(-a, 16, a, 0, 0); // keep
  vertex(a, 16, a, 1, 0); // keep
  vertex(a, 0, a, 1, 1);
  vertex(-a, 0, a, 0, 1);
  endShape();

  // right
  beginShape(); // 2
  texture(Side);
  vertex(a, 16, a, 0, 0); // keep
  vertex(a, 16, -a, 1, 0); // keep
  vertex(a, 0, -a, 1, 1);
  vertex(a, 0, a, 0, 1);
  endShape();

  // front
  beginShape(); // 3
  texture(Side);
  vertex(-a, 16, -a, 0, 0);
  vertex(a, 16, -a, 1, 0);
  vertex(a, 0, -a, 1, 1);
  vertex(-a, 0, -a, 0, 1);
  endShape();

  // back
  beginShape();
  texture(Side);
  vertex(-a, 16, -a, 0, 0);// keep
  vertex(-a, 16, a, 1, 0);
  vertex(-a, 0, a, 1, 1);
  vertex(-a, 0, -a, 0, 0);
  endShape();
  popMatrix();
}

void texturedCube(float x, float y, float z, PImage Top, PImage Bottom, PImage Side, float size) {
  textureMode(NORMAL);

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

void Cube(float x, float y, float z, PImage top, float size) {
  textureMode(NORMAL);


  pushMatrix();
  translate(x, y, z);
  scale(size);
  noStroke();

  beginShape(QUADS);
  texture(top);
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
