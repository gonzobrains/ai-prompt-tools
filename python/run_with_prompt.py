import os
import sys
import requests

API_KEY = os.getenv("OPENAI_API_KEY")
if not API_KEY:
    print("Please set the OPENAI_API_KEY environment variable.")
    sys.exit(1)

if len(sys.argv) < 2:
    print("Usage: python run_with_prompt.py 'Your prompt here'")
    sys.exit(1)

prompt = sys.argv[1]

response = requests.post(
    "https://api.openai.com/v1/chat/completions",
    headers={
        "Authorization": f"Bearer {API_KEY}",
        "Content-Type": "application/json"
    },
    json={
        "model": "gpt-3.5-turbo",
        "messages": [
            {"role": "user", "content": prompt}
        ]
    }
)

data = response.json()
try:
    print(data['choices'][0]['message']['content'].strip())
except KeyError:
    print("Unexpected response:", data)
