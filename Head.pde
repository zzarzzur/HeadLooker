class Head 
{
  PImage[] frames;

  int x, y, w, h; // position and size
  float angle = 0.0; // angle of mouse in relation to object
  int segmentID = 0; // current segment id variable
  int numSegments = 8; // number of segments
  boolean mOver = false; // mouse over boolean
  boolean mPressed = false; // mouse pressed boolean

  String id = "";

  // object constructor
  Head(String _id) {
    id = _id;
    frames = new PImage[10];
    for (int i = 0; i < 10; i++) {
      frames[i] = loadImage(id + "/" + i + ".jpg");
    }
  }

  // update internal variables
  void update(int mx, int my) {

    // set angle to mouse position offset from the x,y position
    angle = atan2(my-y, mx-x);

    // calculate the segment id based on the angle of the mouse position
    //int offset = 45;
    //int seg = int(floor(map(offset + 180 + degrees(angle), 0, 361, 0, numSegments)));

    float angleD = 180 + degrees(angle);

    // quadrant 
    if ( angleD > 337.5 || angleD < 22.5 ) {
      println("q0");
    }
    else if ( angleD > 22.5 && angleD < 67.5 ) {
      println("q1");
    }
    else if ( angleD > 67.5 && angleD < 112.5 ) {
      println("q2");
    }
    // etc



    //println("angle:   " + (180 + degrees(angle)));
    //println("segment id:   " + seg);


    segmentID = int(floor(map( 180 + degrees(angle), 0, 360, 0, numSegments)));




    // temporary bug fix
    if (segmentID == 0) segmentID = 1;

    // check to see if the mouse is inside the object
    if (mouseX >= x - w/2 && mouseX <= x + w/2 &&
      mouseY >= y - h/2 && mouseY <= y + h/2) {

      // set mouseOver to true
      mOver = true;

      // set mouse pressed variable to internal Processing mousePressed variable
      mPressed = mousePressed;
    }
    // else, set mouse pressed and mouse over to false
    else {
      mOver = false;
      mPressed = false;
    }
  }


  void display() {        

    // push new matrix
    pushMatrix();

    // translate to position
    translate(x, y);

    // draw rectangle    
    rect(-w/2, -h/2, w, h);

    //scale(0.3);

    // if mouse pressed    
    if (mPressed) {
      // draw image
      //image(frames[9], -w/2, -h/2);
    }
    else {
      // if mouse over, else
      //if (mOver)
      //image(frames[0], -w/2, -h/2);          
      //else
      //image(frames[segmentID], -w/2, -h/2);
    }


    // rotation display
    rotate(angle);
    line(0, 0, w, 0);

    // pop out matrix
    popMatrix();
  }
}

