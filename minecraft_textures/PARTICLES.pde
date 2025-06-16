class rain extends GameObject {

  float rot;
  color col;
  
  rain() {
    super (random(-width, width), random(height), random(-2000, 2000), 10);
    lives = 1;
    rot = radians(random(-45,45));
    col = color(255, random(116, 209), random(223, 244));
  }

  void act() {
    loc.add(vel);
    if (loc.y >= 900) lives = 0;
  }

  void show() {
    pushMatrix();
    pushStyle();
    translate(loc.x, loc.y, loc.z);
    fill(255);
    noStroke();
    fill(col);
    rotate(rot);
    ellipse(size, size*3, size, size*2);
    popStyle();
    popMatrix();
  }
}
