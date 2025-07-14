#!/bin/bash

# Fail fast if no API key
if [ -z "$OPENAI_API_KEY" ]; then
  echo "Please set the OPENAI_API_KEY environment variable."
  exit 1
fi

# API endpoint
ENDPOINT="https://api.openai.com/v1/chat/completions"

# Make a simple request using gpt-3.5-turbo
curl -s "$ENDPOINT" \
  -H "Authorization: Bearer $OPENAI_API_KEY" \
  -H "Content-Type: application/json" \
  -d '{
    "model": "gpt-3.5-turbo",
    "messages": [
      {
        "role": "user",
        "content": "Say hello world"
      }
    ],
    "temperature": 0.7
  }'
