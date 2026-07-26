{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  setuptools,
  wheel,
  pytest-mock,
  pytestCheckHook,
}:

buildPythonPackage (finalAttrs: {
  pname = "doipclient";
  version = "1.2.1";
  pyproject = true;
  __structuredAttrs = true;

  src = fetchFromGitHub {
    owner = "jacobschaer";
    repo = "python-doipclient";
    tag = "v${finalAttrs.version}";
    hash = "sha256-kP+I1GLfpL1ovZrNsmy5qMHMYAZm6Ds7FNewgvSTjBA=";
  };

  build-system = [
    setuptools
    wheel
  ];

  nativeCheckInputs = [
    pytest-mock
    pytestCheckHook
  ];

  pythonImportsCheck = [
    "doipclient"
  ];

  meta = {
    description = "Pure Python ISO 13400 Client";
    homepage = "https://github.com/jacobschaer/python-doipclient";
    changelog = "https://github.com/jacobschaer/python-doipclient/releases/tag/${finalAttrs.src.tag}";
    license = lib.licenses.mit;
    maintainers = with lib.maintainers; [ WOnder93 ];
  };
})
