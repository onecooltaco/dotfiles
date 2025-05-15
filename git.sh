#!/usr/bin/env bash
set -eu

ROOT_DIR="$(dirname -- "$(stat -f "$0")")"
GIT_VERSION=$(git version | awk '{print $3}')

function version_lt() {
	test "$(echo "$@" | tr " " "n" | sort -rV | head -n 1)" != "$1";
}

function list_names() {
	if version_lt "$GIT_VERSION" 2.46; then
		git config --name-only --list --file "${ROOT_DIR}/gitconfig"
	else
		git config list --name-only --file "${ROOT_DIR}/gitconfig"
	fi
}

function get_value() {
	if version_lt "$GIT_VERSION" 2.46; then
		git config --get --file "${ROOT_DIR}/gitconfig" "$1"
	else
		git config get --file "${ROOT_DIR}/gitconfig" "$1"
	fi
}

function set_value() {
	if version_lt "$GIT_VERSION" 2.46; then
		git config --global "$1" "$2"
	else
		git config set --global "$1" "$2"
	fi
}

for line in $(list_names)
do
	value=$(get_value "$line")
    set_value "$line" "$value"
done

for f in gitignore gitattributes gitmessage; do
	[[ -f ${HOME}/.${f} ]] && cp "${HOME}/.${f}"{,~}
	cp -f "${ROOT_DIR}/${f}" "${HOME}/.${f}"
done

mkdir -p "${HOME}/.git-template"

if command -v pre-commit > /dev/null; then
    exec pre-commit init-templatedir "${HOME}/.git-template"
else
	echo "pre-commit not found." 1>&2
	echo "install pre-commit and run the following command:" 1>&2
	echo "pre-commit init-templatedir ${HOME}/.git-template" 1>&2
    exit 1
fi
