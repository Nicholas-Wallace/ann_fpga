# FPGA Implementation of a Simple Neural Network

This repository contains the final project for the Digital Systems course at the **Federal University of Rio Grande do Norte (UFRN)**. The project is the design and implementation of a small artificial neural network in VHDL, intended for an FPGA.

The primary goal was to apply digital design concepts learned in class—such as ROMs, array multipliers, adders, and registers—to build a functional neural network from the ground up.

---

## 👥 Authors

### Students
* Guilherme Ribeiro Amorim
* João Victor de Souza Pereira da Costa Salústio
* Jorge Marinheiro da Silva Filho
* Nicholas Wallace Lopes

### Professor
* Tiago Tavares Leite Barros

---

## 🧠 Neural Network Architecture

The network is a computational model inspired by biological neural networks. Its structure is divided into three main types of layers: an **input layer**, **hidden (intermediate) layers**, and an **output layer**.

<img width="1052" height="631" alt="Screenshot from 2025-09-29 18-32-28" src="https://github.com/user-attachments/assets/cb2d88e6-e20d-429d-9eb5-dcc57ae65ad1" />

The entire design is built using fundamental digital components.

### Core Components
* **Array Multiplier**: An 8-bit multiplier used to calculate the product of inputs and their corresponding weights.
* **Carry-Ripple Adder**: Performs the summation of the weighted inputs and adds the bias term.
* **ROMs (Read-Only Memory)**: Two separate memories are used to store the weights (`Rom_W`) and biases (`Rom_B`) of the neurons.
* **Register**: Stores the output of each neuron before it's passed to the next layer.
* **Activation Function (`Func`)**: A simple function that checks if the neuron's calculated output is positive or negative.



---

## ⚙️ Implementation Details

The project is divided into a control unit and a datapath, which work together to execute the neural network's calculations.

### High-Level State Machine (HLSM)
The network's behavior is managed by a High-Level State Machine (HLSM) that controls the flow of data and operations. Its main states are:
* **Init**: The initial state to start the machine.
* **Wait**: Intermediate states that wait for an `enable` signal or for an operation to complete.
* **Operation States**: States where calculations are performed, memories are accessed, and neurons are activated.

<img width="837" height="439" alt="Screenshot from 2025-09-29 21-55-07" src="https://github.com/user-attachments/assets/e7125795-f93e-4ede-85ed-bc8add187a8a" />


### Activation Function
A simple activation function was implemented to validate the network's processing logic. The function's role is to check if the result of a neuron's computation is positive or negative.
* If the result is **positive**, the function outputs `1`.
* If the result is **negative**, the function outputs `-1`.

---

## 💡 How It Works

The simulation was performed with a **20ns clock cycle**. The operational flow is as follows:

1.  The controller starts in the `INIT` state and moves to a `WAIT` state.
2.  When the `enable` signal is asserted, the controller begins fetching the required weights and biases from the two ROMs.
3.  The first neuron (`n00`) is activated, receiving its inputs and performing the multiplication and addition operations. The result is passed through the activation function.
4.  The output of the first layer serves as the input for all neurons in the second layer, which are activated simultaneously.
5.  This process repeats for the subsequent layers until the final output neuron (`n30`) calculates the network's result.
6.  Finally, the machine resets the memory addresses and returns to the `WAIT` state, ready for a new operation.

---

## 🚧 Challenges and Solutions

During development, several challenges were encountered and successfully resolved:

* **Memory Overflow**: Some initial weight values caused the 8-bit output to overflow.
    * **Solution**: We carefully selected weights that would keep the results within the 8-bit range, preventing data loss.
* **Array Multiplier Complexity**: The initial design of the array multiplier was complex due to the bit-width.
    * **Solution**: The input size was limited to 8 bits, which simplified the multiplier's logic and implementation.
* **Memory Management**: Using a single memory for both weights and biases created complexity, requiring simultaneous access to multiple addresses.
    * **Solution**: The design was changed to use two separate memories—one for weights and one for biases. This simplified the control logic and made the code easier to manage.

<img width="1470" height="614" alt="Screenshot from 2025-09-29 21-56-59" src="https://github.com/user-attachments/assets/4e634920-4027-4206-9066-feae6d0f88ee" />


---

## 🚀 Getting Started

To get started with this project:

1.  **Clone the repository:**
    ```sh
    git clone [https://github.com/Nicholas-Wallace/ann_fpga.git](https://github.com/Nicholas-Wallace/ann_fpga.git)
    ```
2.  **Open the project:**
    * You will need an FPGA development environment with VHDL simulation support (e.g., Intel Quartus Prime, Xilinx Vivado, or a standalone simulator like ModelSim).
3.  **Run the simulation:**
    * Load the project files and run the provided simulation script or testbench to observe the behavior described in the report. The top-level design file is `rede_neural.bdf`.
