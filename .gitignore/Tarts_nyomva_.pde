float counter = 0;
int change = 0;
int stop, highscore = 0;
String[] output = new String[1];
String line;

void setup() {
  size(200,200);
  textSize(30);
  fill(240);
  try {
    output = loadStrings("highscore.txt");
    if (output.length == 0) {
      output[0] = "0";
    }
  } catch (Exception e) {
    line = null;
    e.printStackTrace();
    saveStrings("highscore.txt", output);
    exit();
  }
  if (line == null) {
      highscore = int(output[0]);
  }
}

void draw() {
  clear();
  if (mousePressed) {
    background(color(10, 70, 10));
    counter = counter + change;
    change++;
    if (floor(counter/1000) > highscore) {
      highscore = floor(counter/1000);
    }
  } else {
    //change = 0;
    change = 0;
    background(10);
    counter = counter - floor(counter*0.01);
  }
  //println(frameCount);
  rect(5, 40, 190, 80);
  fill(10);
  textSize(40);
  text(floor(counter/1000), 20, height/2);
  fill(240);
  textSize(30);
  text("Stops: " + stop, 5, 30);
  text("Highscore:", 5, height-50);
  text(int(highscore), 20, height-15);
}

void mouseReleased() {
  stop++;
  if (floor(counter/1000) > highscore) {
    highscore = floor(counter/1000);
    output[0] = str(highscore); 
    saveStrings("highscore.txt", output);
  }
  //counter = 0;
}

void keyPressed() {
  if (keyCode == CONTROL) {
    counter = highscore*1000;
  }
}
