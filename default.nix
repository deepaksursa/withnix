{ pkgs ? import <nixpkgs> {} }:

pkgs.dockerTools.buildImage {
  name = "my-flask-app";
  tag = "latest";
  
  contents = [
    (pkgs.python3.withPackages (ps: with ps; [
      flask
      gunicorn
    ]))
  ];

  config = {
    Cmd = [ "gunicorn" "--bind" "0.0.0.0:8000" "app:app" ];
    WorkingDir = "/app";
    ExposedPorts = {
      "8000/tcp" = {};
    };
  };
} 