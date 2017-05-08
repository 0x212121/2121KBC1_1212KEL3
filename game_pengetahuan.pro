domains
number, limit, nim = integer
list = string*
nama = orang(symbol,symbol)

facts
nondeterm pertanyaan(integer, string, char, char)

predicates
nondeterm mulai
nondeterm credit
nondeterm rand_int(number,limit)
nondeterm pilih(char)
nondeterm game_stat(integer,integer,char,char,char)
nondeterm printlist(list)
nondeterm cetak_orang(nama)
nondeterm validasi(char)
nondeterm input_nama

clauses
% --- Credit --- %
credit:-
	write("========================================================================\n"),
	write("\t\t-------------------------CREATED BY KELOMPOK 3-------------------------"),nl,
	printlist([
	"\t\t\t1. ARIF FAHRIZAL		[1515015102]",
	"\t\t\t2. DONI AHMAD		[1515015104]",
	"\t\t\t3. INDRA WIJAYA		[1515015121]"
	]),
	write("\t\t------------------------------------------------------------------------------------------------"),nl.

% --- Input Nama --- %
input_nama:-
	write("\nMasukkan nama depan : "),readln(Ndepan),
	write("Masukkan nama belakang : "),readln(Nbelakang),
	write("\nSelamat Datang "),
	cetak_orang(orang(Ndepan,Nbelakang)),
	write(" di Game UJI PENGETAHUAN \n").

% --- Menu Utama --- %
mulai:-
	write("\n==========================================================================\n"),
	write("\t\t\tUJI PENGETAHUANMU!\n"),
	write("==========================================================================\n"),
	write("\t\t\t1. Mulai Permainan\n\t\t\t2. Cara Bermain\n\t\t\t3. Credits\n\t\t\t4. Keluar\n\t\t\tMasukkan Pilihan! "),
	readchar(Chosen),write(Chosen),nl,nl,pilih(Chosen).
	
% --- Game --- %
% Acak Pertanyaan %
rand_int(Hasil,Max):-	
	random(Real), 
	Hasil=Real*Max+1.
	
% Cetak List %
printlist([]).
printlist([H|T]):-
	write(H),nl,
	printlist(T).

% Kesempatan dan skor %
% Jika kesempatan sisa 1 %
game_stat(1,Count,Ans,Kc1,Kc2):-
	% Jika jawaban salah %
	Ans <> Kc1, Ans <> Kc2, write("\nJawaban anda salah"), 
	Score=Count*10, nl,nl,nl,
	write("Game Over, Skor anda : ",Score).
	
	/*% Jika jawaban benar %
	Ans = Kc1, Counts=Count+1, Score=Counts*10,
	nl,write("Score sementara : ",Score),nl,
	rand_int(RandInt,60),pertanyaan(RandInt,Words,Words1,Words2),
	write("\n======================================================================================\n"),
	write("\t\t\t",Words),nl,
	write("\n======================================================================================\n"),
	write("Masukkan jawaban (y/t) "),readchar(Jwb),write(Jwb),validasi(Jwb),
	game_stat(1,Counts,Jwb,Words1,Words2);
	
	Ans = Kc2, Counts=Count+1, Score=Counts*10,
	nl,write("Score sementara : ",Score),nl,
	rand_int(RandInt,60),pertanyaan(RandInt,Words,Words1,Words2),
	write("\n======================================================================================\n"),
	write("\t\t\t",Words),nl,
	write("\n======================================================================================\n"),
	write("Masukkan jawaban (y/t) "),readchar(Jwb),write(Jwb),validasi(Jwb),
	game_stat(1,Counts,Jwb,Words1,Words2).*/
	
% Jika kesempatan lebih dari 1 %
game_stat(Life,Count,Ans,Kc1,Kc2):-
	% Jika jawaban benar %
	Ans = Kc1, Counts=Count+1, Score=Counts*10,nl,
	write("Jawaban Anda benar \nScore sementara : ",Score),
	rand_int(RandInt,60),pertanyaan(RandInt,Words,Words1,Words2),
	write("\n======================================================================================\n"),
	write("\t\t\t",Words),nl,
	write("\n======================================================================================\n"),
	write("Masukkan jawaban (y/t) "),readchar(Jwb),write(Jwb),validasi(Jwb),
	game_stat(Life,Counts,Jwb,Words1,Words2);
	
	Ans = Kc2, Counts=Count+1, Score=Counts*10,
	nl,write("Score sementara : ",Score),nl,
	rand_int(RandInt,60),pertanyaan(RandInt,Words,Words1,Words2),
	write("\n======================================================================================\n"),
	write("\t\t\t",Words),nl,
	write("\n======================================================================================\n"),
	write("Masukkan jawaban (y/t) "),readchar(Jwb),write(Jwb),validasi(Jwb),
	game_stat(Life,Counts,Jwb,Words1,Words2);
	
	% Jika jawaban salah %
	Ans <> Kc1, Ans <> Kc2, Score=Count*10, Lifes=Life-1,nl,
	write("Jawaban Anda salah \nScore sementara : ",Score,"\nMasih ada ",Lifes," Kesempatan tersisa Maksimalkan sebaik mungkin\n"),
	rand_int(RandInt,60),pertanyaan(RandInt,Words,Words1,Words2),
	write("\n======================================================================================\n"),
	write("\t\t\t",Words),nl,
	write("\n======================================================================================\n"),
	write("Masukkan jawaban (y/t) "),readchar(Jwb),write(Jwb),validasi(Jwb),	
	game_stat(Lifes,Count,Jwb,Words1,Words2),mulai.
	
cetak_orang(orang(Pertama,Kedua)):-  
	write(Pertama," ",Kedua).	
% Validasi %
validasi(Input):-
	Input = 'y'; Input = 'Y'; Input = 't'; Input = 'T',fail;
	write("\nMasukkan jawaban y jika benar dan t jika salah jika masih belum terlalu paham silahkan melihat Cara Bermain terlebih dahulu\n"),mulai.		
	
% --- Pilihan Menu--- %
pilih(P):-
P='1',	
	Lifes=3,
	rand_int(RandInt,60), 
	write("\n======================================================================================\n"),
	pertanyaan(RandInt,Words,Words1,Words2),
	write("\t\t\t",Words),nl,
	write("\n======================================================================================\n"),
	write("Masukkan jawaban (y/t) "),readchar(Tk),write(Tk),validasi(Tk),
	game_stat(Lifes,0,Tk,Words1,Words2);

P='2',
	write("==========================================================================\n"),
	write("\t\t\tTUTORIAL BERMAIN\n"),
	write("==========================================================================\n"),
	printlist([
	"1. Cara menebak jawaban benar atau salah, bisa dengan menekan 'y' jika jawaban benar atau 't' jika jawaban salah",
	"2. Permainan ini memiliki 3 kali kesempatan, dimana jika pernyataan mu salah, maka kesempatan akan berkurang 1",
	"3. Jika pernyataanmu benar, akan mendapatkan score sebesar 10 poin, maka raih setinggi-tingginya score"
	]),
	mulai;

P='3',
	credit,
	mulai;
	
P='4',	
	write("==========================================================================\n"),
	write("\t\tTERIMA KASIH TELAH MENCOBA GAME KAMI. \n"),
	write("==========================================================================\n");	

P<>'1',P<>'2',P<>'3',P<>'4',
	write("\nPilihan yang anda masukkan tidak tersedia, Silahkan masukkan pilihan yang lain\n "),mulai.
	
goal
input_nama,
consult("kata.mtr"),
mulai.