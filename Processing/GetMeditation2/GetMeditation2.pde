import processing.serial.*;
import pt.citar.diablu.processing.mindset.*;

MindSet player1;
int meditationLevel;
float signalStrength;

int numSamples = 60;
ArrayList attSamples;

void setup() {
  size(512, 512);
  attSamples = new ArrayList();
  //player1 = new MindSet(this, "/dev/cu.MindWaveMobile-DevA");
  player1 = new MindSet(this, "/dev/cu.MindWaveMobile-DevA-1");
}

void draw() {
  background(0);
  println("Meditation      = " +meditationLevel);
  println("Signal Strength = " + signalStrength);
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

   
