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

The application will automatically:
- Find and use an available port
- Display the port number in both console and web page
- Hot reload when code changes are detected
- Auto-refresh the browser on code changes

## Development

The project uses a Python virtual environment that is automatically created and activated when entering the nix-shell.
The application supports hot reloading - any changes to the code will automatically restart the server and refresh the browser.

## Requirements

- Nix package manager
- Git (for version control)

## Application Structure

- `shell.nix` - Development environment configuration
- `app.py` - Flask application (with dynamic port and hot reload)
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
