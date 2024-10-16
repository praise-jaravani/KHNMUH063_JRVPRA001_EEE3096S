# EEE3096S Lab 4: Assembly Programming for STM32

## Overview

This repository contains the Assembly code for Lab 4 of the EEE3096S course. The project implements various LED control functionalities on an STM32 microcontroller using Assembly language.

## Features

- Default LED increment pattern
- Button-controlled LED behaviors
- Software-based timing control
- Efficient bit manipulation techniques
- Direct hardware register access

## Hardware Requirements

- STM32 microcontroller board
- 4 push buttons (SW0, SW1, SW2, SW3)
- 8 LEDs connected to GPIOB

## Functionality

1. **Default Behavior**: LEDs increment by 1 every 0.7 seconds
2. **SW0 Pressed**: LEDs increment by 2 every 0.7 seconds
3. **SW1 Pressed**: LED increment timing changes to 0.3 seconds
4. **SW2 Pressed**: LED pattern set to 0xAA
5. **SW3 Pressed**: LED pattern freezes until released

## Code Structure

- `ASM_Main`: Main entry point and initialization
- `main_loop`: Primary execution loop
- `check_sw3`, `check_sw2`, etc.: Button check subroutines
- `write_leds`: LED update routine
- `delay_loop`: Software delay implementation

## Building and Flashing

1. Assemble the code using an ARM assembler
2. Link the assembled code
3. Flash the resulting binary to your STM32 board

## Key Learnings

- Direct manipulation of memory-mapped registers
- Efficient use of bitwise operations in Assembly
- Implementation of software delays
- Button debouncing techniques in low-level programming

## Author

Praise Jaravani (JRVPRA001)

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details.

## Acknowledgments

- Dr. Simon Winberg for course guidance
- STMicroelectronics for microcontroller documentation