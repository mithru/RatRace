
#include <Servo.h>

Servo myservo;

int onPos = 0;
int offPos = 90;

void setup()
{
  Serial.begin(9600);
  myservo.attach(9);  // attaches the servo on pin 9 to the servo object
}

void loop()
{
}

void serialEvent() {
  while (Serial.available()) {

    int inChar = Serial.read();
    if(inChar == 0){
      myservo.write(onPos);
    } else {
       myservo.write(offPos);   
    }
  }
}
