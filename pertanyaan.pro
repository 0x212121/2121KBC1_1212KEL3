facts
nondeterm pertanyaan(integer, string, char)

clauses
pertanyaan(1,"Samarinda adalah ibukota Kalimantan Timur",'y').
pertanyaan(2,"Afganistan berada di benua Eropa",'t').
pertanyaan(3,"Banjarmasin adalah ibukota Kalimantan Selatan",'y').
pertanyaan(4,"Kuching adalah ibukota negara Malaysia",'t').
pertanyaan(5,"Surabaya adalah ibukota Jawa Timur",'y').
pertanyaan(6,"Alat musik gamelan berasal dari Jakarta",'t').
pertanyaan(7,"Makassar adalah ibukota Sulawesi Selatan",'y').
pertanyaan(8,"Tanahgrogot adalah salah satu kota di provinsi Kalimantan Tengah",'t').
pertanyaan(9,"Semarang adalah ibukota Jawa Tengah",'y').
pertanyaan(10,"Riyadh adalah ibukota negara Mesir",'t').
pertanyaan(11,"Tari Perang berasal dari Kalimantan Timur",'y').
pertanyaan(12,"Universitas Oxford berada di Finlandia",'t').
pertanyaan(13,"Samarinda dijuluki sebagai Kota Tepian",'y').
pertanyaan(14,"Barack Obama adalah presiden Amerika serikat terbaru",'t').
pertanyaan(15,"Pendiri GO-JEK adalah Nadiem Makarim",'y').
pertanyaan(16,"Pendiri Facebook adalah Larry Pages",'t').
pertanyaan(17,"Pendiri Facebook adalah Mark Zuckerberg",'y').
pertanyaan(18,"Jembatan Ampera terletak di Sumatra Utara",'t').
pertanyaan(19,"Ibukota negara Inggris adalah London",'y').
pertanyaan(20,"Ibukota negara Filipina adalah Phnom Pehn",'t').

goal
save("word.mtr"),
write("Berhasil menyimpan word.mtr"),nl,
write("%temp%"),nl.