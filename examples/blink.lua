--  Blink
--  Turns on an LED on for one second, then off for one second, repeatedly.
--  This example code is in the public domain.
require("arduino_wraper")

function App:setup()
    self.ledpin = getPin("PD_13") -- Pin PD_13 has a LED connected
    pinMode(self.ledpin, OUTPUT) -- Initialize the digital pin as an output.
end

function App:loop()
    digitalWrite(self.ledpin, HIGH)    -- set the LED on
    delay(1000)                      -- wait for a second
    digitalWrite(self.ledpin, LOW)     -- set the LED off
    delay(1000)                      -- wait for a second
end

app = App:new("Blink led")
app:run()

