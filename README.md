# Flask Project with Nix

A Flask web application using Nix for development environment management.

## Setup

1. Install Nix:
   ```bash
   curl -L https://nixos.org/nix/install | sh
   ```

2. Configure Nix channels:
   ```bash
   nix-channel --add https://nixos.org/channels/nixpkgs-unstable nixpkgs
   nix-channel --update
   ```

3. Enter development environment:
   ```bash
   nix-shell
   ```

4. Run the application:
   ```bash
   python app.py
   ```

## Development

The project uses a Python virtual environment that is automatically created and activated when entering the nix-shell.

## Requirements

- Nix package manager
- Git (for version control)

## Application Structure

- `shell.nix` - Development environment configuration
- `app.py` - Flask application
- `.gitignore` - Git ignore rules

## Python Web Hello World

1. Create a simple Flask web application (`app.py`):

```python
from flask import Flask

app = Flask(__name__)

@app.route('/')
def hello_world():
    return 'Hello, World!'

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)
```
