from flask import Flask

app = Flask(__name__)

@app.route('/')
def hello():
    return 'This is testing for nix servr'

if __name__ == '__main__':
    app.run(debug=True)
