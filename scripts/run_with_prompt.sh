#!/bin/bash

if [ -z "$OPENAI_API_KEY" ]; then
  echo "Please set the OPENAI_API_KEY environment variable."
  exit 1
fi

if [ -z "$1" ]; then
  echo "Usage: $0 "Your prompt here""
  exit 1
fi

PROMPT="$1"

curl -s https://api.openai.com/v1/chat/completions \
  -H "Authorization: Bearer $OPENAI_API_KEY" \
  -H "Content-Type: application/json" \
  -d "{
    \"model\": \"gpt-3.5-turbo\",
    \"messages\": [
      {\"role\": \"user\", \"content\": \"$PROMPT\"}
    ]
  }" | grep -o '\"content\": *\".*\"' | sed 's/\\n/ /g' | sed 's/\"content\": *\"//' | sed 's/\"$//'
