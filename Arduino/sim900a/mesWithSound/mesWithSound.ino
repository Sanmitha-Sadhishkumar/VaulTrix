#include <SoftwareSerial.h>

SoftwareSerial SIM900A(2,3);

const int microphonePin = A0;  // Analog pin the microphone is connected to
const int threshold = 900;     // Adjust threshold as needed

void setup()
{
  SIM900A.begin(9600);   // GSM Module Baud rate - communication speed 
  Serial.begin(9600);    // Baud rate of Serial Monitor in the IDE app
  Serial.println ("Text Message Module Ready & Verified");
  delay(100);
  Serial.println ("High-volume detection is active");
}

void loop()
{
  int soundLevel = analogRead(microphonePin);
  
  if (soundLevel > threshold) {
    SendMessage();
    // Add a delay to prevent sending multiple messages in quick succession
    delay(5000);  // Adjust delay time as needed
  }
  
  if (SIM900A.available() > 0)
    Serial.write(SIM900A.read());
}

void SendMessage()
{
  Serial.println ("Sending Message please wait....");
  SIM900A.println("AT+CMGF=1");    //Text Mode initialization 
  delay(1000);
  Serial.println ("Set SMS Number");
  SIM900A.println("AT+CMGS=\"+916381677665\"\r"); // Receiver's Mobile Number
  delay(1000);
  Serial.println ("Set SMS Content");
  SIM900A.println("Help! There is a high volume detected (possibly screaming).");// Message content
  delay(100);
  Serial.println ("Done");
  SIM900A.println((char)26);
  delay(1000);
  Serial.println ("Message sent successfully");
}