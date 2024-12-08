uses crt,math;

label 
1;

type 
    rec_nasabah = record
    nama : string;
    umur : integer;
    ttl  : string;
    alamat: string;
    pekerjaan : string;
end;
    rec_kpr = record
    rumah : double;
    muka : longint;
    tenor: integer;
    bunga: real;
end;
    rec_oto = record
    opsi : string;
    harga : double ;
    dp : integer;
    tenor : real;
    bunga : real;
end;
    rec_umum = record
    pinjam : extended;
    lama : real ;
    bunga : real;
end;

const
max = 100;

var
pilih,i,n,a,jlh,opsi2 : integer;
nasabah : array [1..max] of rec_nasabah; 
data_kpr : rec_kpr;
opsi : char;
oto : rec_oto;
umum : rec_umum;

// batas variabel

function hitung1(a : double ; b : longint ; c : real ) : double; //perhitungan daftar no 1
var
sb,x,y,dp,pp,hasil: extended;
waktu : integer;
begin
    DP := A * 0.2;
    pp := A - DP;
    sb := (c/100)/12 ;
    waktu := b * 12;

    x := (1 + sb) ;
    y := power (x,waktu);

    hasil := (pp * sb * y) / (y -1);
    
    hitung1 := hasil;
end;


procedure kpr; //menu 2 no 1
var
dp : double;
begin
    clrscr;
    write('INPUT HARGA RUMAH : '); readln(data_kpr.rumah);
    write('INPUT TENOR RUMAH (TAHUN) : '); readln(data_kpr.tenor);
    write('INPUT SUKU BUNGA TAHUNAN (TETAP) :      %'); 
    gotoXY (36,3) ; readln(data_kpr.bunga);

    dp := (20/100) * data_kpr.rumah ;

    writeln;
    writeln('Uang Muka (20% dari Harga Rumah) : Rp.',DP:0:0);
    writeln('Cicilan Anda Perbulan Sebanyak   : Rp.',hitung1(data_kpr.rumah,data_kpr.tenor,data_kpr.bunga):0:0);
end;


procedure otomotif; //menu 2 no 2
var
dp,pk,tb,total,tenor,totalTB: real;
begin
    clrscr;

    write('Silahkan Input Jenis Kendaraan (Motor/Mobil) : ');
    readln(oto.opsi);

    oto.opsi := lowercase(oto.opsi);
    clrscr;

    if (oto.opsi = 'mobil') then
    begin
        write('INPUT HARGA          : '); readln(oto.harga);
        write('INPUT TENOR (TAHUN)  : '); readln(oto.tenor);
        write('INPUT DP (%)         : '); readln(oto.dp);
        write('INPUT SUKU BUNGA (%) : '); readln(oto.bunga);

        dp := (oto.dp/100) * oto.harga;
        PK := oto.harga - dp;
        TB := PK * (oto.bunga/100);
        totalTB := TB * oto.tenor;
        tenor := oto.tenor * 12;
        TOTAL := (PK + totalTB) / (tenor);

        writeln;
       writeln('Total Bunga                           : Rp.',totalTB:0:0);
        writeln('Angsuran ',oto.opsi,' anda per bulan sebesar : Rp.',total:0:0);
    end

    else if (oto.opsi = 'motor') then
    begin
        write('INPUT HARGA          : '); readln(oto.harga);
        write('INPUT TENOR (BULAN)  : '); readln(oto.tenor);
        write('INPUT DP (%)         : '); readln(oto.dp);
        write('INPUT SUKU BUNGA (%) : '); readln(oto.bunga);

        dp := (oto.dp/100) * oto.harga;
        PK := oto.harga - dp;
        TB := (PK * ((oto.bunga/100)/12) * oto.tenor);
        TOTAL := (PK + TB) / (oto.tenor);

        writeln;
        writeln('Total Bunga                           : Rp.',TB:0:0);
        writeln('Angsuran ',oto.opsi,' anda per bulan sebesar : Rp.',total:0:0);  
    end

    else
    begin
    writeln('Jenis Kendaraan Tidak Valid');
    end;
end;


function hitungku(a : double ; b,c : real) : extended; //perhitungan menu 2 no 3
var
total_bunga,pokok_bulan,akumulasi : extended;
begin
    total_bunga := ((a * (c/100)) * b) / (b * 12);
    pokok_bulan := (a / (b*12));
    akumulasi := (total_bunga + pokok_bulan) ;

    hitungku := akumulasi;
end;


procedure KU;  // menu 2 no 3
begin
    clrscr;
    write('Masukkan Jumlah Pinjaman          : '); readln(umum.pinjam);
    write('Masukkan Lama Pinjaman (TAHUN)    : '); readln(umum.lama);
    write('Masukkan Suku Bunga FLAT (TAHUN)  :      %'); 
    gotoXY (37,3) ; readln(umum.bunga);

    writeln;
    writeln('Cicilan anda perbulan : Rp.',hitungku(umum.pinjam,umum.lama,umum.bunga):0:0);
end;


procedure data_diri(a : integer); // menu 2 no 4
var
i : integer;
begin
    clrscr;
    for i := 1 to a do 
    begin
        writeln('NAMA      : ',nasabah[i].nama);
        writeln('UMUR      : ',nasabah[i].umur);
        writeln('TTL       : ',nasabah[i].ttl);
        writeln('ALAMAT    : ',nasabah[i].alamat);
        writeln('PEKERJAAN : ',nasabah[i].pekerjaan);

        writeln;
    end;
    
end;


// MAIN PROGRAM

begin
    clrscr;

    1 :
    clrscr;

    writeln('=========== SELAMAT DATANG ============  ');
    writeln('=======================================  ');
    writeln('|| KODE ||         DAFTAR ISI        ||');
    writeln('=======================================');
    writeln('||   1  || Pencatatan Nasabah        ||');
    writeln('||   2  || Data dan Kalkutor Kredit  ||');
    writeln('||   3  || Exit                      ||');
    writeln('=======================================');
    write(' SILAHKAN INPUT KODE ISI : ');
    readln(opsi2);

    a := 1;
        
    clrscr;

    case opsi2 of 

    1: // MENU NO 1
    begin 

        write('Input banyak nasabah : '); readln(n);
        writeln;

        for i := a to n do 
        begin
            jlh := jlh + 1;

            writeln('DATA NASABAH KE ',i);
            write('NAMA      : '); readln(nasabah[jlh].nama);
            write('UMUR      : '); readln(nasabah[jlh].umur);
            write('TTL       : '); readln(nasabah[jlh].ttl);
            write('ALAMAT    : '); readln(nasabah[jlh].alamat);
            write('PEKERJAAN : '); readln(nasabah[jlh].pekerjaan);
            writeln;
        end;

    a := n;

    end;


    2: // MENU NO 2
    begin
    

        repeat 
                clrscr;
                writeln('=======================================');
                writeln('|| KODE ||         DAFTAR ISI        ||');
                writeln('=======================================');
                writeln('||  1   || KREDIT PEMILIKAN RUMAH    ||');
                writeln('||  2   || KREDIT OTOMOTIF           ||');
                writeln('||  3   || KREDIT PINJAMAN UMUM      ||');
                writeln('||  4   || DATA NASABAH              ||');
                writeln('||  5   || BACK                      ||');
                writeln('=======================================');
                writeln('|| SILAHKAN INPUT KODE ISI :         ||'); 
                writeln('=======================================');

                gotoXY (32,10) ; readln(pilih);
                
                clrscr;

                case pilih of
                1:
                kpr;
                2: 
                otomotif;
                3:
                ku;
                4:
                data_diri(jlh);
                5:
                break;
                else
                writeln('SILAHKAN INPUT DAFTAR DENGAN BENAR (1-5) !');
                end;

                writeln;
                writeln('APAKAH ANDA INGIN KELUAR DARI MENU INI (Y/N) ? '); readln(opsi);
                opsi := upcase(opsi);
        
        until (opsi = 'Y');

        end;
    
    3 : 
    begin
    writeln('Terima Kasih Sudah Menggunakan Program Ini');
    halt;
    end;
    
    else
    writeln('SILAHKAN INPUT DAFTAR DENGAN BENAR (1-2)');
    readln;
    end;

    goto 1;
end.