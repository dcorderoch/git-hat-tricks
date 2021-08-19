#!/usr/bin/env sh

main() {
	base_dir=$(git rev-parse --show-toplevel)

  cd "$base_dir"

	for filename in ${base_dir}/.hooks/*; do
		rm -f "$base_dir/.git/hooks/$(basename "$filename")"
		ln -s "$filename" "${base_dir}/.git/hooks/"
		git update-index --assume-unchanged "$filename"
	done
}

main
