# Digital Systems Project - Flappy Bird
RTL Design - Flappy Bird

## Summary
This project implements Flappy Bird as a custom processor in VHDL. We do this by taking a 'High Level State Machine' diagram and translate its behavhiors into multiple circuits. 
![HLSM](https://raw.githubusercontent.com/TNHo/Digital-Systems-Project---Flappy-Bird/refs/heads/main/Report/Flappy_Bird_HLSM.png)

The purpose of the custom processor is to simulate the game of Flappy Bird. The processor is based off the HLSM. The inputs of the processor are ‘B’ and “ground_level”, and the outputs are ‘J’, ‘F’, ‘D’, and ‘Ypos.’ B when HI always leads to the “Jump” state. B when LO always leads to the “Fall” state and stays falling until either B goes to HI or our Y position is lower than ground level, in that case the processor goes into the “Die” state until B goes to HI and the bird is revived. 

### What is VHDL? 

VHDL is a hardware description language. It is not exactly a "programming" language although it looks similar to one. It is used to describe the structure and behavhior of an electronic circuit.

## Schematic

### Datapath
To get the datapath, we look at the HLSM and look for any behavhiors that uses storage, does an arithmetic operation, or is a multi-bit input/output. Then we will add in components required for them. We use registers, a comparator, an adder and a subtractor. 

![Datapath](https://raw.githubusercontent.com/TNHo/Digital-Systems-Project---Flappy-Bird/refs/heads/main/Schematics/Datapath_Schematic_Illustr-01.jpg)

### Controller 
This is the part where we can't use the HLSM directly. The controller part of the custom processor uses single bit input/outputs. 
![FSM](https://raw.githubusercontent.com/TNHo/Digital-Systems-Project---Flappy-Bird/refs/heads/main/Report/Incomplete%20FSM.png)
So we make a Finite State Machine diagram, replacing any arithmetic operations with their single bit equivalents based on the contents of the Datapath.

![Processor](https://raw.githubusercontent.com/TNHo/Digital-Systems-Project---Flappy-Bird/refs/heads/main/Schematics/FSM%20Controller%20-%20Final.jpg)