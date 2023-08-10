int numSamples = 370; // number of rows (horizontal) equals number of data sets

int maxMouseCount = 50; // number of columns (mouse movements for one data set)
// if we change this number, it also needs to be changed in the network code

int mouseCount = 0, curSample = 0; 
int rowType = 0;

PrintWriter output;

void setup() {
  size(800, 800);
  output = createWriter("data-is-between-0-and-800.csv");
}

void draw() {
  background(255);
  output.print(mouseX + "," + mouseY + ",");
  println("Type: " + rowType + "; N: " + curSample + " X: " + mouseCount);
  delay(5);
  mouseCount += 2;

  if (mouseCount == maxMouseCount) {
    mouseCount = 0;
    output.print(rowType + "\n");
    curSample += 1;
    if(curSample == numSamples) { 
      exit();
    }
  }
}

void keyPressed() {
  rowType = 1;
}

void exit() {
  output.flush();
  output.close();
  super.exit();
}
