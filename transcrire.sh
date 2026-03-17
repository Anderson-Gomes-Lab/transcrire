#!/bin/zsh

MODEL="$HOME/whisper-models/ggml-large-v3-turbo.bin"

if [ -z "$1" ]; then
  echo 'Usage : ~/transcrire.sh "/chemin/vers/fichier_audio_ou_video"'
  exit 1
fi

INPUT="$1"

if [ ! -f "$INPUT" ]; then
  echo "Fichier introuvable : $INPUT"
  exit 1
fi

if [ ! -f "$MODEL" ]; then
  echo "Modèle introuvable : $MODEL"
  exit 1
fi

DIR="$(dirname "$INPUT")"
BASENAME="$(basename "$INPUT")"
NAME="${BASENAME%.*}"

WAV_FILE="$DIR/$NAME.wav"
OUTPUT_FILE="$DIR/$NAME"

echo "Extraction / conversion audio en WAV..."
ffmpeg -y -i "$INPUT" -vn -ar 16000 -ac 1 -c:a pcm_s16le "$WAV_FILE"

if [ $? -ne 0 ]; then
  echo "Erreur pendant l'extraction ou la conversion audio."
  exit 1
fi

echo "Transcription en cours..."
whisper-cli -m "$MODEL" -l fr -otxt -of "$OUTPUT_FILE" "$WAV_FILE"

if [ $? -ne 0 ]; then
  echo "Erreur pendant la transcription."
  rm -f "$WAV_FILE"
  exit 1
fi

rm -f "$WAV_FILE"

echo "Terminé."
echo "Fichier texte : $OUTPUT_FILE.txt"
