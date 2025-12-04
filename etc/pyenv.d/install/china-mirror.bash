if declare -Ff before_install >/dev/null; then
  before_install change_to
  after_install change_back
else
  echo "pyenv: no hooks for before_install, consider update your pyenv version" >&2
fi

DEFINITION_PATH="${ARGUMENTS[0]}"

change_to() {
  # skip build-in mirror
  export PYTHON_BUILD_SKIP_MIRROR=1

  if [ -z "$DEFINITION_PATH" ]; then
    usage 1 >&2
  elif [ ! -f "$DEFINITION_PATH" ]; then

    PYTHON_BUILD_INSTALL_PREFIX="$(pyenv root)/plugins/python-build"

    OLDIFS="$IFS"
    IFS=: PYTHON_BUILD_DEFINITIONS=($PYTHON_BUILD_DEFINITIONS ${PYTHON_BUILD_ROOT:-$PYTHON_BUILD_INSTALL_PREFIX}/share/python-build)

    for DEFINITION_DIR in "${PYTHON_BUILD_DEFINITIONS[@]}"; do
      if [ -f "${DEFINITION_DIR}/${DEFINITION_PATH}" ]; then
        DEFINITION_PATH="${DEFINITION_DIR}/${DEFINITION_PATH}"
        perl -p -i -e 's!www.python.org/ftp!mirrors.tuna.tsinghua.edu.cn!' ${DEFINITION_PATH}
        break
      fi
    done

    IFS="$OLDIFS"

    if [ ! -f "$DEFINITION_PATH" ]; then
      echo "python-build: definition not found: ${DEFINITION_PATH}" >&2
      exit 2
    fi
  fi
}

change_back() {
  if [ ! -f "${ARGUMENTS[0]}" ]; then
    perl -p -i -e 's!mirrors.tuna.tsinghua.edu.cn!www.python.org/ftp!' ${DEFINITION_PATH}
  fi
}
