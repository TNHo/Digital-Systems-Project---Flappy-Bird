# Digital Systems Project - Flappy Bird
RTL Design - Flappy Bird

## Summary
This project implements Flappy Bird as a custom processor in VHDL. We do this by taking a 'High Level State Machine' diagram and translate its behavhiors into multiple circuits. 
![HLSM](https://raw.githubusercontent.com/TNHo/Digital-Systems-Project---Flappy-Bird/refs/heads/main/Report/Flappy_Bird_HLSM.png)

The purpose of the custom processor is to simulate the game of Flappy Bird. The processor is based off the HLSM. The inputs of the processor are ‘B’ and “ground_level”, and the outputs are ‘J’, ‘F’, ‘D’, and ‘Ypos.’ B when HI always leads to the “Jump” state. B when LO always leads to the “Fall” state and stays falling until either B goes to HI or our Y position is lower than ground level, in that case the processor goes into the “Die” state until B goes to HI and the bird is revived. 

### What is VHDL? 

VHDL is a hardware description language. It is not exactly a "programming" language although it looks similar to one. It is used to describe the structure and behavhior of an electronic circuit.



## Schematic


![Datapath](https://raw.githubusercontent.com/TNHo/Digital-Systems-Project---Flappy-Bird/refs/heads/main/Schematics/Datapath_Schematic_Illustr-01.jpg)

![Processor](https://raw.githubusercontent.com/TNHo/Digital-Systems-Project---Flappy-Bird/refs/heads/main/Schematics/FSM%20Controller-01.jpg)