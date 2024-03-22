/*#include <SoftwareSerial.h>

SoftwareSerial SIM900A(2,3);

void setup()
{
  SIM900A.begin(9600);   // GSM Module Baud rate - communication speed 
  Serial.begin(9600);    // Baud rate of Serial Monitor in the IDE app
  Serial.println ("Text Messege Module Ready & Verified");
  delay(100);
  Serial.println ("Type s to send message or r to receive message");
}


void loop()
{
  if (Serial.available()>0)
   switch(Serial.read())
  {
    case 's':
      char myNumbers[4][15] = {"+916381677665","+919363200587","+919994725900","+918248701899"};
      for(int i=0; i<4; i++){
        SendMessage(myNumbers[i]);
      }
      
      break;
    case 'r':
      RecieveMessage();
      break;
  }

 if (SIM900A.available()>0)
   Serial.write(SIM900A.read());
}



// void SendMessage(char myNumbers[4][15]){
//     char command[50];
//     for(int i=0; i<4; i++){
//       Serial.println ("Sending Message please wait....");
//       //SIM900A.println("AT+CMGF=1");    //Text Mode initialisation 
//       //SIM900A.println("AT+CMGF=3");
//       delay(1000);
//       Serial.println ("Set SMS Number");
//       //sprintf(command, "AT+CMGS=\"%s\"\r", myNumbers[i]);
//       sprintf(command, "AT+CMCW=\"%s\"\r", myNumbers[i]);
//       printf("%s",&command);
//       SIM900A.println(command); // Receiver's Mobile Number
//   //SIM900A.println("AT+CMGS=\"+919363200587\"\r");
//       delay(1000);
//       Serial.println ("Set SMS Content");
//       SIM900A.println("hii mam");// Messsage content
//       delay(100);
//       Serial.println ("Done");
//       SIM900A.println((char)26);//   delay(1000);
//       Serial.println ("Message sent succesfully");
//     }
// }

 void SendMessage(char* myNumbers)
{
  char command[50];
  Serial.println ("Sending Message please wait....");
  SIM900A.println("AT+CMGF=1");    //Text Mode initialisation 
  delay(1000);
  Serial.println ("Set SMS Number");

  sprintf(command, "AT+CMGS=\"%s\"\r", myNumbers);
  printf("%s",&command);
  SIM900A.println(command);

  //SIM900A.println("AT+CMGS=\"%s\"\r",myNumbers); // Receiver's Mobile Number
  //SIM900A.println("AT+CMGS=\"+919363200587\"\r");
  delay(1000);
  Serial.println ("Set SMS Content");
  SIM900A.println("hii mam");// Messsage content
  delay(100);
  Serial.println ("Done");
  SIM900A.println((char)26);//   delay(1000);
  Serial.println ("Message sent succesfully");
}


 void RecieveMessage()
{
  Serial.println ("Receiving Messeges");
  delay (1000);
  SIM900A.println("AT+CNMI=2,2,0,0,0"); // Eeceiving Mode Enabled
  delay(1000);
  Serial.write ("Messege Received Sucessfully");
 } */

 #include <SoftwareSerial.h>

SoftwareSerial SIM900A(2, 3);

void setup() {
  SIM900A.begin(9600);   // GSM Module Baud rate - communication speed 
  Serial.begin(9600);    // Baud rate of Serial Monitor in the IDE app
  Serial.println("Text Message Module Ready & Verified");
  delay(100);
  Serial.println("Type s to send message or r to receive message");
}

void loop() {
  if (Serial.available() > 0) {
    switch (Serial.read()) {
      case 's':
        char myNumbers[4][15] = {"+916381677665", "+918247202472","+916381677665", "+918247202472"};
        SendMessage(myNumbers, 4); // Pass the array and its size to SendMessage function
        break;
      case 'r':
        RecieveMessage();
        break;
    }
  }

  if (SIM900A.available() > 0)
    Serial.write(SIM900A.read());
}

void SendMessage(char myNumbers[][15], int count) {
  char command[50];
  for (int i = 0; i < count; i++) {
    Serial.println("Sending Message please wait....");
    SIM900A.println("AT+CMGF=1");    // Text Mode initialisation 
    delay(1000);
    Serial.println("Set SMS Number");
    sprintf(command, "AT+CMGS=\"%s\"\r", myNumbers[i]);
    SIM900A.println(command); // Receiver's Mobile Number
    delay(1000);
    Serial.println("Set SMS Content");
    SIM900A.println("hii"); // Message content
    delay(100);
    Serial.println("Done");
    SIM900A.println((char)26);
    delay(1000);
    Serial.println("Message sent successfully");
  }
}

void RecieveMessage() {
  Serial.println("Receiving Messages");
  delay(1000);
  SIM900A.println("AT+CNMI=2,2,0,0,0"); // Receiving Mode Enabled
  delay(1000);
  Serial.write("Message Received Successfully");
}
