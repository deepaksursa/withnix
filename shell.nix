{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
  buildInputs = with pkgs; [
    python3
    python3Packages.pip
    python3Packages.virtualenv
  ];

  shellHook = ''
    # Create virtual environment if it doesn't exist
    if [ ! -d "venv" ]; then
      echo "Creating virtual environment..."
      python -m venv venv
    fi
    
    # Activate virtual environment
    source venv/bin/activate
    
    # Install Flask if not already installed
    if ! pip list | grep -F flask > /dev/null; then
      echo "Installing Flask..."
      pip install flask
    fi
    
    echo "Python virtual environment is ready!"
    echo "Virtual environment 'venv' is active"
    echo "Run 'python app.py' to start the development server"
  '';
} 