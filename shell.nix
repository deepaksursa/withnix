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

    # Confirm that the virtual environment is active
    echo "Python virtual environment 'venv' is active!"
    
    # Automatically run app.py after setting up the environment
    if [ -f "app.py" ]; then
      echo "Starting app.py..."
      python app.py
    else
      echo "app.py not found in the current directory."
    fi
  '';
}
