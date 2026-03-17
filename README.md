# transcrire

Simple CLI to transcribe audio and video locally using whisper.cpp (macOS).

## Quick install

```bash
curl -fsSL https://raw.githubusercontent.com/Anderson-Gomes-Lab/transcrire/main/install.sh | bash
```

## Features

* Works with audio and video files
* Fully local (no cloud, no data sent anywhere)
* Uses whisper.cpp for fast transcription
* Automatic audio extraction and conversion
* Outputs clean `.txt` files

## Requirements

* macOS
* Homebrew
* ffmpeg
* whisper-cpp
* A Whisper model (e.g. `ggml-large-v3-turbo.bin`) stored in:

```
~/whisper-models/
```

## Setup (first time only)

Install dependencies:

```bash
brew install ffmpeg whisper-cpp
```

Download a model:

```bash
mkdir -p ~/whisper-models
curl -L -o ~/whisper-models/ggml-large-v3-turbo.bin \
https://huggingface.co/ggerganov/whisper.cpp/resolve/main/ggml-large-v3-turbo.bin
```

## Installation

Clone the repository:

```bash
git clone https://github.com/Anderson-Gomes-Lab/transcrire.git
cd transcrire
chmod +x transcrire.sh
```

Move the script to your home directory:

```bash
cp transcrire.sh ~/
```

## Usage

```bash
~/transcrire.sh "/path/to/file.m4a"
~/transcrire.sh "/path/to/file.mp4"
```

## Output

* Generates a `.txt` file in the same folder
* Temporary `.wav` file is automatically deleted

## Notes

* Large files may take time depending on your machine
* Recommended model: `large-v3-turbo` for best quality

## License

MIT

