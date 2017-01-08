// Simple program to add and remove circles bouncing up and down the screen.
// phil.jones.24.4@gmail.com 08/01/2017



//Define Array circles from Circle Class
ArrayList<Circle> circles = new ArrayList<Circle>();
//Initial Amount
int circleAmount = 20;
//Max Amount
int maxCircles = 4000;
PFont f;


void setup () {
  size (300, 300);
  f = createFont("Arial", 16, true);
  //Call the addCircles function to start with a set amount
  addCircles();
}

void draw () {
  //Redraw black background 
  background(0);
  //Debug
  //println (circles.size());
  //Display Instructions
  textFont(f, 12);                  
  fill(255);
  textAlign(CENTER);
  text("Left Mouse Click Remove: Right Mouse Click Add", width/2, 10);
  stroke(255);
  //Create boundry line
  line(0, 12, width, 12);
  
  // Draw and move the circles
  for (int i=0; i < circles.size(); i++) {
    circles.get(i).show();
    circles.get(i).move();
  }
  
  //Right Click add more

  if (mousePressed && mouseButton == RIGHT && circles.size() < maxCircles) {
    //println(mouseX + " : " + mouseY);
    addCircles();
  }
  
  //Left Click take away
  
  if (mousePressed && mouseButton == LEFT) {
    if (circles.size() > 0) {
      removeCircles();
    }
  }
}

// Create and populate circle object array
void addCircles() {
  for (int i=0; i < circleAmount; i++) {
    circles.add(new Circle());
  }
}

//Remove Circles objects from the array
void removeCircles() {
  // Remove 100 at a time when over 100 otherwise remove one at a time
  int removeAmount=100;
  if (circles.size() > 100) {
    for (int i = removeAmount; i >= 0; i --) {
      circles.remove(i);
    }
  } else {
    if (circles.size() > 0) {
      circles.remove(0);
    }
  }
}