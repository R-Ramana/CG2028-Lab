   1              		.syntax unified
   2              		.cpu cortex-m3
   3              		.fpu softvfp
   4              		.eabi_attribute 20, 1
   5              		.eabi_attribute 21, 1
   6              		.eabi_attribute 23, 3
   7              		.eabi_attribute 24, 1
   8              		.eabi_attribute 25, 1
   9              		.eabi_attribute 26, 1
  10              		.eabi_attribute 30, 6
  11              		.eabi_attribute 34, 1
  12              		.eabi_attribute 18, 4
  13              		.thumb
  14              		.file	"main.c"
  15              		.text
  16              	.Ltext0:
  17              		.cfi_sections	.debug_frame
  18              		.section	.rodata
  19              		.align	2
  20              	.LC1:
  21 0000 61736D3A 		.ascii	"asm: i = %d, y_n = %d, \012\000"
  21      2069203D 
  21      2025642C 
  21      20795F6E 
  21      203D2025 
  22 0019 000000   		.align	2
  23              	.LC2:
  24 001c 4320203A 		.ascii	"C  : i = %d, y_n = %d, \012\000"
  24      2069203D 
  24      2025642C 
  24      20795F6E 
  24      203D2025 
  25 0035 000000   		.align	2
  26              	.LC0:
  27 0038 64000000 		.word	100
  28 003c E6000000 		.word	230
  29 0040 18010000 		.word	280
  30 0044 9A010000 		.word	410
  31 0048 1C020000 		.word	540
  32 004c 58020000 		.word	600
  33 0050 E0010000 		.word	480
  34 0054 86010000 		.word	390
  35 0058 FA000000 		.word	250
  36 005c A0000000 		.word	160
  37 0060 64000000 		.word	100
  38 0064 54010000 		.word	340
  39              		.section	.text.main,"ax",%progbits
  40              		.align	2
  41              		.global	main
  42              		.thumb
  43              		.thumb_func
  45              	main:
  46              	.LFB0:
  47              		.file 1 "../src/main.c"
   1:../src/main.c **** #include "stdio.h"
   2:../src/main.c **** #define N_MAX 10
   3:../src/main.c **** #define X_SIZE 12
   4:../src/main.c **** 
   5:../src/main.c **** 
   6:../src/main.c **** // CG2028 Assignment, Sem 2, AY 2020/21
   7:../src/main.c **** // (c) CG2028 Teaching Team, ECE NUS, 2021
   8:../src/main.c **** 
   9:../src/main.c **** extern int iir(int N, int* b, int* a, int x_n); // asm implementation
  10:../src/main.c **** int iir_c(int N, int* b, int* a, int x_n); // reference C implementation
  11:../src/main.c **** 
  12:../src/main.c **** int main(void)
  13:../src/main.c **** {
  48              		.loc 1 13 0
  49              		.cfi_startproc
  50              		@ args = 0, pretend = 0, frame = 144
  51              		@ frame_needed = 1, uses_anonymous_args = 0
  52 0000 B0B5     		push	{r4, r5, r7, lr}
  53              	.LCFI0:
  54              		.cfi_def_cfa_offset 16
  55              		.cfi_offset 14, -4
  56              		.cfi_offset 7, -8
  57              		.cfi_offset 5, -12
  58              		.cfi_offset 4, -16
  59 0002 A4B0     		sub	sp, sp, #144
  60              	.LCFI1:
  61              		.cfi_def_cfa_offset 160
  62 0004 00AF     		add	r7, sp, #0
  63              	.LCFI2:
  64              		.cfi_def_cfa_register 7
  14:../src/main.c **** 	//variables
  15:../src/main.c **** 	int i;
  16:../src/main.c **** 	int N = 8;
  65              		.loc 1 16 0
  66 0006 4FF00803 		mov	r3, #8
  67 000a C7F88830 		str	r3, [r7, #136]
  17:../src/main.c **** 	// think of the values below as numbers of the form y.yy (floating point with 2 digits precision)
  18:../src/main.c **** 	// which are scaled up to allow them to be used integers
  19:../src/main.c **** 	// within the iir function, we divide y by 100 (decimal) to scale it down
  20:../src/main.c **** 	int b[N_MAX+1] = {100, 250, 360, 450, 580, 690, 710, 820, 900, 1030}; //N+1 dimensional feedforwar
  68              		.loc 1 20 0
  69 000e 07F15C03 		add	r3, r7, #92
  70 0012 4FF00002 		mov	r2, #0
  71 0016 1A60     		str	r2, [r3, #0]
  72 0018 03F10403 		add	r3, r3, #4
  73 001c 4FF00002 		mov	r2, #0
  74 0020 1A60     		str	r2, [r3, #0]
  75 0022 03F10403 		add	r3, r3, #4
  76 0026 4FF00002 		mov	r2, #0
  77 002a 1A60     		str	r2, [r3, #0]
  78 002c 03F10403 		add	r3, r3, #4
  79 0030 4FF00002 		mov	r2, #0
  80 0034 1A60     		str	r2, [r3, #0]
  81 0036 03F10403 		add	r3, r3, #4
  82 003a 4FF00002 		mov	r2, #0
  83 003e 1A60     		str	r2, [r3, #0]
  84 0040 03F10403 		add	r3, r3, #4
  85 0044 4FF00002 		mov	r2, #0
  86 0048 1A60     		str	r2, [r3, #0]
  87 004a 03F10403 		add	r3, r3, #4
  88 004e 4FF00002 		mov	r2, #0
  89 0052 1A60     		str	r2, [r3, #0]
  90 0054 03F10403 		add	r3, r3, #4
  91 0058 4FF00002 		mov	r2, #0
  92 005c 1A60     		str	r2, [r3, #0]
  93 005e 03F10403 		add	r3, r3, #4
  94 0062 4FF00002 		mov	r2, #0
  95 0066 1A60     		str	r2, [r3, #0]
  96 0068 03F10403 		add	r3, r3, #4
  97 006c 4FF00002 		mov	r2, #0
  98 0070 1A60     		str	r2, [r3, #0]
  99 0072 03F10403 		add	r3, r3, #4
 100 0076 4FF00002 		mov	r2, #0
 101 007a 1A60     		str	r2, [r3, #0]
 102 007c 03F10403 		add	r3, r3, #4
 103 0080 4FF06403 		mov	r3, #100
 104 0084 FB65     		str	r3, [r7, #92]
 105 0086 4FF0FA03 		mov	r3, #250
 106 008a 3B66     		str	r3, [r7, #96]
 107 008c 4FF4B473 		mov	r3, #360
 108 0090 7B66     		str	r3, [r7, #100]
 109 0092 4FF4E173 		mov	r3, #450
 110 0096 BB66     		str	r3, [r7, #104]
 111 0098 4FF41173 		mov	r3, #580
 112 009c FB66     		str	r3, [r7, #108]
 113 009e 40F2B223 		movw	r3, #690
 114 00a2 3B67     		str	r3, [r7, #112]
 115 00a4 40F2C623 		movw	r3, #710
 116 00a8 7B67     		str	r3, [r7, #116]
 117 00aa 4FF44D73 		mov	r3, #820
 118 00ae BB67     		str	r3, [r7, #120]
 119 00b0 4FF46173 		mov	r3, #900
 120 00b4 FB67     		str	r3, [r7, #124]
 121 00b6 40F20643 		movw	r3, #1030
 122 00ba C7F88030 		str	r3, [r7, #128]
  21:../src/main.c **** 	int a[N_MAX+1] = {100, 120, 180, 230, 250, 340, 260, 130, 140, 80}; //N+1 dimensional feedback
 123              		.loc 1 21 0
 124 00be 07F13003 		add	r3, r7, #48
 125 00c2 4FF00002 		mov	r2, #0
 126 00c6 1A60     		str	r2, [r3, #0]
 127 00c8 03F10403 		add	r3, r3, #4
 128 00cc 4FF00002 		mov	r2, #0
 129 00d0 1A60     		str	r2, [r3, #0]
 130 00d2 03F10403 		add	r3, r3, #4
 131 00d6 4FF00002 		mov	r2, #0
 132 00da 1A60     		str	r2, [r3, #0]
 133 00dc 03F10403 		add	r3, r3, #4
 134 00e0 4FF00002 		mov	r2, #0
 135 00e4 1A60     		str	r2, [r3, #0]
 136 00e6 03F10403 		add	r3, r3, #4
 137 00ea 4FF00002 		mov	r2, #0
 138 00ee 1A60     		str	r2, [r3, #0]
 139 00f0 03F10403 		add	r3, r3, #4
 140 00f4 4FF00002 		mov	r2, #0
 141 00f8 1A60     		str	r2, [r3, #0]
 142 00fa 03F10403 		add	r3, r3, #4
 143 00fe 4FF00002 		mov	r2, #0
 144 0102 1A60     		str	r2, [r3, #0]
 145 0104 03F10403 		add	r3, r3, #4
 146 0108 4FF00002 		mov	r2, #0
 147 010c 1A60     		str	r2, [r3, #0]
 148 010e 03F10403 		add	r3, r3, #4
 149 0112 4FF00002 		mov	r2, #0
 150 0116 1A60     		str	r2, [r3, #0]
 151 0118 03F10403 		add	r3, r3, #4
 152 011c 4FF00002 		mov	r2, #0
 153 0120 1A60     		str	r2, [r3, #0]
 154 0122 03F10403 		add	r3, r3, #4
 155 0126 4FF00002 		mov	r2, #0
 156 012a 1A60     		str	r2, [r3, #0]
 157 012c 03F10403 		add	r3, r3, #4
 158 0130 4FF06403 		mov	r3, #100
 159 0134 3B63     		str	r3, [r7, #48]
 160 0136 4FF07803 		mov	r3, #120
 161 013a 7B63     		str	r3, [r7, #52]
 162 013c 4FF0B403 		mov	r3, #180
 163 0140 BB63     		str	r3, [r7, #56]
 164 0142 4FF0E603 		mov	r3, #230
 165 0146 FB63     		str	r3, [r7, #60]
 166 0148 4FF0FA03 		mov	r3, #250
 167 014c 3B64     		str	r3, [r7, #64]
 168 014e 4FF4AA73 		mov	r3, #340
 169 0152 7B64     		str	r3, [r7, #68]
 170 0154 4FF48273 		mov	r3, #260
 171 0158 BB64     		str	r3, [r7, #72]
 172 015a 4FF08203 		mov	r3, #130
 173 015e FB64     		str	r3, [r7, #76]
 174 0160 4FF08C03 		mov	r3, #140
 175 0164 3B65     		str	r3, [r7, #80]
 176 0166 4FF05003 		mov	r3, #80
 177 016a 7B65     		str	r3, [r7, #84]
  22:../src/main.c **** 	int x[X_SIZE] = {100, 230, 280, 410, 540, 600, 480, 390, 250, 160, 100, 340};
 178              		.loc 1 22 0
 179 016c 40F20003 		movw	r3, #:lower16:.LC0
 180 0170 C0F20003 		movt	r3, #:upper16:.LC0
 181 0174 3C46     		mov	r4, r7
 182 0176 1D46     		mov	r5, r3
 183 0178 0FCD     		ldmia	r5!, {r0, r1, r2, r3}
 184 017a 0FC4     		stmia	r4!, {r0, r1, r2, r3}
 185 017c 0FCD     		ldmia	r5!, {r0, r1, r2, r3}
 186 017e 0FC4     		stmia	r4!, {r0, r1, r2, r3}
 187 0180 95E80F00 		ldmia	r5, {r0, r1, r2, r3}
 188 0184 84E80F00 		stmia	r4, {r0, r1, r2, r3}
  23:../src/main.c **** 
  24:../src/main.c **** 	// Call assembly language function iir for each element of x
  25:../src/main.c **** 	for (i=0; i<X_SIZE; i++)
 189              		.loc 1 25 0
 190 0188 4FF00003 		mov	r3, #0
 191 018c C7F88C30 		str	r3, [r7, #140]
 192 0190 3DE0     		b	.L2
 193              	.L3:
  26:../src/main.c **** 	{
  27:../src/main.c **** 		printf( "asm: i = %d, y_n = %d, \n", i, iir(N, b, a, x[i]) ) ;
 194              		.loc 1 27 0 discriminator 2
 195 0192 40F20004 		movw	r4, #:lower16:.LC1
 196 0196 C0F20004 		movt	r4, #:upper16:.LC1
 197 019a D7F88C30 		ldr	r3, [r7, #140]
 198 019e 4FEA8303 		lsl	r3, r3, #2
 199 01a2 07F19002 		add	r2, r7, #144
 200 01a6 D318     		adds	r3, r2, r3
 201 01a8 53F8903C 		ldr	r3, [r3, #-144]
 202 01ac 07F15C01 		add	r1, r7, #92
 203 01b0 07F13002 		add	r2, r7, #48
 204 01b4 D7F88800 		ldr	r0, [r7, #136]
 205 01b8 FFF7FEFF 		bl	iir
 206 01bc 0346     		mov	r3, r0
 207 01be 2046     		mov	r0, r4
 208 01c0 D7F88C10 		ldr	r1, [r7, #140]
 209 01c4 1A46     		mov	r2, r3
 210 01c6 FFF7FEFF 		bl	printf
  28:../src/main.c **** 		printf( "C  : i = %d, y_n = %d, \n", i, iir_c(N, b, a, x[i]) ) ;
 211              		.loc 1 28 0 discriminator 2
 212 01ca 40F20004 		movw	r4, #:lower16:.LC2
 213 01ce C0F20004 		movt	r4, #:upper16:.LC2
 214 01d2 D7F88C30 		ldr	r3, [r7, #140]
 215 01d6 4FEA8303 		lsl	r3, r3, #2
 216 01da 07F19002 		add	r2, r7, #144
 217 01de D318     		adds	r3, r2, r3
 218 01e0 53F8903C 		ldr	r3, [r3, #-144]
 219 01e4 07F15C01 		add	r1, r7, #92
 220 01e8 07F13002 		add	r2, r7, #48
 221 01ec D7F88800 		ldr	r0, [r7, #136]
 222 01f0 FFF7FEFF 		bl	iir_c
 223 01f4 0346     		mov	r3, r0
 224 01f6 2046     		mov	r0, r4
 225 01f8 D7F88C10 		ldr	r1, [r7, #140]
 226 01fc 1A46     		mov	r2, r3
 227 01fe FFF7FEFF 		bl	printf
  25:../src/main.c **** 	for (i=0; i<X_SIZE; i++)
 228              		.loc 1 25 0 discriminator 2
 229 0202 D7F88C30 		ldr	r3, [r7, #140]
 230 0206 03F10103 		add	r3, r3, #1
 231 020a C7F88C30 		str	r3, [r7, #140]
 232              	.L2:
  25:../src/main.c **** 	for (i=0; i<X_SIZE; i++)
 233              		.loc 1 25 0 is_stmt 0 discriminator 1
 234 020e D7F88C30 		ldr	r3, [r7, #140]
 235 0212 0B2B     		cmp	r3, #11
 236 0214 BDDD     		ble	.L3
 237              	.L4:
  29:../src/main.c **** 	}
  30:../src/main.c **** 	while (1); //halt
 238              		.loc 1 30 0 is_stmt 1 discriminator 1
 239 0216 FEE7     		b	.L4
 240              		.cfi_endproc
 241              	.LFE0:
 243              		.section	.text.iir_c,"ax",%progbits
 244              		.align	2
 245              		.global	iir_c
 246              		.thumb
 247              		.thumb_func
 249              	iir_c:
 250              	.LFB1:
  31:../src/main.c **** }
  32:../src/main.c **** 
  33:../src/main.c **** int iir_c(int N, int* b, int* a, int x_n)
  34:../src/main.c **** { 	// The implementation below is inefficient and meant only for verifying your results.
 251              		.loc 1 34 0
 252              		.cfi_startproc
 253              		@ args = 0, pretend = 0, frame = 24
 254              		@ frame_needed = 1, uses_anonymous_args = 0
 255              		@ link register save eliminated.
 256 0000 80B4     		push	{r7}
 257              	.LCFI3:
 258              		.cfi_def_cfa_offset 4
 259              		.cfi_offset 7, -4
 260 0002 87B0     		sub	sp, sp, #28
 261              	.LCFI4:
 262              		.cfi_def_cfa_offset 32
 263 0004 00AF     		add	r7, sp, #0
 264              	.LCFI5:
 265              		.cfi_def_cfa_register 7
 266 0006 F860     		str	r0, [r7, #12]
 267 0008 B960     		str	r1, [r7, #8]
 268 000a 7A60     		str	r2, [r7, #4]
 269 000c 3B60     		str	r3, [r7, #0]
  35:../src/main.c **** 
  36:../src/main.c **** 	static int x_store[N_MAX] = {0}; // to store the previous N values of x_n.
  37:../src/main.c **** 	static int y_store[N_MAX] = {0}; // to store the previous values of y_n.
  38:../src/main.c **** 	
  39:../src/main.c **** 	int j;
  40:../src/main.c **** 	int y_n;
  41:../src/main.c **** 
  42:../src/main.c **** 	y_n = x_n*b[0]/a[0];
 270              		.loc 1 42 0
 271 000e BB68     		ldr	r3, [r7, #8]
 272 0010 1B68     		ldr	r3, [r3, #0]
 273 0012 3A68     		ldr	r2, [r7, #0]
 274 0014 02FB03F2 		mul	r2, r2, r3
 275 0018 7B68     		ldr	r3, [r7, #4]
 276 001a 1B68     		ldr	r3, [r3, #0]
 277 001c 92FBF3F3 		sdiv	r3, r2, r3
 278 0020 3B61     		str	r3, [r7, #16]
  43:../src/main.c **** 	
  44:../src/main.c **** 	for (j=0; j<N; j++)
 279              		.loc 1 44 0
 280 0022 4FF00003 		mov	r3, #0
 281 0026 7B61     		str	r3, [r7, #20]
 282 0028 2DE0     		b	.L6
 283              	.L7:
  45:../src/main.c **** 	{
  46:../src/main.c **** 		y_n+=(b[j+1]*x_store[j]-a[j+1]*y_store[j])/a[0];
 284              		.loc 1 46 0 discriminator 2
 285 002a 7B69     		ldr	r3, [r7, #20]
 286 002c 03F10103 		add	r3, r3, #1
 287 0030 4FEA8303 		lsl	r3, r3, #2
 288 0034 BA68     		ldr	r2, [r7, #8]
 289 0036 D318     		adds	r3, r2, r3
 290 0038 1A68     		ldr	r2, [r3, #0]
 291 003a 40F20003 		movw	r3, #:lower16:x_store.3834
 292 003e C0F20003 		movt	r3, #:upper16:x_store.3834
 293 0042 7969     		ldr	r1, [r7, #20]
 294 0044 53F82130 		ldr	r3, [r3, r1, lsl #2]
 295 0048 03FB02F2 		mul	r2, r3, r2
 296 004c 7B69     		ldr	r3, [r7, #20]
 297 004e 03F10103 		add	r3, r3, #1
 298 0052 4FEA8303 		lsl	r3, r3, #2
 299 0056 7968     		ldr	r1, [r7, #4]
 300 0058 CB18     		adds	r3, r1, r3
 301 005a 1968     		ldr	r1, [r3, #0]
 302 005c 40F20003 		movw	r3, #:lower16:y_store.3835
 303 0060 C0F20003 		movt	r3, #:upper16:y_store.3835
 304 0064 7869     		ldr	r0, [r7, #20]
 305 0066 53F82030 		ldr	r3, [r3, r0, lsl #2]
 306 006a 03FB01F3 		mul	r3, r3, r1
 307 006e D21A     		subs	r2, r2, r3
 308 0070 7B68     		ldr	r3, [r7, #4]
 309 0072 1B68     		ldr	r3, [r3, #0]
 310 0074 92FBF3F3 		sdiv	r3, r2, r3
 311 0078 3A69     		ldr	r2, [r7, #16]
 312 007a D318     		adds	r3, r2, r3
 313 007c 3B61     		str	r3, [r7, #16]
  44:../src/main.c **** 	for (j=0; j<N; j++)
 314              		.loc 1 44 0 discriminator 2
 315 007e 7B69     		ldr	r3, [r7, #20]
 316 0080 03F10103 		add	r3, r3, #1
 317 0084 7B61     		str	r3, [r7, #20]
 318              	.L6:
  44:../src/main.c **** 	for (j=0; j<N; j++)
 319              		.loc 1 44 0 is_stmt 0 discriminator 1
 320 0086 7A69     		ldr	r2, [r7, #20]
 321 0088 FB68     		ldr	r3, [r7, #12]
 322 008a 9A42     		cmp	r2, r3
 323 008c CDDB     		blt	.L7
  47:../src/main.c **** 	}
  48:../src/main.c **** 	
  49:../src/main.c **** 	for (j=N-1; j>0; j--)
 324              		.loc 1 49 0 is_stmt 1
 325 008e FB68     		ldr	r3, [r7, #12]
 326 0090 03F1FF33 		add	r3, r3, #-1
 327 0094 7B61     		str	r3, [r7, #20]
 328 0096 23E0     		b	.L8
 329              	.L9:
  50:../src/main.c **** 	{
  51:../src/main.c **** 		x_store[j] = x_store[j-1];
 330              		.loc 1 51 0 discriminator 2
 331 0098 7B69     		ldr	r3, [r7, #20]
 332 009a 03F1FF32 		add	r2, r3, #-1
 333 009e 40F20003 		movw	r3, #:lower16:x_store.3834
 334 00a2 C0F20003 		movt	r3, #:upper16:x_store.3834
 335 00a6 53F82210 		ldr	r1, [r3, r2, lsl #2]
 336 00aa 40F20003 		movw	r3, #:lower16:x_store.3834
 337 00ae C0F20003 		movt	r3, #:upper16:x_store.3834
 338 00b2 7A69     		ldr	r2, [r7, #20]
 339 00b4 43F82210 		str	r1, [r3, r2, lsl #2]
  52:../src/main.c **** 		y_store[j] = y_store[j-1];
 340              		.loc 1 52 0 discriminator 2
 341 00b8 7B69     		ldr	r3, [r7, #20]
 342 00ba 03F1FF32 		add	r2, r3, #-1
 343 00be 40F20003 		movw	r3, #:lower16:y_store.3835
 344 00c2 C0F20003 		movt	r3, #:upper16:y_store.3835
 345 00c6 53F82210 		ldr	r1, [r3, r2, lsl #2]
 346 00ca 40F20003 		movw	r3, #:lower16:y_store.3835
 347 00ce C0F20003 		movt	r3, #:upper16:y_store.3835
 348 00d2 7A69     		ldr	r2, [r7, #20]
 349 00d4 43F82210 		str	r1, [r3, r2, lsl #2]
  49:../src/main.c **** 	for (j=N-1; j>0; j--)
 350              		.loc 1 49 0 discriminator 2
 351 00d8 7B69     		ldr	r3, [r7, #20]
 352 00da 03F1FF33 		add	r3, r3, #-1
 353 00de 7B61     		str	r3, [r7, #20]
 354              	.L8:
  49:../src/main.c **** 	for (j=N-1; j>0; j--)
 355              		.loc 1 49 0 is_stmt 0 discriminator 1
 356 00e0 7B69     		ldr	r3, [r7, #20]
 357 00e2 002B     		cmp	r3, #0
 358 00e4 D8DC     		bgt	.L9
  53:../src/main.c **** 	}
  54:../src/main.c **** 	
  55:../src/main.c **** 	x_store[0] = x_n;
 359              		.loc 1 55 0 is_stmt 1
 360 00e6 40F20003 		movw	r3, #:lower16:x_store.3834
 361 00ea C0F20003 		movt	r3, #:upper16:x_store.3834
 362 00ee 3A68     		ldr	r2, [r7, #0]
 363 00f0 1A60     		str	r2, [r3, #0]
  56:../src/main.c **** 	y_store[0] = y_n;
 364              		.loc 1 56 0
 365 00f2 40F20003 		movw	r3, #:lower16:y_store.3835
 366 00f6 C0F20003 		movt	r3, #:upper16:y_store.3835
 367 00fa 3A69     		ldr	r2, [r7, #16]
 368 00fc 1A60     		str	r2, [r3, #0]
  57:../src/main.c **** 	
  58:../src/main.c **** 	y_n /= 100; // scaling down
 369              		.loc 1 58 0
 370 00fe 3A69     		ldr	r2, [r7, #16]
 371 0100 48F21F53 		movw	r3, #34079
 372 0104 C5F2EB13 		movt	r3, 20971
 373 0108 83FB0213 		smull	r1, r3, r3, r2
 374 010c 4FEA6311 		asr	r1, r3, #5
 375 0110 4FEAE273 		asr	r3, r2, #31
 376 0114 CB1A     		subs	r3, r1, r3
 377 0116 3B61     		str	r3, [r7, #16]
  59:../src/main.c **** 	
  60:../src/main.c **** 	return y_n;
 378              		.loc 1 60 0
 379 0118 3B69     		ldr	r3, [r7, #16]
  61:../src/main.c **** }
 380              		.loc 1 61 0
 381 011a 1846     		mov	r0, r3
 382 011c 07F11C07 		add	r7, r7, #28
 383 0120 BD46     		mov	sp, r7
 384 0122 80BC     		pop	{r7}
 385 0124 7047     		bx	lr
 386              		.cfi_endproc
 387              	.LFE1:
 389 0126 00BF     		.bss
 390              		.align	2
 391              	x_store.3834:
 392 0000 00000000 		.space	40
 392      00000000 
 392      00000000 
 392      00000000 
 392      00000000 
 393              		.align	2
 394              	y_store.3835:
 395 0028 00000000 		.space	40
 395      00000000 
 395      00000000 
 395      00000000 
 395      00000000 
 396              		.text
 397              	.Letext0:
DEFINED SYMBOLS
                            *ABS*:00000000 main.c
C:\Users\raman\AppData\Local\Temp\ccJfXet6.s:19     .rodata:00000000 $d
C:\Users\raman\AppData\Local\Temp\ccJfXet6.s:20     .rodata:00000000 .LC1
C:\Users\raman\AppData\Local\Temp\ccJfXet6.s:23     .rodata:0000001c .LC2
C:\Users\raman\AppData\Local\Temp\ccJfXet6.s:26     .rodata:00000038 .LC0
C:\Users\raman\AppData\Local\Temp\ccJfXet6.s:40     .text.main:00000000 $t
C:\Users\raman\AppData\Local\Temp\ccJfXet6.s:45     .text.main:00000000 main
C:\Users\raman\AppData\Local\Temp\ccJfXet6.s:249    .text.iir_c:00000000 iir_c
C:\Users\raman\AppData\Local\Temp\ccJfXet6.s:244    .text.iir_c:00000000 $t
C:\Users\raman\AppData\Local\Temp\ccJfXet6.s:391    .bss:00000000 x_store.3834
C:\Users\raman\AppData\Local\Temp\ccJfXet6.s:394    .bss:00000028 y_store.3835
C:\Users\raman\AppData\Local\Temp\ccJfXet6.s:390    .bss:00000000 $d
                     .debug_frame:00000010 $d

UNDEFINED SYMBOLS
iir
printf
