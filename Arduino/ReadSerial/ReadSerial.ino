
#include <Servo.h>

Servo myservo;

int onPos = 3;
int offPos = 90;

void setup()
{
  Serial.begin(9600);
  myservo.attach(3);
}

void loop()
{
}

void serialEvent() {
  while (Serial.available()) {

    int inChar = Serial.read();
    if (inChar == '0') {
      myservo.write(onPos);
    } else {
      myservo.write(offPos);
    }
  }
}
