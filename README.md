# Assembly Tests – SASM

This repository contains a collection of test programs written in Assembly language. These activities were developed as part of the **Computer Organization and Architecture** course, during which I received a hands-on introduction to Assembly using the **SASM** (Simple ASM) environment.

The purpose of this repository is to document the experiments and practical exercises completed throughout the course, serving as a record of the knowledge acquired.

---

## Purpose of Each Program

### 1. `bubblesort.asm`
Implements the **Bubble Sort** algorithm on an array of integers. The algorithm iterates through the array multiple times, comparing adjacent elements and swapping them if they are out of order. The sorted array is then printed.

### 2. `fibonacci.asm`
Generates the first `n` terms of the **Fibonacci sequence**. The user provides the value of `n`, and the program calculates and prints each term iteratively.

### 3. `largestelement.asm`
Finds and prints the **largest element** in an array of integers. During each iteration, it compares two consecutive elements and stores the largest one found.

### 4. `leapyear.asm`
Checks whether a **given year is a leap year**. The verification is based on whether the year is divisible by 4. The program displays whether the year is leap or not, showing the remainder of the division.

### 5. `printingvector.asm`
Prints the numbers **from 0 to 99**. A loop increments a counter variable on each iteration and prints its value using `printf`.

---

## Requirements

- [SASM](https://dman95.github.io/SASM/) (Simple ASM IDE)
- Compatible operating system (Linux or Windows)
- NASM assembler and standard libraries for running Assembly programs

---

## How to Run

1. Open the desired `.asm` file in SASM.
2. Compile and execute it using the built-in features.
3. For programs that require user input (`fibonacci.asm`, `leapyear.asm`), enter the values in the console window during execution.

---

## License

This repository is intended for educational use. Feel free to use and adapt the code for learning purposes.


 