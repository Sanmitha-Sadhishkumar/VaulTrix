

#include <SoftwareSerial.h>
#include <TinyGPS++.h>
float latitude,longitude; // create variable for latitude and longitude object 
SoftwareSerial gpsSerial(7,8);//tx,rx
SoftwareSerial gsmm(3,2);//tx,rx
TinyGPSPlus gps;// create gps object
void setup(){
Serial.begin(9600);
Serial.print("hlo...");
  
//lcd.begin(16, 2);
gpsSerial.begin(9600);
gpsSerial.listen();
 textgps();
 gsmm.begin(9600);
  gsmm.print("\r");
  delay(1000);        
  Serial.print("Working...");          
  

}
void loop(){
  

}

void textgps()
{

    while(1)
  {
   while (gpsSerial.available() > 0)
   { gps.encode(gpsSerial.read()); }

      if (gps.location.isUpdated())
      {
       Serial.print("LAT=");  Serial.println(gps.location.lat(), 6);
       Serial.print("LONG="); Serial.println(gps.location.lng(), 6);
       latitude=gps.location.lat();
       longitude=gps.location.lng();
       gsmm.print("AT+CMGF=1\r");    
    delay(1000);
  /*Replace XXXXXXXXXX to 10 digit mobile number &  ZZ to 2 digit country code*/
    gsmm.print("AT+CMGS=\"+919363200587\"\r");    
  delay(1000);
  //The text of the message to be sent.
  //gsmm.print(lattitude,longitude);
// gsmm.print(lattitude); 
//  gsmm.print(longitude); 
  gsmm.print("https://www.google.com/maps/place/");
      gsmm.print(latitude, 6);
      gsmm.print(",");
      gsmm.print(longitude, 6);
  
  delay(1000);
  gsmm.write(0x1A);
  delay(1000); 
// connect gps sensor

      break;
      }
  
   
  
}

 Serial.print("LATTITUDE="); Serial.println(latitude,6);
 Serial.print("LONGITUDE="); Serial.println(longitude,6);

 delay(1000);
// lcd.clear();
}
