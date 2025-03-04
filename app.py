from flask import Flask
import socket

def find_free_port():
    with socket.socket(socket.AF_INET, socket.SOCK_STREAM) as s:
        s.bind(('', 0))
        s.listen(1)
        port = s.getsockname()[1]
        return port

app = Flask(__name__)
PORT = find_free_port()

# Enable hot reloading and development features
app.config['TEMPLATES_AUTO_RELOAD'] = True
app.jinja_env.auto_reload = True

@app.route('/')
def hello():
    return f'This is testing for nix server running on port. {PORT}'

if __name__ == '__main__':
    print(f"Server starting on port {PORT}")
    app.run(
        debug=True,         # Enables debug mode
        port=PORT,
        use_reloader=True,  # Enables auto-reload
        extra_files=['.'],  # Watch current directory for changes
        host='0.0.0.0'     # Listen on all interfaces
    )
