@echo off
:: Belgeler klas�r�n�n yolunu al
set "belgeler=%USERPROFILE%\Documents\VideoRecords"

:: Klas�r kontrol� ve olu�turma
if not exist "%belgeler%" (
    mkdir "%belgeler%"
)

:: Tarih ve saat de�i�kenlerini olu�tur
for /f "tokens=2-4 delims=/. " %%a in ('date /t') do set tarih=%%a_%%b_%%c
for /f "tokens=1-3 delims=:. " %%a in ('echo %time%') do set saatDakikaSaniye=%%a_%%b_%%c

:: Fazlal�klar� temizle ve d�zenli format olu�tur
set tarih=%tarih:.=_%
set saatDakikaSaniye=%saatDakikaSaniye: =%

:: Dosya ad�n� olu�tur
set dosyaAdi=%belgeler%\Kayit_%tarih%-%saatDakikaSaniye%.mp4

:: FFmpeg komutunu �al��t�r
ffmpeg -f gdigrab -framerate 30 -i desktop -f dshow -i audio="Stereo Kar���m� (Realtek(R) Audio)" -c:v libx264 -preset ultrafast -pix_fmt yuv420p -crf 18 -c:a aac -b:a 192k -filter:a "volume=4.0" -y "%dosyaAdi%"

echo Kay�t tamamland�. Dosya ad�: %dosyaAdi%
pause