import java.awt.Robot;
Robot rbt;

boolean skipFrame;

boolean wkey, akey, skey, dkey;
float leftRightHeadAngle, topBottomAngle;

//camera variables
float eyeX, eyeY, eyeZ, focusX, focusY, focusZ, tiltX, tiltY, tiltZ;

void setup() {
  fullScreen(P3D);
  //size(800, 600, P3D);
  //size(displayWidth, displayHeight, P3D);
  textureMode(NORMAL);
  wkey = akey = skey = dkey = false;

  eyeX = width/ 2;
  eyeY = height / 2;
  eyeZ = 0;
  focusX = width/2;
  focusY =  height/2;
  focusZ = 10;
  tiltX = 0;
  tiltY = 1;
  tiltZ = 0;

  try {
    rbt = new Robot();
  }
  catch (Exception e) {
    e.printStackTrace();
  }
  skipFrame = false;
}

void draw() {
  background(0);
  camera(eyeX, eyeY, eyeZ, focusX, focusY, focusZ, tiltX, tiltY, tiltZ);
  drawFloor();
  drawFocusPoint();
  controlCamera();
}

void drawFocusPoint() {
  pushMatrix();
  translate(focusX, focusY, focusZ);
  sphere(5);
  popMatrix();
}

void controlCamera() {
  if (wkey) {
    eyeX = eyeX + cos(leftRightHeadAngle)*10;
    eyeZ = eyeZ + sin(leftRightHeadAngle)*10;
  }
  if (skey) {
    eyeX = eyeX - cos(leftRightHeadAngle)*10;
    eyeZ = eyeZ - sin(leftRightHeadAngle)*10;
  }
  if (akey) {
    eyeX = eyeX - cos(leftRightHeadAngle + PI/2)*10;
    eyeZ = eyeZ - sin(leftRightHeadAngle + PI/2)*10;
  }
  if (dkey) {
    eyeX = eyeX - cos(leftRightHeadAngle - PI/2)*10;
    eyeZ = eyeZ - sin(leftRightHeadAngle - PI/2)*10;
  }
  if (skipFrame == false) {
    leftRightHeadAngle = leftRightHeadAngle + (mouseX - pmouseX)*0.01;
    topBottomAngle = topBottomAngle + (mouseY - pmouseY)*0.01;
  }

  //leftRightHeadAngle = leftRightHeadAngle + (mouseX - pmouseX)*0.01;
  //topBottomAngle = topBottomAngle + (mouseY - pmouseY)*0.01;

  focusX = eyeX + cos(leftRightHeadAngle)*300;
  focusZ = eyeZ + sin(leftRightHeadAngle)*300;
  focusY = eyeY + tan(topBottomAngle)*300;

  if (topBottomAngle > PI/2.5) topBottomAngle = PI/2.5;
  if (topBottomAngle < -PI/2.5) topBottomAngle = -PI/2.5;

  //if (mouseX > width-2) rbt.mouseMove(3, mouseY);
  //else if (mouseX < 2) rbt.mouseMove(width-3, mouseY);


// 360 rotation smoothererer
  if (mouseX < 2) {
    rbt.mouseMove(width-3, mouseY);
    skipFrame = true;
  } else if (mouseX > width-2) {
    rbt. mouseMove(3, mouseY);
    skipFrame = true;
  } else {
    skipFrame = false;
  }

  //focusX = mouseX;
  //focusZ = mouseY;

  //focusX = eyeX;
  //focusY = eyeY;
  //focusZ = eyeZ - 10;
}

void mouseDragged() {
  eyeX = eyeX + (pmouseY - mouseY) * 0.1;
  eyeZ = eyeZ + (pmouseX - mouseX) * -0.1;
}

void drawFloor() {
  stroke(255);
  for (int x = -2000; x <= 2000; x = x + 100) {
    line(x, height, -2000, x, height, 2000);
    line(-2000, height, x, 2000, height, x);
  }
}

void keyPressed() {
  if (key == 'W' || key == 'w') wkey = true;
  if (key == 'A' || key == 'a') akey = true;
  if (key == 'D' || key == 'd') dkey = true;
  if (key == 'S' || key == 's') skey = true;
}
void keyReleased() {
  if (key == 'W' || key == 'w') wkey = false;
  if (key == 'A' || key == 'a') akey = false;
  if (key == 'D' || key == 'd') dkey = false;
  if (key == 'S' || key == 's') skey = false;
}
