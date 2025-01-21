
# 📹 FFmpeg Screen Recorder

## 🌟 Overview

This project is a **simple**, **lightweight**, and **efficient** tool for screen recording using FFmpeg. It's designed with optimal defaults to produce high-quality video recordings while consuming minimal system resources. Whether you need to record a quick tutorial, gameplay, or a presentation, this script has you covered. 

## ✨ Features

- ✅ **High-Quality Recording**: Records the desktop screen with optimal settings for video quality.
- ✅ **Default Best Practices**: Automatically configured for the best video output using `libx264` codec.
- ✅ **Customizable Frame Rate**: Change the frame rate to 24, 30, or 60 FPS as needed.
- ✅ **Audio Recording**: Captures audio from the default sound device or any custom audio device.
- ✅ **Automatic File Naming**: Saves recordings in the `Documents/VideoRecords` directory with the format `Kayit_Date_Time.mp4`.
- ✅ **User-Friendly**: Minimal configuration required—just run the script and start recording.

---

## 🛠️ How It Works

1. 📂 **Output Directory**: The script automatically creates a folder named `VideoRecords` in the `Documents` directory if it doesn't already exist.
2. 📝 **File Naming**: The recordings are saved with a timestamped filename like `Kayit_YYYY_MM_DD-HH_MM_SS.mp4`.
3. 🎥 **Audio and Video Recording**: 
   - Video is captured from the desktop using FFmpeg's `gdigrab`.
   - Audio is captured from the default or specified audio device.

---

## ⚙️ Customization Options

### 🎛️ Change Frame Rate
To adjust the recording frame rate, modify the `-framerate` parameter in the FFmpeg command. For example:
```bash
-framerate 24  # For 24 FPS
-framerate 30  # For 30 FPS (default)
-framerate 60  # For 60 FPS
```

### 🎙️ Configure Audio Input
To use your specific audio device:
1. Run the following FFmpeg command to list available audio devices:
   ```bash
   ffmpeg -list_devices true -f dshow -i dummy
   ```
2. Note the name of your desired audio device.
3. Replace `audio="Stereo Karışımı (Realtek(R) Audio)"` in the script with your device name.

---

## 🖥️ System Requirements

- 🪟 **Windows operating system**.

---

## 💡 Advantages Over Similar Tools

- 🚀 **Efficient**: Uses FFmpeg, renowned for its performance and flexibility.
- 🎨 **Customizable**: Tailor every aspect of your recording.
- 🎛️ **Lightweight**: Low resource consumption compared to GUI-based alternatives.

---

## 📜 FFmpeg Command Breakdown

Here's the core FFmpeg command explained:
```bash
ffmpeg -f gdigrab -framerate 30 -i desktop \
       -f dshow -i audio="Stereo Karışımı (Realtek(R) Audio)" \
       -c:v libx264 -preset ultrafast -pix_fmt yuv420p -crf 18 \
       -c:a aac -b:a 192k -filter:a "volume=4.0" \
       -y "%dosyaAdi%"
```

- 🖥️ `-f gdigrab`: Captures the desktop screen on Windows.
- 🎞️ `-framerate 30`: Sets the frame rate to 30 FPS.
- 🎙️ `-f dshow -i audio`: Captures audio from the specified audio device.
- 🔄 `-c:v libx264`: Encodes video using the H.264 codec.
- ⚡ `-preset ultrafast`: Prioritizes speed over compression efficiency.
- 🎥 `-pix_fmt yuv420p`: Ensures compatibility with most players.
- 📏 `-crf 18`: Balances video quality and file size.
- 🎧 `-c:a aac -b:a 192k`: Encodes audio with AAC codec at 192 kbps.
- 🔊 `-filter:a "volume=4.0"`: Amplifies the audio volume by 4x.

---

## 🚀 Getting Started

1. 📥 Install [FFmpeg](https://ffmpeg.org/download.html) if not already installed.
2. 🛠️ Copy the script to a `.bat` file (e.g., `record_screen.bat`).
3. ▶️ Double-click the script to start recording.

🎉 **Enjoy seamless screen and audio recording!**
