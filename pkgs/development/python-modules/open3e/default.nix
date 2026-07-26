{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  setuptools,
  setuptools-scm,
  wheel,
  pytestCheckHook,
  udsoncan,
  doipclient,
  python-can,
  can-isotp,
  paho-mqtt,
  rich,
}:

buildPythonPackage (finalAttrs: {
  pname = "open3e";
  version = "0.7.5";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "open3e";
    repo = "open3e";
    # Unfortunately, upstream doesn't tag releases - the right commit
    # needs to be identified manually.
    rev = "6553c10453a6bae1210908f38a5af2481a46a3e5";
    hash = "sha256-wk+fpRDI0mI3ZsXKrKz8ob60fW2F4yFWpBYmUfI1lmM=";
  };

  build-system = [
    setuptools
    setuptools-scm
    wheel
  ];

  dependencies = [
    udsoncan
    doipclient
    python-can
    can-isotp
    paho-mqtt
    rich
  ];

  nativeCheckInputs = [
    pytestCheckHook
  ];

  disabledTestPaths = [
    # Requires a special setup (see tests/integration/README.md)
    "tests/integration"
  ];

  pythonImportsCheck = [ "open3e" ];

  meta = {
    description = "Connects to E3 controllers via CAN or DOIP (UDS)";
    homepage = "https://github.com/BYVoid/OpenCC";
    license = lib.licenses.asl20;
    mainProgram = "open3e";
    maintainers = with lib.maintainers; [ WOnder93 ];
  };
})
