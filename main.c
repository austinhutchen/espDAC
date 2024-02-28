#include <Arduino.h>
#include <driver/i2s.h>
#include <AudioTools.h>

// Define the I2S config
auto config = i2sStream.defaultConfig(TX_MODE);
config.i2s_format = I2S_STD_FORMAT; // change this according to your DAC module
config.sample_rate = 44100;
config.bits_per_sample = 16;
config.channels = 2;

// Define the sine wave generator
SineGenerator sine(config.sample_rate);

void setup() {
  // Initialize the I2S stream
  i2sStream.begin(config);

  // Set the sine wave frequency and amplitude
  sine.set(440, 0.5);
}

void loop() {
  // Write the sine wave samples to the I2S stream
  i2sStream.write(sine, 512);
}
