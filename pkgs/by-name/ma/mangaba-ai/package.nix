{
  lib,
  fetchFromGitHub,
  stdenv,
  python3Packages,
}:

stdenv.mkDerivation rec {
  pname = "mangaba-ai";
  version = "2025-08-03";

  src = fetchFromGitHub {
    owner = "Mangaba-ai";
    repo = "mangaba_ai";
    rev = "3927a0e3c7820cb4bb051c5e9174a20fe8ac209b";
    hash = lib.fakeSha256;
  };

  # nativeBuildInputs = [
  #   python3Packages.wrapPython
  # ];

  buildInputs = with python3Packages; [
    python
    google-generativeai
    loguru
    pydantic
    python-dotenv
    requests
    websockets
  ];

  meta = with lib; {
    description = "Python AI agent creation with A2A and MCP support";
    homepage = "https://github.com/Mangaba-ai/mangaba_ai";
    license = [ licenses.mit ];
    maintainers = [ lib.maintainers.gs-101 ];
  };
}
