.model small
.code
org 100h
start:
    jmp mulai
nama        db 13,10,'Nama orang yang merental ps : $'
nomor       db 13,10,'Nomor yang bisa dihubungi : $'
lanjut      db 13,10,'Lanjut tekan y untuk lanjut >>>>>>>>>>>>> $'
tampung_nama        db 30,?,30 dup(?)
tampung_nomor       db 13,?,13 dup(?)

a db 01
b db 02
c db 03
d db 04
e db 05
f db 06
j dw 15

daftar	db 13,10,'+-----------------------------------------------+'
		db 13,10,'+-------DAFTAR HARGA PS PERJAM------------------+'
		db 13,10,'+-----------------------------------------------+'
		db 13,10,'|   PS 4 PERJAM     |        HARGA              |'
		db 13,10,'+--+--------------------------------------------+'
		db 13,10,'|01|    1 JAM       |      Rp.12.000            |'
		db 13,10,'+--+--------------------------------------------+'
		db 13,10,'|02|    2 JAM       |      Rp.22.000            |'
		db 13,10,'+--+----------------+---------------------------+'
		db 13,10,'|03|    3 JAM       |      Rp.34.000            |'
		db 13,10,'+--+----------------+---------------------------+'
		db 13,10,'|04|    4 JAM       |      Rp.46.000            |'
		db 13,10,'+--+----------------+---------------------------+','$'




error       db 13,10,'tipe yang anda masukkan belum tersedia/salah $'
pilih_spt   db 13,10,'Silahkan pilih berapa jam anda ingin bermain : $'
succes      db 13,10,'Selamat anda berhasil $'

mulai:
	mov ah,09h
	lea dx,nama
	int 21h
	mov ah,0ah
	lea dx,tampung_nama
	int 21h
	push dx

	mov ah,09h
	lea dx,nomor
	int 21h
	mov ah,0ah
	lea dx,tampung_nomor
	int 21h
	push dx

	mov ah,09h
	mov dx,offset daftar
	int 21h
	mov ah,09h
	mov dx,offset lanjut
	int 21h
	mov ah,01h
	int 21h
	cmp al,'y'
	je proses
	jne error_nsg

error_nsg:
    mov ah,09h
    mov dx,offset error
    int 21h
    int 20h

proses:
    mov ah,09h
    mov dx,offset pilih_spt
    int 21h

    mov ah,1
    int 21h
    mov bh,al
    mov ah,1
    int 21h
    mov bl,al
    cmp bh,'0'
    cmp bl,'1'
    je hasil1

    cmp bh,'0'
    cmp bl,'2'
    je hasil2


    cmp bh,'0'
    cmp bl,'3'
    je hasil3


    cmp bh,'0'
    cmp bl,'4'
    je hasil4


;--------------------------------------------------------------------------

hasil1:
    mov ah,09h
    lea dx,teks1
    int 21h
    int 20h

hasil2:
    mov ah,09h
    lea dx,teks2
    int 21h
    int 20h

hasil3:
    mov ah,09h
    lea dx,teks3
    int 21h
    int 20h

hasil4:
    mov ah,09h
    lea dx,teks4
    int 21h
    int 20h

;--------------------------------------------------------------------------

teks1		db 13,10,'                                       '
		db 13,10,'ANDA BERMAIN PS 4 SELAMA 1 JAM'
		db 13,10,'Total harga yang harus anda bayar : Rp 12.000'
		db 13,10,'TerimaKasih sudah mampir di rental ps kami $'

teks2		db 13,10,'                                       '
		db 13,10,'ANDA BERMAIN PS 4 SELAMA 2 JAM'
		db 13,10,'Total harga yang harus anda bayar : Rp 22.000'
		db 13,10,'TerimaKasih sudah mampir di rental ps kami$' 

teks3		db 13,10,'                                       '
		db 13,10,'ANDA BERMAIN PS 4 SELAMA 3 JAM'
		db 13,10,'Total harga yang harus anda bayar : Rp 34.000'
		db 13,10,'TerimaKasih sudah mampir di rental ps kami $' 

teks4		db 13,10,'                                       '
		db 13,10,'ANDA BERMAIN PS 4 SELAMA 4 JAM'
		db 13,10,'Total harga yang harus anda bayar : Rp 46.000'
		db 13,10,'TerimaKasih sudah mampir di rental ps kami $' 

end start