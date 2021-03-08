
const int LArmTrig = 2;
const int LArmEcho= 3;

const int RArmTrig = 5;
const int RArmEcho= 6;

const int BackTrig = 8;
const int BackEcho= 9;

const int lBuzzer = 10;
const int rBuzzer = 11;
const int bBuzzer = 12;

float bDuration, lDuration, rDuration, bDistance, lDistance, rDistance;

void setup() {
  pinMode(LArmTrig, OUTPUT);
  pinMode(LArmEcho, INPUT);

  pinMode(RArmTrig, OUTPUT);
  pinMode(RArmEcho, INPUT);

  pinMode(BackTrig, OUTPUT);
  pinMode(BackEcho, INPUT);

  Serial.begin(9600);
}

void loop() {
  RightSensor();
  LeftSensor();
  BackSensor();

  Buzzer();

  Serial.println(RightSensor());
  delay(100);
  Serial.println(LeftSensor());
  delay(100);
  Serial.println(BackSensor());
  delay(100);
}

int RightSensor(){
  digitalWrite(RArmTrig, LOW);
  delayMicroseconds(2);
  digitalWrite(RArmTrig, HIGH);
  delayMicroseconds(10);
  digitalWrite(RArmTrig, LOW);

  rDuration = pulseIn(RArmEcho, HIGH);
  rDistance = (rDuration * .0343) / 2;

  return rDistance;
}

int LeftSensor(){
  digitalWrite(LArmTrig, LOW);
  delayMicroseconds(2);
  digitalWrite(LArmTrig, HIGH);
  delayMicroseconds(10);
  digitalWrite(LArmTrig, LOW);

  lDuration = pulseIn(LArmEcho, HIGH);
  lDistance = (lDuration * .0343) / 2;

  return lDistance;
}

int BackSensor(){
  digitalWrite(BackTrig, LOW);
  delayMicroseconds(2);
  digitalWrite(BackTrig, HIGH);
  delayMicroseconds(10);
  digitalWrite(BackTrig, LOW);

  bDuration = pulseIn(BArmEcho, HIGH);
  bDistance = (bDuration * .0343) / 2;

  return bDistance;
}

void Buzzer(){
  if bDistance <= 31 {
    for (i = 0); i < 5; i++){
      tone(buzzer, 1000); // Send 1KHz sound signal...
      delay(500); // ...for 0.5 sec
      noTone(buzzer);  // Stop sound...
      delay(1000); 
      if (i == 5){
        i = 0
      }
    }
  }

  if lDistance <= 31 {
    for (i = 0); i < 5; i++){
      tone(buzzer, 1000); // Send 1KHz sound signal...
      delay(500); // ...for 0.5 sec
      noTone(buzzer);  // Stop sound...
      delay(1000); 
      if (i == 5){
        i = 0
      }
    }
  }

  if rDistance <= 31 {
    for (i = 0); i < 5; i++){
      tone(buzzer, 1000); // Send 1KHz sound signal...
      delay(500); // ...for 0.5 sec
      noTone(buzzer);  // Stop sound...
      delay(1000); 
      if (i == 5){
        i = 0
      }
    }
  }
}



