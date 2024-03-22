#include <SoftwareSerial.h>
SoftwareSerial SIM900(2,3); // gsm module connected here
String textForSMS;
int data = 0; 

int sensor = A1; // LDR is connected with the analog pin A1 of the Arduino


// cell numbers to which you want to send the security alert message
String f1001 = "+916381677665"; 
String f1002 = "+918248701899"; 
String f1003 = "+919363200587"; 
bool mes = true;

void setup() {

  randomSeed(analogRead(0));
  Serial.begin(9600);
  SIM900.begin(9600); // original 19200. while enter 9600 for sim900A
  Serial.println(" logging time completed!");
  pinMode(sensor, INPUT); 
  delay(5000); // wait for 5 seconds

}

void loop(  ) {
  if (mes){
    data = analogRead(sensor); 
    Serial.println(data); 
  
    if ( data < 400) // 
      {
  textForSMS =  "\nIntruder detected";  
  //sendSMS(textForSMS);
  sendsms("Danger!!!", f1001); // you can use a variable of the type String
  Serial.println(textForSMS);
  Serial.println("message sent."); 
  delay(5000);

  sendsms("Danger!!!!!!!!!", f1002); // you can also write any message that you want to send.
  Serial.println(textForSMS);
  Serial.println("message sent."); 
  delay(5000);

  sendsms("Danger!!!!!!!!!", f1003); // you can also write any message that you want to send.
  Serial.println(textForSMS);
  Serial.println("message sent."); 
  delay(5000);

  mes = false;
  }

  }

}


void sendsms(String message, String number)
{
String mnumber = "AT + CMGS = \""+number+"\""; 
   SIM900.print("AT+CMGF=1\r");                   
  delay(1000);
 SIM900.println(mnumber);  // recipient's mobile number, in international format
 
  delay(1000);
  SIM900.println(message);                         // message to send
  delay(1000);
  SIM900.println((char)26);                        // End AT command with a ^Z, ASCII code 26
  delay(1000); 
  SIM900.println();
  delay(100);                                     // give module time to send SMS
 // SIM900power();  
}