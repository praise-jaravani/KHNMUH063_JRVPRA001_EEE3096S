# STM32 Embedded Systems Practical

## Overview

This project implements various embedded systems functionalities on an STM32 microcontroller board. It demonstrates the use of ADC, PWM, interrupts, SPI communication, and LCD control.

## Features

- Analog-to-Digital Conversion (ADC) reading from a potentiometer
- PWM control of LED brightness based on ADC input
- LED toggling with adjustable frequency using pushbutton interrupt
- SPI communication with EEPROM for data storage and retrieval
- LCD display of EEPROM data with error detection

## Hardware Requirements

- STM32 microcontroller board
- Potentiometer connected to PA6
- LED connected to PB0 (PWM controlled)
- LED connected to PB7 (toggle controlled)
- Pushbutton connected to PA0
- EEPROM chip connected via SPI
- LCD display

## Software Dependencies

- STM32CubeIDE
- HAL libraries for STM32

## Setup and Installation

1. Clone this repository
2. Open the project in STM32CubeIDE
3. Build and flash the project to your STM32 board

## Usage

After flashing the program:

1. Turn the potentiometer to adjust the brightness of LED PB0
2. Press the pushbutton to toggle the frequency of LED PB7 between 1Hz and 2Hz
3. Observe the LCD display for EEPROM data readouts

## Main Components

- `main.c`: Contains the main program logic and interrupt handlers
- `lcd_stm32f0.c`: LCD driver functions

## Key Functions

- `pollADC()`: Reads ADC value from potentiometer
- `ADCtoCCR()`: Converts ADC value to PWM compare value
- `EXTI0_1_IRQHandler()`: Handles pushbutton interrupt
- `write_to_address()`: Writes data to EEPROM via SPI
- `read_from_address()`: Reads data from EEPROM via SPI
- `TIM16_IRQHandler()`: Periodically reads EEPROM and updates LCD

## Contributing

Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

## License

[MIT](https://choosealicense.com/licenses/mit/)
