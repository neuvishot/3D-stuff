/*

notes from video3:
so basically, use the map and choose different colors to draw the different cube texture.
also find a way to fix the insane lag, like whys it happening


*/

void model(){
   


}

void bamboo(float x, float y, float z, PImage Top, PImage Bottom, PImage Side, float size) {
  world.textureMode(NORMAL);

  float a = 1.5;

  world.pushMatrix();
  world.translate(x, y, z);
  world.scale(size);
  world.noStroke();

  world.beginShape(QUADS);
  world.texture(Top);
  // top
  // x, y, z, tx, ty (texture x and texture y)
  world.vertex(-a, 16, -a, 0, 0);
  world.vertex(a, 16, -a, 1, 0);
  world.vertex(a, 16, a, 1, 1);
  world.vertex(-a, 16, a, 0, 1);
  world.endShape();

  // bottom
  world.beginShape();
  world.texture(Bottom);
  world.vertex(-a, 0, -a, 0, 0);
  world.vertex(a, 0, -a, 1, 0);
  world.vertex(a, 0, a, 1, 1);
  world.vertex(-a, 0, a, 0, 1);
  world.endShape();

  world.beginShape();
  world.texture(Side); // 1
  // left
  world.vertex(-a, 16, a, 0, 0); // keep
  world.vertex(a, 16, a, 1, 0); // keep
  world.vertex(a, 0, a, 1, 1);
  world.vertex(-a, 0, a, 0, 1);
  world.endShape();

  // right
  world.beginShape(); // 2
  world.texture(Side);
  world.vertex(a, 16, a, 0, 0); // keep
  world.vertex(a, 16, -a, 1, 0); // keep
  world.vertex(a, 0, -a, 1, 1);
  world.vertex(a, 0, a, 0, 1);
  world.endShape();

  // front
  world.beginShape(); // 3
  world.texture(Side);
  world.vertex(-a, 16, -a, 0, 0);
  world.vertex(a, 16, -a, 1, 0);
  world.vertex(a, 0, -a, 1, 1);
  world.vertex(-a, 0, -a, 0, 1);
  world.endShape();

  // back
  world.beginShape();
  world.texture(Side);
  world.vertex(-a, 16, -a, 0, 0);// keep
  world.vertex(-a, 16, a, 1, 0);
  world.vertex(-a, 0, a, 1, 1);
  world.vertex(-a, 0, -a, 0, 1);
  world.endShape();
  world.popMatrix();
}
void texturedCube(float x, float y, float z, PImage Top, PImage Bottom, PImage Side, float size) {
  world.textureMode(NORMAL);
  world.pushMatrix();
  world.translate(x, y, z);
  world.scale(size);
  world.noStroke();

  world.beginShape(QUADS);
  world.texture(Top);
  // top
  // x, y, z, tx, ty (texture x and texture y)
  world.vertex(0, 0, 0, 0, 0);
  world.vertex(1, 0, 0, 1, 0);
  world.vertex(1, 0, 1, 1, 1);
  world.vertex(0, 0, 1, 0, 1);
  world.endShape();
  // bottom
  world.beginShape();
  world.texture(Bottom);
  world.vertex(0, 1, 0, 0, 0);
  world.vertex(1, 1, 0, 1, 0);
  world.vertex(1, 1, 1, 1, 1);
  world.vertex(0, 1, 1, 0, 1);
  world.endShape();

  world.beginShape();
  world.texture(Side);
  // left
  world.vertex(0, 0, 0, 0, 0); // keep
  world.vertex(0, 0, 1, 1, 0); // keep
  world.vertex(0, 1, 1, 1, 1);
  world.vertex(0, 1, 0, 0, 1);
  world.endShape();

  // right
  world.beginShape();
  world.texture(Side);
  world.vertex(1, 0, 0, 0, 0); // keep
  world.vertex(1, 0, 1, 1, 0); // keep
  world.vertex(1, 1, 1, 1, 1);
  world.vertex(1, 1, 0, 0, 1);
  world.endShape();

  // front
  world.beginShape();
  world.texture(Side);
  world.vertex(0, 0, 1, 0, 0); // keep
  world.vertex(1, 0, 1, 1, 0);
  world.vertex(1, 1, 1, 1, 1);
  world.vertex(0, 1, 1, 0, 1);
  world.endShape();

  // back
  world.beginShape();
  world.texture(Side);
  world.vertex(0, 0, 0, 0, 0); // keep
  world.vertex(1, 0, 0, 1, 0);
  world.vertex(1, 1, 0, 1, 1);
  world.vertex(0, 1, 0, 0, 1);
  world.endShape();
  world.popMatrix();
}

void Cube(float x, float y, float z, PImage top, float size) {
  world.textureMode(NORMAL);
  world.pushMatrix();
  world.translate(x, y, z);
  world.scale(size);
  world.noStroke();

  world.beginShape(QUADS);
  world.texture(top);
  // top
  // x, y, z, tx, ty (texture x and texture y)
  world.vertex(0, 0, 0, 0, 0);
  world.vertex(1, 0, 0, 1, 0);
  world.vertex(1, 0, 1, 1, 1);
  world.vertex(0, 0, 1, 0, 1);
  // bottom


  world.vertex(0, 1, 0, 0, 0);
  world.vertex(1, 1, 0, 1, 0);
  world.vertex(1, 1, 1, 1, 1);
  world.vertex(0, 1, 1, 0, 1);

  // left
  world.vertex(0, 0, 0, 0, 0); // keep
  world.vertex(0, 0, 1, 1, 0); // keep
  world.vertex(0, 1, 1, 1, 1);
  world.vertex(0, 1, 0, 0, 1);

  // right

  world.vertex(1, 0, 0, 0, 0); // keep
  world.vertex(1, 0, 1, 1, 0); // keep
  world.vertex(1, 1, 1, 1, 1);
  world.vertex(1, 1, 0, 0, 1);

  // front

  world.vertex(0, 0, 1, 0, 0); // keep
  world.vertex(1, 0, 1, 1, 0);
  world.vertex(1, 1, 1, 1, 1);
  world.vertex(0, 1, 1, 0, 1);

  // back
  world.vertex(0, 0, 0, 0, 0); // keep
  world.vertex(1, 0, 0, 1, 0);
  world.vertex(1, 1, 0, 1, 1);
  world.vertex(0, 1, 0, 0, 1);
  world.endShape();
  world.popMatrix();
}
