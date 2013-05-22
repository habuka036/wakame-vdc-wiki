# Installing ReText on CentOS 6



## IMPORTANT USE "make altinstall" when  installing Python 3.3
### Install Python 3.x

```
~ Download Python 3.3.x <http://python.org>
~ Untar
# cd Python-3.3.x
# ./configure --prefix=/usr/local
# make && make altinstall
```

### Install QT4

```
~ Download Qt4 <http://qt-project.org/downloads>
~ Untar
~ Remove Previous qt4 installation  and move /etc/profile.d/qt.sh script (removes from path)
~ Reboot
# yum install gstreamer-plugins-base-devel.x86_64
# yum install lua-devel.x86_64
# ln -s ~/qt-everywhere-opensource-src-4.8.4/mkspecs/linux-g++-64 /usr/lib64/qt4/mkspecs/default
$ vi /usr/lib64/qt4/mkspecs/default/qmake.conf
   Settings to modify:
   QMAKE_INCDIR_X11      =
   QMAKE_LIBDIR_X11      =
   QMAKE_INCDIR_OPENGL   =
   QMAKE_LIBDIR_OPENGL   =
# cd qt-everywhere-opensource-src-4.8.4
# ./configure -opensource --disable-mad PKG_CONFIG_PATH=/usr/local/gt4/lib
# gmake
# gmake install
```

### Install sip

```
~ Uninstall earlier versions
~ Download SIP Python Bindings <http://www.riverbankcomputing.com/software/sip/>
~ Untar
# cd sip-4.x.x
# /usr/local/bin/python3.3 configure.py  --debug
# make && make install
```

### Install PyQT4

```
~ Uninstall earlier versions
~ Download PyQT4 <http://www.riverbankcomputing.co.uk/software/pyqt/download/>
~ Untar
# cd PyQt-x11-gpl-4.x.x
# /usr/local/bin/python3.3 configure-ng.py --debug
# make && make install
```

### Install Markups

```
~ Download Python Markups <http://pypi.python.org/pypi/Markups>
~ Untar
# cd Markups-0.2.4
# /usr/local/bin/python3.3 setup.py install
```

### Install ReTex

```
~ Download ReText <http://sourceforge.net/p/retext/wiki/Home/>
~ Untar
# cd ReText-4.0.1
# /usr/local/bin/python3.3 setup.py install
```

### Also Recommended:

#### Install python-markdown

```
~ Download Markdown <git clone git://github.com/waylan/Python-Markdown.git python-markdown>
# cd python-markdown
# /usr/local/bin/python3.3 setup.py install
```

#### Install python-docutils

```
~ Download docutils <http://prdownloads.sourceforge.net/docutils/docutils-0.10.tar.gz?download>
~ Untar
# cd docutils-0.10
# /usr/local/bin/python3.3 setup.py install
```

#### Install python-enchant

```
~ Download pyenchant <https://pypi.python.org/pypi/pyenchant>
~ Untar
# cd pyenchant-1.6.5
# curl http://python-distribute.org/distribute_setup.py |/usr/local/bin/python3.3
# /usr/local/bin/python3.3 setup.py install
```

#### Install Pygment

```
# PYTHONPATH=/usr/local/lib/python3.3
# export PYTHONPATH
# /usr/local/bin/easy_install-3.3 Pygments
```