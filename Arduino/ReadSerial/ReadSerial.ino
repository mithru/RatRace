
#include <Servo.h>

Servo myservo;

String inputString = "";         // a string to hold incoming data
boolean stringComplete = false;  // whether the string is complete


int onPos = 0;
//int offPos = 90;
int offPos = 10;
int  value = 0;

int slowestValue = 1000;

void setup()
{
  Serial.begin(9600);
  myservo.attach(3);
  inputString.reserve(200);
}

void loop()
{
  // delay(10);

  if (stringComplete) {
    // clear the string:
    inputString = "";
    stringComplete = false;
  }

  switch (value) {
    case 1 :
      flicker(100, (int)(slowestValue / 1));
      break;

    case 2 :
      flicker(200, (int)(slowestValue / 2));
      break;

    case 3 :
      flicker(300, (int)(slowestValue / 3));
      break;

    case 4 :
      flicker(400, (int)(slowestValue / 4));
      break;

    case 5 :
      flicker(500, (int)(slowestValue / 5));
      break;

    case 6 :
      flicker(600, (int)(slowestValue / 6));
      break;

    case 7 :
      flicker(700, (int)(slowestValue / 7));
      break;

    case 8 :
      flicker(800, (int)(slowestValue / 8));
      break;

    case 9 :
      flicker(900, (int)(slowestValue / 9));
      break;
    default:
    case 0 :
      myservo.write(offPos);
      break;
  }
}

void flicker(int onDel, int offDel) {

  myservo.write(onPos);
  delay(onDel);
  myservo.write(offPos);
  delay(offDel);

}

void serialEvent() {
  while (Serial.available()) {
    // get the new byte:
    char inChar = (char)Serial.read();
    // add it to the inputString:
    inputString += inChar;
    // if the incoming character is a newline, set a flag
    // so the main loop can do something about it:
    if (inChar == '\n') {
      stringComplete = true;
      value = inputString.toInt();
      Serial.println(value);
    }
  }
}
