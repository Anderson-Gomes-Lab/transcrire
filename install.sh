#!/bin/zsh

echo "Installing transcrire..."

# Check Homebrew
if ! command -v brew &> /dev/null
then
    echo "Homebrew not found. Please install it first:"
    echo "https://brew.sh/"
    exit 1
fi

# Install dependencies
echo "Installing dependencies..."
brew install ffmpeg whisper-cpp

# Create model directory
mkdir -p ~/whisper-models

# Download model if not present
MODEL_PATH=~/whisper-models/ggml-large-v3-turbo.bin

if [ ! -f "$MODEL_PATH" ]; then
    echo "Downloading Whisper model..."
    curl -L -o "$MODEL_PATH" \
    https://huggingface.co/ggerganov/whisper.cpp/resolve/main/ggml-large-v3-turbo.bin
else
    echo "Model already exists."
fi

# Copy script
echo "Installing transcrire.sh..."
cp transcrire.sh ~/
chmod +x ~/transcrire.sh

echo "Installation complete!"
echo "You can now use:"
echo '~/transcrire.sh "/path/to/file"'
