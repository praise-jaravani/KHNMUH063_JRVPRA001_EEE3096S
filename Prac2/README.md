# Digital-to-Analog Converter (DAC) Practical

## Overview

This practical demonstrates the implementation of a simple 10-bit Digital-to-Analog Converter (DAC) using Pulse Width Modulation (PWM) and a low-pass filter on an STM32 microcontroller. The project generates three different waveforms (sine, sawtooth, and triangle) and allows switching between them using a button interrupt.

## Objectives

1. Create a 10-bit DAC using PWM and a low-pass filter
2. Generate sine, sawtooth, and triangle waveforms
3. Implement look-up tables (LUTs) for waveform representation
4. Set up and use two timers (TIM2 and TIM3)
5. Utilize Direct Memory Access (DMA) for efficient data transfer
6. Implement a button interrupt for waveform switching
7. Display the current waveform on an LCD screen

## Hardware Requirements

- STM32 development board
- Low-pass filter components
- LCD display
- Push button
- Oscilloscope (for viewing the output)

## Software Requirements

- STM32CubeIDE
- STM32 HAL library

## Implementation Details

- **Waveform Generation**: Pre-calculated look-up tables (LUTs) store 128 values for each waveform.
- **PWM**: TIM3 is used to generate the PWM signal.
- **DMA**: Efficiently transfers data from LUTs to the PWM timer without CPU intervention.
- **Button Interrupt**: EXTI0_1_IRQHandler handles waveform switching.
- **LCD Display**: Shows the name of the currently active waveform.

## Key Functions

- `main()`: Initializes peripherals and starts the DAC operation.
- `EXTI0_1_IRQHandler()`: Handles button presses and waveform switching.
- `SystemClock_Config()`: Configures the system clock.
- `MX_TIM2_Init()` and `MX_TIM3_Init()`: Initialize the timers.
- `MX_DMA_Init()`: Initializes the DMA.

## Usage

1. Build and flash the project to your STM32 board.
2. Connect the low-pass filter to the PWM output pin (PB0).
3. Connect the LCD display to the appropriate pins.
4. Press the button (connected to PA0) to cycle through waveforms.
5. Use an oscilloscope to view the analog output from the low-pass filter.
