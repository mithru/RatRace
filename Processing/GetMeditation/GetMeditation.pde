import processing.serial.*;
import pt.citar.diablu.processing.mindset.*;

MindSet player1;
int meditationLevel;
int threshold = 50;

float signalStrength;
Serial myPort;

void setup() {
 
  println(Serial.list());
  
  String portName = Serial.list()[3];
  myPort = new Serial(this, portName, 9600);
  
  size(displayWidth, displayHeight);
  player1 = new MindSet(this, "/dev/cu.MindWaveMobile-DevA");
  
  textSize(64);
}

void draw() {
 
  println("Meditation      = " +meditationLevel);
  println("Signal Strength = " + signalStrength);
  
  if(meditationLevel > threshold){
    myPort.write('0'); 
    background(255);
    fill(0);
  } else {  
    background(0);
    fill(255);
    myPort.write('1'); 
  }
  text(meditationLevel, width/2, height/2);
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

   