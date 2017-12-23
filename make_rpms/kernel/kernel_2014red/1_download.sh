#!/bin/bash
URL=http://mirror.rosalinux.com/rosa/rosa2016.1/repository/SRPMS/main/updates/kernel-4.9.60-1.src.rpm
if ! [ -d builddeps ] ; then
#FIXME to ignore
   urpmi.removemedia mib
   urpmi.update -a
   rm -f /var/cache/urpmi/rpms/*
#   urpmi --nofdigests --auto --no-suggests --test --noclean perl-devel numa-devel libunwind-devel kmod-devel kmod-compat gcc bc audit-devel elfutils-devel zlib-devel binutils-devel newt-devel python-devel pciutils-devel flex bison gettext docbook-style-xsl 'perl(ExtUtils::Embed)' 'pkgconfig(gtk+-2.0)' libbzip2-devel xmlto asciidoc 'pkgconfig(libcrypto)'
   urpmi --nofdigests --auto --no-suggests --test --noclean perl-devel numa-devel libunwind-devel kmod-devel kmod-compat gcc bc audit-devel elfutils-devel zlib-devel binutils-devel newt-devel python-devel pciutils-devel flex bison gettext docbook-style-xsl 'perl(ExtUtils::Embed)' 'pkgconfig(gtk+-2.0)' libbzip2-devel libslang-devel xmlto asciidoc libgl-devel libxv-devel libxxf86vm-devel libvdpau-devel libtirpc-devel libxmu-devel libxaw-devel libxp-devel libxtst-devel imake 'pkgconfig(libcrypto)'
   mkdir builddeps
   mv /var/cache/urpmi/rpms/*.rpm builddeps
fi
rpm --nodigest -Uhv builddeps/*.rpm
mkdir -p tmp/content rpmbuild/SOURCES rpmbuild/SPECS
curl -# --retry-delay 2 --retry 5 -o tmp/source.src.rpm $URL || exit 1
cd tmp/content
cat ../source.src.rpm | rpm2cpio - | cpio -i || exit 1
cd ../../
mv tmp/content/* rpmbuild/SOURCES || exit 1
mv rpmbuild/SOURCES/*.spec rpmbuild/SPECS || exit 1
rm -fr tmp
