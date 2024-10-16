@ DO NOT EDIT
.syntax unified
.text
.global ASM_Main
.thumb_func

vectors:
    .word 0x20002000
    .word ASM_Main + 1

ASM_Main:
    LDR R0, RCC_BASE
    LDR R1, [R0, #0x14]
    LDR R2, AHBENR_GPIOAB
    ORRS R1, R1, R2
    STR R1, [R0, #0x14]

    LDR R0, GPIOA_BASE
    MOVS R1, #0b01010101
    STR R1, [R0, #0x0C]
    LDR R1, GPIOB_BASE
    LDR R2, MODER_OUTPUT
    STR R2, [R1, #0]
    MOVS R2, #0  @ Initialize LED pattern

main_loop:
    @ Read button states
    LDR R3, GPIOA_BASE
    LDR R4, [R3, #0x10]
    MOVS R5, #0xF
    ANDS R4, R4, R5

    @ Check SW2 (set to 0xAA if pressed)
    MOVS R5, #4
    ANDS R5, R4, R5
    CMP R5, #0
    BNE check_sw3
    MOVS R2, #0xAA
    B write_leds

check_sw3:
    @ Check SW3 (freeze if pressed)
    MOVS R5, #8
    ANDS R5, R4, R5
    CMP R5, #0
    BEQ write_leds

    @ If SW3 not pressed, check SW0 and increment
    MOVS R5, #1
    ANDS R5, R4, R5
    CMP R5, #0
    BNE normal_increment
    ADDS R2, R2, #2  @ Increment by 2 if SW0 pressed
    B increment_done
normal_increment:
    ADDS R2, R2, #1  @ Normal increment by 1
increment_done:
    UXTB R2, R2  @ Ensure R2 stays within 0-255 range

write_leds:
    @ Write LED pattern
    STR R2, [R1, #0x14]

    @ Check SW1 for delay duration
    MOVS R5, #2
    ANDS R5, R4, R5
    CMP R5, #0
    BNE use_long_delay
    LDR R6, SHORT_DELAY_CNT
    B delay_loop
use_long_delay:
    LDR R6, LONG_DELAY_CNT

delay_loop:
    SUBS R6, #1
    BNE delay_loop

    B main_loop

@ LITERALS
.align
RCC_BASE: .word 0x40021000
AHBENR_GPIOAB: .word 0b1100000000000000000
GPIOA_BASE: .word 0x48000000
GPIOB_BASE: .word 0x48000400
MODER_OUTPUT: .word 0x5555
LONG_DELAY_CNT: .word 500000    @ Adjust for approximately 0.7 seconds
SHORT_DELAY_CNT: .word 214000   @ Adjust for approximately 0.3 seconds
