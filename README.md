# C to ARM64 Assembly Conversion Guide

คู่มือการแปลงไฟล์ภาษา C เป็น Assembly สถาปัตยกรรม **ARM 64-bit (AArch64)** สำหรับการศึกษาโครงสร้างคำสั่ง (Instruction Set Architecture) โดยใช้ Command Prompt บน Windows

## Prerequisites
ต้องติดตั้งเครื่องมือ **Arm GNU Toolchain** และตั้งค่า System Path ให้เรียบร้อยก่อนใช้งาน:
* **Compiler:** `aarch64-none-elf-gcc`
* **Architecture:** ARMv8-A (64-bit)

## Compilation Command
ใช้คำสั่งด้านล่างนี้ใน Terminal หรือ CMD เพื่อแปลงไฟล์:

```bash
aarch64-none-elf-gcc -S -O0 -fno-asynchronous-unwind-tables test.c -o test.s

Flag
-S: สั่งให้ Compiler หยุดที่ขั้นตอนการสร้าง Assembly และไม่สร้างไฟล์ .exe
-O0: Level 0,ปิดการบีบอัดโค้ด เพื่อให้ลำดับคำสั่งใน Assembly ตรงกับบรรทัดในภาษา C มากที่สุด (ทำให้อ่านง่าย)
-fno-asynchronous-unwind-tables: ตัดโค้ดส่วนเกินที่ใช้จัดการ Error (พวก .cfi_ ต่างๆ) ออกไป เพื่อให้เหลือแต่คำสั่ง Assembly เพียวๆ
-o <filename>: กำหนดชื่อไฟล์ผลลัพธ์ที่ต้องการ (เช่น test.s)