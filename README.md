# Asynchronous FIFO

## Overview

This project implements a parameterized **Asynchronous FIFO** that enables safe data transfer between two independent clock domains. The design supports separate write and read clocks and provides reliable clock-domain crossing (CDC) through Gray-code pointer synchronization and double-flop synchronizers.

The FIFO was **designed, implemented, lint checked, and verified** using a self-checking verification environment. The RTL is **lint-clean** with no critical warnings or errors reported.

The architecture is based on the standard asynchronous FIFO methodology consisting of independent read and write controllers, synchronized Gray-code pointers, and a dual-port memory structure. The design specification includes independent write and read clocks, FIFO full/empty status generation, and parameterizable data width and FIFO depth.

---

## Design Architecture

The asynchronous FIFO consists of the following RTL blocks:

### 1. FIFO_MEM_CNTRL

* Implements the FIFO storage memory.
* Supports simultaneous read and write operations.
* Parameterized data width and memory depth.
* Interfaces with both write and read address generators.

### 2. FIFO_WR

* Generates the write pointer and write address.
* Maintains binary and Gray-code write pointers.
* Detects FIFO full condition.
* Updates the write pointer only when write enable is asserted and the FIFO is not full.

### 3. FIFO_RD

* Generates the read pointer and read address.
* Maintains binary and Gray-code read pointers.
* Detects FIFO empty condition.
* Updates the read pointer only when read enable is asserted and the FIFO is not empty.

### 4. DF_SYNC (Double-Flop Synchronizer)

* Synchronizes Gray-code pointers across clock domains.
* Minimizes metastability risks during clock-domain crossing.
* Used for:

  * Synchronizing the read pointer into the write clock domain.
  * Synchronizing the write pointer into the read clock domain.

### 5. ASYNC_FIFO (Top Module)

* Integrates all submodules.
* Connects memory, synchronizers, read controller, and write controller.
* Generates the external FIFO interface signals:

  * Write clock/reset
  * Read clock/reset
  * Write enable
  * Read enable
  * Data input/output
  * Full flag
  * Empty flag

The architecture follows the specification requiring:

* FIFO memory controller
* Double-flop synchronizer
* Write controller
* Read controller
* Top-level asynchronous FIFO integration

---

## CDC Methodology

To guarantee reliable operation across asynchronous clock domains:

* Binary pointers are maintained locally within each clock domain.
* Gray-code conversion is used before crossing clock domains.
* Double-flop synchronizers are employed to reduce metastability probability.
* Full and empty flags are generated using synchronized Gray-code pointers.

This approach ensures robust clock-domain crossing and prevents incorrect pointer comparisons caused by metastability.

---

## Verification

The design was verified using a **self-checking testbench environment**.

### Verification Features

* Independent read and write clocks.
* Automatic stimulus generation.
* Reference-model based checking.
* Data integrity verification.
* Full and empty flag validation.
* FIFO overflow and underflow scenario testing.
* End-of-test automatic pass/fail reporting.

### Verification Flow

1. Generate write transactions.
2. Store expected values in a reference queue/model.
3. Read data from the DUT.
4. Compare DUT outputs against expected values automatically.
5. Report mismatches and functional errors.
6. Declare PASS when all transactions are transferred correctly.

The verification environment eliminates manual waveform inspection by automatically checking FIFO functionality and reporting errors.

---

## Linting

The RTL was analyzed using industry-standard linting methodology.

### Results

* RTL is **lint-clean**.
* No critical lint violations.
* No unintended latches.
* No combinational feedback loops.
* No undeclared signals.
* No multiple-driver issues.

The linting process improved code quality, maintainability, and synthesis readiness.

---

## Key Features

* Parameterized data width.
* Parameterized FIFO depth.
* Independent read and write clock domains.
* Gray-code pointer synchronization.
* Double-flop CDC protection.
* Full and empty flag generation.
* Simultaneous read/write support.
* Self-checking verification environment.
* Lint-clean RTL implementation.

---

## Design Flow

**Specification → RTL Design → Linting → Simulation → Self-Checking Verification → Debug & Closure**

The project demonstrates complete RTL development and verification flow for a CDC-based asynchronous FIFO, including architecture design, implementation, lint analysis, and functional verification.
