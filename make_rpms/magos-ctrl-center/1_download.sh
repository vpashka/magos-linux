#!/bin/bash
mkdir -p svn rpmbuild/SOURCES rpmbuild/SPECS
svn checkout http://lxde-ctrl-center.googlecode.com/svn/trunk/ svn || exit 1
cd svn
cp -pf lxde-ctrl-center/packages/magos/*.png ../SOURCES || exit 1
find -type d | grep /[.]svn$ | xargs rm -fr
VERSION=$(grep -im1 version: lxde-ctrl-center/packages/rosa/lxde-ctrl-center.spec  | awk '{print $2}')
mv lxde-ctrl-center magos-ctrl-center
tar -czf ../SOURCES/magos-ctrl-center-$VERSION.tar.gz magos-ctrl-center || exit 1
cd ../
rm -fr svn
echo Done.
