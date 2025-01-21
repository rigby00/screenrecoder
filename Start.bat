@echo off
:: Belgeler klasîrÅnÅn yolunu al
set "belgeler=%USERPROFILE%\Documents\VideoRecords"

:: Klasîr kontrolÅ ve oluüturma
if not exist "%belgeler%" (
    mkdir "%belgeler%"
)

:: Tarih ve saat deßiükenlerini oluütur
for /f "tokens=2-4 delims=/. " %%a in ('date /t') do set tarih=%%a_%%b_%%c
for /f "tokens=1-3 delims=:. " %%a in ('echo %time%') do set saatDakikaSaniye=%%a_%%b_%%c

:: Fazlalçklarç temizle ve dÅzenli format oluütur
set tarih=%tarih:.=_%
set saatDakikaSaniye=%saatDakikaSaniye: =%

:: Dosya adçnç oluütur
set dosyaAdi=%belgeler%\Kayit_%tarih%-%saatDakikaSaniye%.mp4

:: FFmpeg komutunu áalçütçr
ffmpeg -f gdigrab -framerate 30 -i desktop -f dshow -i audio="Stereo Karçüçmç (Realtek(R) Audio)" -c:v libx264 -preset ultrafast -pix_fmt yuv420p -crf 18 -c:a aac -b:a 192k -filter:a "volume=4.0" -y "%dosyaAdi%"

echo Kayçt tamamlandç. Dosya adç: %dosyaAdi%
pause