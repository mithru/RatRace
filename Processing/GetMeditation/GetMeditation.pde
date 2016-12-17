import processing.serial.*;
import pt.citar.diablu.processing.mindset.*;

MindSet player1;
int meditationLevel;
int threshold = 50;

float signalStrength;
Serial myPort;

void setup() {
 
  println(Serial.list());
  
  //String portName = Serial.list()[3];
  myPort = new Serial(this, "/dev/cu.usbmodem149", 9600);
  
  size(displayWidth, displayHeight);
  player1 = new MindSet(this, "/dev/cu.MindWaveMobile-DevA");
  
  textSize(64);
}

void draw() {
 
  //println("Meditation      = " +meditationLevel);
  //println("Signal Strength = " + signalStrength);
  sendActualValue();
//sendBasedOnThreshold();
  
}

void sendActualValue(){
  background(0);
  int val = (int)(meditationLevel/11);
  
  switch(val){
    case 0 : myPort.write('0');
    break;
    
    case 1 : myPort.write('1');
    break;
    
    case 2 : myPort.write('2');
    break;
    
    case 3 : myPort.write('3');
    break;
    
    case 4 : myPort.write('4');
    break;
    
    case 5 : myPort.write('5');
    break;
    
    case 6 : myPort.write('6');
    break;
    
    case 7 : myPort.write('7');
    break;
    
    case 8 : myPort.write('8');
    break;
    
    case 9 : myPort.write('9');
    break;
    
    default : myPort.write('0');
    break;
    
  }
  
  myPort.write('\n');
  //myPort.write(val);
  delay(10);
  println("sending " + val);
  
  
  fill(255);
  rect(0, 0, width, height - map(val, 0, 10, 0, height));
  fill(120);
  text(val, width/2, height/2);
}

void sendBasedOnThreshold(){
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

   
