#!/bin/bash

# Load API key from environment
if [ -z "$OPENAI_API_KEY" ]; then
  echo "❌ Error: Please set the OPENAI_API_KEY environment variable."
  exit 1
fi

# Define the test prompt
read -r -d '' PROMPT << EOM
Tell me a fun fact about space.
EOM

# Make the API request
curl https://api.openai.com/v1/chat/completions \
  -s \
  -H "Content-Type: application/json" \
  -H "Authorization: Bearer $OPENAI_API_KEY" \
  -d "{
    \"model\": \"gpt-4\",
    \"messages\": [
      {\"role\": \"system\", \"content\": \"You are a helpful assistant.\"},
      {\"role\": \"user\", \"content\": \"$PROMPT\"}
    ],
    \"temperature\": 0.7
  }" | jq -r '.choices[0].message.content'
