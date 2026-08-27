# Synchronous FIFO using Verilog HDL

## 📌 Overview

This project implements a **4-depth, 8-bit synchronous FIFO (First-In First-Out)** using Verilog HDL.

The FIFO stores data in memory and ensures that the first data written into the FIFO is the first data read out.

## ⚙️ Specifications

* **FIFO Type:** Synchronous FIFO
* **Data Width:** 8 bits
* **FIFO Depth:** 4
* **Memory:** 4 × 8-bit
* **Write Pointer:** 2-bit
* **Read Pointer:** 2-bit
* **Counter:** 3-bit
* **HDL:** Verilog
* **Simulation Tool:** Xilinx Vivado

## 🔧 Design Components

The FIFO consists of:

* Memory array for storing data
* Write pointer (`wr_ptr`)
* Read pointer (`rd_ptr`)
* Counter (`count`)
* Write enable (`wr_en`)
* Read enable (`rd_en`)
* Empty flag (`empty`)
* Full flag (`full`)
* Data input (`data_in`)
* Data output (`data_out`)

## 🔄 FIFO Operation

### Write Operation

When:

```text
wr_en = 1
full  = 0
```

data is written into the memory at the location pointed to by `wr_ptr`.

The write pointer then moves to the next location.

### Read Operation

When:

```text
rd_en = 1
empty = 0
```

data is read from the memory location pointed to by `rd_ptr`.

The read pointer then moves to the next location.

### Simultaneous Read and Write

The design also supports simultaneous read and write operations when the FIFO is neither empty nor full.

In this case:

* One data item is written.
* One data item is read.
* The FIFO count remains unchanged.

## 🚦 FIFO Status Flags

| Condition               | Empty | Full |
| ----------------------- | ----: | ---: |
| FIFO contains 0 items   |     1 |    0 |
| FIFO contains 1–3 items |     0 |    0 |
| FIFO contains 4 items   |     0 |    1 |

## 🧪 Verification

The FIFO was simulated using **Xilinx Vivado Behavioral Simulation**.

The simulation verifies:

* Reset operation
* Data writing
* Data reading
* FIFO empty condition
* FIFO full condition
* Pointer wrap-around
* Simultaneous read and write

### Simulation Result

The testbench writes the following data:

```text
AA → BB → CC → DD
```

The same data is subsequently read in the same order:

```text
AA → BB → CC → DD
```

This confirms the **First-In First-Out** behavior.

## 📊 Simulation Waveform

![FIFO Simulation Waveform](fifo_waveform.png)

## 📁 Project Files

| File                | Description                |
| ------------------- | -------------------------- |
| `fifo_sync.v`       | FIFO RTL design            |
| `fifo_sync_tb.v`    | Verilog testbench          |
| `fifo_waveform.png` | Vivado simulation waveform |
| `README.md`         | Project documentation      |

## 🛠️ Tools Used

* Verilog HDL
* Xilinx Vivado
* Vivado Behavioral Simulator

## 🚀 Future Improvements

* Parameterized FIFO depth
* Parameterized data width
* Almost-full and almost-empty flags
* Assertions for verification
* Improved simultaneous read/write handling
* Larger FIFO memory configurations
