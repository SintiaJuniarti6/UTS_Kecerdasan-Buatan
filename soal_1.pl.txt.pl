% Fakta gejala
gejala(daun_menguning).
gejala(bercak_hitam).
gejala(daun_berlubang).
gejala(tanaman_layu).

% Untuk menyimpan gejala yang ditemukan
:- dynamic gejala_ditemukan/1.

% Aturan hama berdasarkan gejala
hama(jamur) :-
    gejala_ditemukan(daun_menguning),
    gejala_ditemukan(bercak_hitam).

hama(ulat) :-
    gejala_ditemukan(daun_berlubang).

hama(bakteri) :-
    gejala_ditemukan(tanaman_layu),
    gejala_ditemukan(daun_menguning).

hama(virus) :-
    gejala_ditemukan(tanaman_layu),
    gejala_ditemukan(bercak_hitam).

% Diagnosa Hama
diagnosa_gejala(ListGejala, Hama) :-
    retractall(gejala_ditemukan(_)),   % Hapus gejala lama
    masukkan_gejala(ListGejala),       % Masukkan gejala baru
    ( hama(Hama) -> true ; Hama = tidak_diketahui ).

% Masukkan semua gejala ke database sementara
masukkan_gejala([]).
masukkan_gejala([G|Gs]) :-
    assertz(gejala_ditemukan(G)),
    masukkan_gejala(Gs).
