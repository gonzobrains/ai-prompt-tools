# AI Prompt Tools

A collection of Bash and Python scripts for experimenting with OpenAI API prompts from the command line.

## 🔧 Setup

1. Set your API key:
   ```bash
   export OPENAI_API_KEY=sk-...
   ```

2. (For Python)
   ```bash
   pip install -r requirements.txt
   ```

## 🚀 Example Usage

### Bash
```bash
./scripts/run_with_prompt.sh "Tell me a fun fact about space."
```

### Python
```bash
python python/run_with_prompt.py "Tell me a fun fact about space."
```

## 🔐 Notes
- You must have API billing enabled
- You can switch models in the scripts (`gpt-3.5-turbo`, `gpt-4`, etc.)
