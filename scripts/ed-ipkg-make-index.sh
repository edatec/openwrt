#!/usr/bin/env bash
set -e

pkg_dir=$1

if [ -z $pkg_dir ] || [ ! -d $pkg_dir ]; then
	echo "Usage: ipkg-make-index <package_directory>" >&2
	exit 1
fi

empty=1

for pkg in `find $pkg_dir -name 'ed-*.ipk' | sort`; do
	empty=
	name="${pkg##*/}"
	name="${name%%_*}"
	[[ "$name" = "kernel" ]] && continue
	[[ "$name" = "libc" ]] && continue
	echo "Generating index for package $pkg" >&2
	file_size=$(stat -L -c%s $pkg)
	sha256sum=$($MKHASH sha256sum $pkg)
	file_path=$(echo "${sha256sum}" | sed -e 's/.*package/package/')
	sha256sum_value=$(echo "${sha256sum}" | awk '{printf $1}')
	echo "sha256 = ${file_path}"
	# Take pains to make variable value sed-safe
	sed_safe_pkg=`echo $pkg | sed -e 's/^\.\///g' -e 's/\\//\\\\\\//g'`
	tar -xzOf $pkg ./control.tar.gz | tar xzOf - ./control | sed -e "s|^Description:|Filename: $file_path\\
Size: $file_size\\
SHA256sum: $sha256sum_value   $file_path\\
Description:|"
	echo ""
done
[ -n "$empty" ] && echo
exit 0
