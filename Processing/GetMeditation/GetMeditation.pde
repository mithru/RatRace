import processing.serial.*;
import pt.citar.diablu.processing.mindset.*;

MindSet player1;
int meditationLevel;
int threshold = 60;

float signalStrength;

void setup() {
 
  println(Serial.list());
  
  String portName = Serial.list()[3];
  myPort = new Serial(this, portName, 9600);
  
  size(512, 512);
  player1 = new MindSet(this, "/dev/cu.MindWaveMobile-DevA");
}

void draw() {
  background(0);
  println("Meditation      = " +meditationLevel);
  println("Signal Strength = " + signalStrength);
  
  if(meditationLevel > threshold){
    myPort.write(1);
  } else {  
    myPort.write(0); 
  }
}


void keyPressed() {
  if (key == 'q') {
    player1.quit();
  }
}

public void poorSignalEvent(int sig) {
  signalStrength = map(sig, 0, 200, 100, 0);
}

public void meditationEvent(int medLevel) {
  meditationLevel = medLevel;
}

   
