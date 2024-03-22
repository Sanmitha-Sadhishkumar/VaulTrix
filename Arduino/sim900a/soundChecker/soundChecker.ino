const int microphonePin = A0;  // Analog pin the microphone is connected to

void setup() {
  Serial.begin(9600); // Initialize serial communication
}

void loop() {
  // Read the voltage from the microphone
  int sensorValue = analogRead(microphonePin);
  
  // Print the sensor value to the serial monitor
  Serial.println(sensorValue);
  
  // Add a short delay to prevent flooding the serial monitor
  delay(100);
}