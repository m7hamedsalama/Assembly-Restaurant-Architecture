# 🏺 Egyptian Restaurant Management System (x86 Assembly)

![Assembly](https://img.shields.io/badge/Language-x86_Assembly-red)
![Assembler](https://img.shields.io/badge/Assembler-TASM-blue)
![Platform](https://img.shields.io/badge/Platform-DOSBox-orange)
![License](https://img.shields.io/badge/License-MIT-green)

> A robust, interactive, and culturally localized Point of Sale (POS) system engineered in 16-bit x86 Assembly Language. This project demonstrates advanced memory management, direct hardware manipulation, and modular software architecture within a low-level environment.

---

## 📖 Project Overview

This project goes beyond simple console output. It is a full simulation of a restaurant management system tailored for the Egyptian market. It handles user transactions, performs real-time arithmetic operations, and manages system memory efficiently to overcome standard 16-bit limitations.

The goal was to transform the rigid DOS environment into a **Dynamic User Experience** using BIOS interrupts and optimized backend logic.

### ✨ Key Features
* **🇪🇬 Cultural Localization:** Fully localized menu containing Egyptian staples (Koshary, Foul, Mahshi, Mombar, etc.).
* **🎨 Custom UI Engine:** Direct manipulation of Video Services (`INT 10h`) to create a blue/yellow BIOS-style interface with dynamic screen clearing.
* **🧮 Centralized Arithmetic Kernel:** A modular calculation block that handles pricing logic for all categories to ensure code reusability.
* **🛡️ Robust Error Handling:** Input validation systems to prevent invalid selections and ensure system stability.

---

## ⚙️ Technical Architecture

This system is built upon a **Modular Architecture** to adhere to the **DRY (Don't Repeat Yourself)** principle.

### 1. The Central Processing Unit (`CALC_COMMON`)
Instead of redundant calculation code for each item, a central "kernel" handles the math:
* **Input:** Receives a "Price Factor" in the `BL` register.
* **Process:** Multiplies by quantity using `MUL` and adjusts for ASCII display using `AAM` (ASCII Adjust after Multiplication).
* **Output:** Renders the final calculated price to the user.

### 2. Memory Engineering & Jump Bridges
Due to the massive size of the menu logic, conditional jumps (`JE`) often fail due to the "Short Range" limitation (-128 to +127 bytes).
* **Solution:** Implemented **"Jump Bridges"**—intermediate routing points using unconditional `JMP` instructions to navigate the Instruction Pointer (IP) safely across memory segments.

### 3. Direct Hardware Manipulation
* **Video Buffer Clearing:** The system creates a clutter-free experience by flushing the video buffer between menu transitions.
* **Attribute Control:** Uses `INT 10h / Function 06h` to force specific color attributes (Blue Background `1`, Yellow Text `E`) directly into video memory.

### 4. Portability & Segmentation
To resolve `Undefined Symbol: @DATA` errors common in strict TASM configurations, the project utilizes **Explicit Labeling** (`DATA_START`) for segment addressing, ensuring high portability across different assemblers.

---

## 📸 Screenshots

| Menu Selection | Calculation & Billing |
|:--------------------:|:--------------:|:---------------------:|
|*[<img width="802" height="370" alt="Capture" src="https://github.com/user-attachments/assets/abee6b10-d33c-4a57-9214-bc7a04ed8c83" />
]* | *[<img width="802" height="527" alt="Capture2" src="https://github.com/user-attachments/assets/babac8b1-3835-4734-9e78-ffac95d636f0" />
]* |

---

## 🚀 How to Run

You will need **DOSBox** and **TASM** (Turbo Assembler) installed.

1.  Clone this repository:
    ```bash
    git clone [https://github.com/m7hamedsalama/Egyptian-Restaurant-Assembly.git](https://github.com/m7hamedsalama/Egyptian-Restaurant-Assembly.git)
    ```
2.  Mount your directory in DOSBox:
    ```bash
    mount c c:\assembly
    c:
    ```
3.  Assemble and Link:
    ```bash
    tasm PROJECT.ASM
    tlink PROJECT.OBJ
    ```
4.  Run the executable:
    ```bash
    PROJECT.EXE
    ```

---

## 🧩 Code Snippet Highlight

Here is how the **Modular Calculation Logic** works under the hood:

```assembly
   ; --- Centralized Calculation Routine ---
   CALC_COMMON:
    LEA DX, M58      ; Prompt for Quantity        
    MOV AH, 9
    INT 21H 
    
    MOV AH, 1        ; Get Input
    INT 21H
    SUB AL, 48       ; ASCII to Decimal Conversion
     
    MUL BL           ; Math Operation (Qty * PriceFactor)
    AAM              ; ASCII Adjust (Splits Hex result into Decimals)
 
    MOV CX, AX       ; Store result
    ADD CH, 48       ; Convert back to ASCII for printing
    ADD CL, 48
    
    ; ... Printing Routine Follows ...

---

## 📸 Full project explanation video 🎥
   [https://drive.google.com/file/d/16ByiRiWPeLbZsy_rHpnDdGO_5B8hYo2q/view?usp=sharing]
