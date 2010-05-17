#!/bin/sh -e
path="."
if [ x"$1" != x ]; then
	path="$1"
fi

versiongit() {
	gitversion=`git svn log HEAD --limit=1 --oneline | cut -f 1 -d " "`
	cat <<EOF > $path/comptime.h

// Do not edit!  This file was autogenerated
// by the $0 script with git svn
//
const char* comprevision = "$gitversion";
EOF

}

versionsvn() {
	svnrevision=`svnversion -n $1`
	cat <<EOF > $path/comptime.h

// Do not edit!  This file was autogenerated
// by the $0 script with subversion
//
const char* comprevision = "r$svnrevision";
EOF
}

compversion() {
touch $path/comptime.c
test -d $path/.svn && versionsvn || versiongit
}

test -f $path/comptime.c && compversion
