#############################################################################
# Makefile for building: libMando.so
# Generated by qmake (3.1) (Qt 5.15.8)
# Project:  project_set.pro
# Template: lib
# Command: /usr/lib/qt5/bin/qmake -o Makefile project_set.pro
#############################################################################

MAKEFILE      = Makefile

EQ            = =

####### Compiler, tools and options

CC            = gcc
CXX           = g++
DEFINES       = -DQT_PLUGIN -DQT_WIDGETS_LIB -DQT_GUI_LIB -DQT_XML_LIB -DQT_CORE_LIB
CFLAGS        = -pipe -g -Wall -Wextra -D_REENTRANT -fPIC $(DEFINES)
CXXFLAGS      = -pipe -g -Wall -Wextra -D_REENTRANT -fPIC $(DEFINES)
INCPATH       = -I. -I/usr/include/qgis -I/usr/include/lua5.3 -I/usr/include/i386-linux-gnu/qt5 -I/usr/include/i386-linux-gnu/qt5/QtWidgets -I/usr/include/i386-linux-gnu/qt5/QtGui -I/usr/include/i386-linux-gnu/qt5/QtXml -I/usr/include/i386-linux-gnu/qt5/QtCore -I. -I/usr/lib/i386-linux-gnu/qt5/mkspecs/linux-g++
QMAKE         = /usr/lib/qt5/bin/qmake
DEL_FILE      = rm -f
CHK_DIR_EXISTS= test -d
MKDIR         = mkdir -p
COPY          = cp -f
COPY_FILE     = cp -f
COPY_DIR      = cp -f -R
INSTALL_FILE  = install -m 644 -p
INSTALL_PROGRAM = install -m 755 -p
INSTALL_DIR   = cp -f -R
QINSTALL      = /usr/lib/qt5/bin/qmake -install qinstall
QINSTALL_PROGRAM = /usr/lib/qt5/bin/qmake -install qinstall -exe
DEL_FILE      = rm -f
SYMLINK       = ln -f -s
DEL_DIR       = rmdir
MOVE          = mv -f
TAR           = tar -cf
COMPRESS      = gzip -9f
DISTNAME      = Mando1.0.0
DISTDIR = /home/molinahuel/qgislua/.tmp/Mando1.0.0
LINK          = g++
LFLAGS        = -shared
LIBS          = $(SUBLIBS) -L/usr/lib -lqgis_core -lqgis_gui -llua5.3 /usr/lib/i386-linux-gnu/libQt5Widgets.so /usr/lib/i386-linux-gnu/libQt5Gui.so /usr/lib/i386-linux-gnu/libQt5Xml.so /usr/lib/i386-linux-gnu/libQt5Core.so -lGL -lpthread   
AR            = ar cqs
RANLIB        = 
SED           = sed
STRIP         = strip

####### Output directory

OBJECTS_DIR   = ./

####### Files

SOURCES       = qgsmando.cpp 
OBJECTS       = qgsmando.o
DIST          = /usr/lib/i386-linux-gnu/qt5/mkspecs/features/spec_pre.prf \
		/usr/lib/i386-linux-gnu/qt5/mkspecs/common/unix.conf \
		/usr/lib/i386-linux-gnu/qt5/mkspecs/common/linux.conf \
		/usr/lib/i386-linux-gnu/qt5/mkspecs/common/sanitize.conf \
		/usr/lib/i386-linux-gnu/qt5/mkspecs/common/gcc-base.conf \
		/usr/lib/i386-linux-gnu/qt5/mkspecs/common/gcc-base-unix.conf \
		/usr/lib/i386-linux-gnu/qt5/mkspecs/common/g++-base.conf \
		/usr/lib/i386-linux-gnu/qt5/mkspecs/common/g++-unix.conf \
		/usr/lib/i386-linux-gnu/qt5/mkspecs/qconfig.pri \
		/usr/lib/i386-linux-gnu/qt5/mkspecs/modules/qt_lib_accessibility_support_private.pri \
		/usr/lib/i386-linux-gnu/qt5/mkspecs/modules/qt_lib_bootstrap_private.pri \
		/usr/lib/i386-linux-gnu/qt5/mkspecs/modules/qt_lib_concurrent.pri \
		/usr/lib/i386-linux-gnu/qt5/mkspecs/modules/qt_lib_concurrent_private.pri \
		/usr/lib/i386-linux-gnu/qt5/mkspecs/modules/qt_lib_core.pri \
		/usr/lib/i386-linux-gnu/qt5/mkspecs/modules/qt_lib_core_private.pri \
		/usr/lib/i386-linux-gnu/qt5/mkspecs/modules/qt_lib_dbus.pri \
		/usr/lib/i386-linux-gnu/qt5/mkspecs/modules/qt_lib_dbus_private.pri \
		/usr/lib/i386-linux-gnu/qt5/mkspecs/modules/qt_lib_designer.pri \
		/usr/lib/i386-linux-gnu/qt5/mkspecs/modules/qt_lib_devicediscovery_support_private.pri \
		/usr/lib/i386-linux-gnu/qt5/mkspecs/modules/qt_lib_edid_support_private.pri \
		/usr/lib/i386-linux-gnu/qt5/mkspecs/modules/qt_lib_egl_support_private.pri \
		/usr/lib/i386-linux-gnu/qt5/mkspecs/modules/qt_lib_eglfs_kms_support_private.pri \
		/usr/lib/i386-linux-gnu/qt5/mkspecs/modules/qt_lib_eglfsdeviceintegration_private.pri \
		/usr/lib/i386-linux-gnu/qt5/mkspecs/modules/qt_lib_eventdispatcher_support_private.pri \
		/usr/lib/i386-linux-gnu/qt5/mkspecs/modules/qt_lib_fb_support_private.pri \
		/usr/lib/i386-linux-gnu/qt5/mkspecs/modules/qt_lib_fontdatabase_support_private.pri \
		/usr/lib/i386-linux-gnu/qt5/mkspecs/modules/qt_lib_glx_support_private.pri \
		/usr/lib/i386-linux-gnu/qt5/mkspecs/modules/qt_lib_gui.pri \
		/usr/lib/i386-linux-gnu/qt5/mkspecs/modules/qt_lib_gui_private.pri \
		/usr/lib/i386-linux-gnu/qt5/mkspecs/modules/qt_lib_help.pri \
		/usr/lib/i386-linux-gnu/qt5/mkspecs/modules/qt_lib_input_support_private.pri \
		/usr/lib/i386-linux-gnu/qt5/mkspecs/modules/qt_lib_kms_support_private.pri \
		/usr/lib/i386-linux-gnu/qt5/mkspecs/modules/qt_lib_linuxaccessibility_support_private.pri \
		/usr/lib/i386-linux-gnu/qt5/mkspecs/modules/qt_lib_network.pri \
		/usr/lib/i386-linux-gnu/qt5/mkspecs/modules/qt_lib_network_private.pri \
		/usr/lib/i386-linux-gnu/qt5/mkspecs/modules/qt_lib_opengl_private.pri \
		/usr/lib/i386-linux-gnu/qt5/mkspecs/modules/qt_lib_openglextensions.pri \
		/usr/lib/i386-linux-gnu/qt5/mkspecs/modules/qt_lib_openglextensions_private.pri \
		/usr/lib/i386-linux-gnu/qt5/mkspecs/modules/qt_lib_platformcompositor_support_private.pri \
		/usr/lib/i386-linux-gnu/qt5/mkspecs/modules/qt_lib_positioning.pri \
		/usr/lib/i386-linux-gnu/qt5/mkspecs/modules/qt_lib_positioningquick.pri \
		/usr/lib/i386-linux-gnu/qt5/mkspecs/modules/qt_lib_printsupport.pri \
		/usr/lib/i386-linux-gnu/qt5/mkspecs/modules/qt_lib_printsupport_private.pri \
		/usr/lib/i386-linux-gnu/qt5/mkspecs/modules/qt_lib_qml.pri \
		/usr/lib/i386-linux-gnu/qt5/mkspecs/modules/qt_lib_qmlmodels.pri \
		/usr/lib/i386-linux-gnu/qt5/mkspecs/modules/qt_lib_qmltest.pri \
		/usr/lib/i386-linux-gnu/qt5/mkspecs/modules/qt_lib_qmlworkerscript.pri \
		/usr/lib/i386-linux-gnu/qt5/mkspecs/modules/qt_lib_quick.pri \
		/usr/lib/i386-linux-gnu/qt5/mkspecs/modules/qt_lib_quickwidgets.pri \
		/usr/lib/i386-linux-gnu/qt5/mkspecs/modules/qt_lib_service_support_private.pri \
		/usr/lib/i386-linux-gnu/qt5/mkspecs/modules/qt_lib_sql.pri \
		/usr/lib/i386-linux-gnu/qt5/mkspecs/modules/qt_lib_sql_private.pri \
		/usr/lib/i386-linux-gnu/qt5/mkspecs/modules/qt_lib_svg.pri \
		/usr/lib/i386-linux-gnu/qt5/mkspecs/modules/qt_lib_testlib.pri \
		/usr/lib/i386-linux-gnu/qt5/mkspecs/modules/qt_lib_testlib_private.pri \
		/usr/lib/i386-linux-gnu/qt5/mkspecs/modules/qt_lib_theme_support_private.pri \
		/usr/lib/i386-linux-gnu/qt5/mkspecs/modules/qt_lib_uiplugin.pri \
		/usr/lib/i386-linux-gnu/qt5/mkspecs/modules/qt_lib_uitools.pri \
		/usr/lib/i386-linux-gnu/qt5/mkspecs/modules/qt_lib_vulkan_support_private.pri \
		/usr/lib/i386-linux-gnu/qt5/mkspecs/modules/qt_lib_webkit.pri \
		/usr/lib/i386-linux-gnu/qt5/mkspecs/modules/qt_lib_webkitwidgets.pri \
		/usr/lib/i386-linux-gnu/qt5/mkspecs/modules/qt_lib_widgets.pri \
		/usr/lib/i386-linux-gnu/qt5/mkspecs/modules/qt_lib_widgets_private.pri \
		/usr/lib/i386-linux-gnu/qt5/mkspecs/modules/qt_lib_xcb_qpa_lib_private.pri \
		/usr/lib/i386-linux-gnu/qt5/mkspecs/modules/qt_lib_xkbcommon_support_private.pri \
		/usr/lib/i386-linux-gnu/qt5/mkspecs/modules/qt_lib_xml.pri \
		/usr/lib/i386-linux-gnu/qt5/mkspecs/modules/qt_lib_xml_private.pri \
		/usr/lib/i386-linux-gnu/qt5/mkspecs/features/qt_functions.prf \
		/usr/lib/i386-linux-gnu/qt5/mkspecs/features/qt_config.prf \
		/usr/lib/i386-linux-gnu/qt5/mkspecs/linux-g++/qmake.conf \
		/usr/lib/i386-linux-gnu/qt5/mkspecs/features/spec_post.prf \
		.qmake.stash \
		/usr/lib/i386-linux-gnu/qt5/mkspecs/features/exclusive_builds.prf \
		/usr/lib/i386-linux-gnu/qt5/mkspecs/features/toolchain.prf \
		/usr/lib/i386-linux-gnu/qt5/mkspecs/features/default_pre.prf \
		/usr/lib/i386-linux-gnu/qt5/mkspecs/features/resolve_config.prf \
		/usr/lib/i386-linux-gnu/qt5/mkspecs/features/default_post.prf \
		/usr/lib/i386-linux-gnu/qt5/mkspecs/features/warn_on.prf \
		/usr/lib/i386-linux-gnu/qt5/mkspecs/features/qt.prf \
		/usr/lib/i386-linux-gnu/qt5/mkspecs/features/resources_functions.prf \
		/usr/lib/i386-linux-gnu/qt5/mkspecs/features/resources.prf \
		/usr/lib/i386-linux-gnu/qt5/mkspecs/features/moc.prf \
		/usr/lib/i386-linux-gnu/qt5/mkspecs/features/unix/opengl.prf \
		/usr/lib/i386-linux-gnu/qt5/mkspecs/features/uic.prf \
		/usr/lib/i386-linux-gnu/qt5/mkspecs/features/unix/thread.prf \
		/usr/lib/i386-linux-gnu/qt5/mkspecs/features/qmake_use.prf \
		/usr/lib/i386-linux-gnu/qt5/mkspecs/features/file_copies.prf \
		/usr/lib/i386-linux-gnu/qt5/mkspecs/features/testcase_targets.prf \
		/usr/lib/i386-linux-gnu/qt5/mkspecs/features/exceptions.prf \
		/usr/lib/i386-linux-gnu/qt5/mkspecs/features/yacc.prf \
		/usr/lib/i386-linux-gnu/qt5/mkspecs/features/lex.prf \
		project_set.pro qgismando.h qgsmando.cpp
QMAKE_TARGET  = Mando
DESTDIR       = 
TARGET        = libMando.so
TARGETD       = libMando.so


first: all
####### Build rules

libMando.so:  $(OBJECTS) $(SUBLIBS) $(OBJCOMP)  
	-$(DEL_FILE) $(TARGET)
	$(LINK) $(LFLAGS) -o $(TARGET) $(OBJECTS) $(LIBS) $(OBJCOMP)



Makefile: project_set.pro /usr/lib/i386-linux-gnu/qt5/mkspecs/linux-g++/qmake.conf /usr/lib/i386-linux-gnu/qt5/mkspecs/features/spec_pre.prf \
		/usr/lib/i386-linux-gnu/qt5/mkspecs/common/unix.conf \
		/usr/lib/i386-linux-gnu/qt5/mkspecs/common/linux.conf \
		/usr/lib/i386-linux-gnu/qt5/mkspecs/common/sanitize.conf \
		/usr/lib/i386-linux-gnu/qt5/mkspecs/common/gcc-base.conf \
		/usr/lib/i386-linux-gnu/qt5/mkspecs/common/gcc-base-unix.conf \
		/usr/lib/i386-linux-gnu/qt5/mkspecs/common/g++-base.conf \
		/usr/lib/i386-linux-gnu/qt5/mkspecs/common/g++-unix.conf \
		/usr/lib/i386-linux-gnu/qt5/mkspecs/qconfig.pri \
		/usr/lib/i386-linux-gnu/qt5/mkspecs/modules/qt_lib_accessibility_support_private.pri \
		/usr/lib/i386-linux-gnu/qt5/mkspecs/modules/qt_lib_bootstrap_private.pri \
		/usr/lib/i386-linux-gnu/qt5/mkspecs/modules/qt_lib_concurrent.pri \
		/usr/lib/i386-linux-gnu/qt5/mkspecs/modules/qt_lib_concurrent_private.pri \
		/usr/lib/i386-linux-gnu/qt5/mkspecs/modules/qt_lib_core.pri \
		/usr/lib/i386-linux-gnu/qt5/mkspecs/modules/qt_lib_core_private.pri \
		/usr/lib/i386-linux-gnu/qt5/mkspecs/modules/qt_lib_dbus.pri \
		/usr/lib/i386-linux-gnu/qt5/mkspecs/modules/qt_lib_dbus_private.pri \
		/usr/lib/i386-linux-gnu/qt5/mkspecs/modules/qt_lib_designer.pri \
		/usr/lib/i386-linux-gnu/qt5/mkspecs/modules/qt_lib_devicediscovery_support_private.pri \
		/usr/lib/i386-linux-gnu/qt5/mkspecs/modules/qt_lib_edid_support_private.pri \
		/usr/lib/i386-linux-gnu/qt5/mkspecs/modules/qt_lib_egl_support_private.pri \
		/usr/lib/i386-linux-gnu/qt5/mkspecs/modules/qt_lib_eglfs_kms_support_private.pri \
		/usr/lib/i386-linux-gnu/qt5/mkspecs/modules/qt_lib_eglfsdeviceintegration_private.pri \
		/usr/lib/i386-linux-gnu/qt5/mkspecs/modules/qt_lib_eventdispatcher_support_private.pri \
		/usr/lib/i386-linux-gnu/qt5/mkspecs/modules/qt_lib_fb_support_private.pri \
		/usr/lib/i386-linux-gnu/qt5/mkspecs/modules/qt_lib_fontdatabase_support_private.pri \
		/usr/lib/i386-linux-gnu/qt5/mkspecs/modules/qt_lib_glx_support_private.pri \
		/usr/lib/i386-linux-gnu/qt5/mkspecs/modules/qt_lib_gui.pri \
		/usr/lib/i386-linux-gnu/qt5/mkspecs/modules/qt_lib_gui_private.pri \
		/usr/lib/i386-linux-gnu/qt5/mkspecs/modules/qt_lib_help.pri \
		/usr/lib/i386-linux-gnu/qt5/mkspecs/modules/qt_lib_input_support_private.pri \
		/usr/lib/i386-linux-gnu/qt5/mkspecs/modules/qt_lib_kms_support_private.pri \
		/usr/lib/i386-linux-gnu/qt5/mkspecs/modules/qt_lib_linuxaccessibility_support_private.pri \
		/usr/lib/i386-linux-gnu/qt5/mkspecs/modules/qt_lib_network.pri \
		/usr/lib/i386-linux-gnu/qt5/mkspecs/modules/qt_lib_network_private.pri \
		/usr/lib/i386-linux-gnu/qt5/mkspecs/modules/qt_lib_opengl_private.pri \
		/usr/lib/i386-linux-gnu/qt5/mkspecs/modules/qt_lib_openglextensions.pri \
		/usr/lib/i386-linux-gnu/qt5/mkspecs/modules/qt_lib_openglextensions_private.pri \
		/usr/lib/i386-linux-gnu/qt5/mkspecs/modules/qt_lib_platformcompositor_support_private.pri \
		/usr/lib/i386-linux-gnu/qt5/mkspecs/modules/qt_lib_positioning.pri \
		/usr/lib/i386-linux-gnu/qt5/mkspecs/modules/qt_lib_positioningquick.pri \
		/usr/lib/i386-linux-gnu/qt5/mkspecs/modules/qt_lib_printsupport.pri \
		/usr/lib/i386-linux-gnu/qt5/mkspecs/modules/qt_lib_printsupport_private.pri \
		/usr/lib/i386-linux-gnu/qt5/mkspecs/modules/qt_lib_qml.pri \
		/usr/lib/i386-linux-gnu/qt5/mkspecs/modules/qt_lib_qmlmodels.pri \
		/usr/lib/i386-linux-gnu/qt5/mkspecs/modules/qt_lib_qmltest.pri \
		/usr/lib/i386-linux-gnu/qt5/mkspecs/modules/qt_lib_qmlworkerscript.pri \
		/usr/lib/i386-linux-gnu/qt5/mkspecs/modules/qt_lib_quick.pri \
		/usr/lib/i386-linux-gnu/qt5/mkspecs/modules/qt_lib_quickwidgets.pri \
		/usr/lib/i386-linux-gnu/qt5/mkspecs/modules/qt_lib_service_support_private.pri \
		/usr/lib/i386-linux-gnu/qt5/mkspecs/modules/qt_lib_sql.pri \
		/usr/lib/i386-linux-gnu/qt5/mkspecs/modules/qt_lib_sql_private.pri \
		/usr/lib/i386-linux-gnu/qt5/mkspecs/modules/qt_lib_svg.pri \
		/usr/lib/i386-linux-gnu/qt5/mkspecs/modules/qt_lib_testlib.pri \
		/usr/lib/i386-linux-gnu/qt5/mkspecs/modules/qt_lib_testlib_private.pri \
		/usr/lib/i386-linux-gnu/qt5/mkspecs/modules/qt_lib_theme_support_private.pri \
		/usr/lib/i386-linux-gnu/qt5/mkspecs/modules/qt_lib_uiplugin.pri \
		/usr/lib/i386-linux-gnu/qt5/mkspecs/modules/qt_lib_uitools.pri \
		/usr/lib/i386-linux-gnu/qt5/mkspecs/modules/qt_lib_vulkan_support_private.pri \
		/usr/lib/i386-linux-gnu/qt5/mkspecs/modules/qt_lib_webkit.pri \
		/usr/lib/i386-linux-gnu/qt5/mkspecs/modules/qt_lib_webkitwidgets.pri \
		/usr/lib/i386-linux-gnu/qt5/mkspecs/modules/qt_lib_widgets.pri \
		/usr/lib/i386-linux-gnu/qt5/mkspecs/modules/qt_lib_widgets_private.pri \
		/usr/lib/i386-linux-gnu/qt5/mkspecs/modules/qt_lib_xcb_qpa_lib_private.pri \
		/usr/lib/i386-linux-gnu/qt5/mkspecs/modules/qt_lib_xkbcommon_support_private.pri \
		/usr/lib/i386-linux-gnu/qt5/mkspecs/modules/qt_lib_xml.pri \
		/usr/lib/i386-linux-gnu/qt5/mkspecs/modules/qt_lib_xml_private.pri \
		/usr/lib/i386-linux-gnu/qt5/mkspecs/features/qt_functions.prf \
		/usr/lib/i386-linux-gnu/qt5/mkspecs/features/qt_config.prf \
		/usr/lib/i386-linux-gnu/qt5/mkspecs/linux-g++/qmake.conf \
		/usr/lib/i386-linux-gnu/qt5/mkspecs/features/spec_post.prf \
		.qmake.stash \
		/usr/lib/i386-linux-gnu/qt5/mkspecs/features/exclusive_builds.prf \
		/usr/lib/i386-linux-gnu/qt5/mkspecs/features/toolchain.prf \
		/usr/lib/i386-linux-gnu/qt5/mkspecs/features/default_pre.prf \
		/usr/lib/i386-linux-gnu/qt5/mkspecs/features/resolve_config.prf \
		/usr/lib/i386-linux-gnu/qt5/mkspecs/features/default_post.prf \
		/usr/lib/i386-linux-gnu/qt5/mkspecs/features/warn_on.prf \
		/usr/lib/i386-linux-gnu/qt5/mkspecs/features/qt.prf \
		/usr/lib/i386-linux-gnu/qt5/mkspecs/features/resources_functions.prf \
		/usr/lib/i386-linux-gnu/qt5/mkspecs/features/resources.prf \
		/usr/lib/i386-linux-gnu/qt5/mkspecs/features/moc.prf \
		/usr/lib/i386-linux-gnu/qt5/mkspecs/features/unix/opengl.prf \
		/usr/lib/i386-linux-gnu/qt5/mkspecs/features/uic.prf \
		/usr/lib/i386-linux-gnu/qt5/mkspecs/features/unix/thread.prf \
		/usr/lib/i386-linux-gnu/qt5/mkspecs/features/qmake_use.prf \
		/usr/lib/i386-linux-gnu/qt5/mkspecs/features/file_copies.prf \
		/usr/lib/i386-linux-gnu/qt5/mkspecs/features/testcase_targets.prf \
		/usr/lib/i386-linux-gnu/qt5/mkspecs/features/exceptions.prf \
		/usr/lib/i386-linux-gnu/qt5/mkspecs/features/yacc.prf \
		/usr/lib/i386-linux-gnu/qt5/mkspecs/features/lex.prf \
		project_set.pro
	$(QMAKE) -o Makefile project_set.pro
/usr/lib/i386-linux-gnu/qt5/mkspecs/features/spec_pre.prf:
/usr/lib/i386-linux-gnu/qt5/mkspecs/common/unix.conf:
/usr/lib/i386-linux-gnu/qt5/mkspecs/common/linux.conf:
/usr/lib/i386-linux-gnu/qt5/mkspecs/common/sanitize.conf:
/usr/lib/i386-linux-gnu/qt5/mkspecs/common/gcc-base.conf:
/usr/lib/i386-linux-gnu/qt5/mkspecs/common/gcc-base-unix.conf:
/usr/lib/i386-linux-gnu/qt5/mkspecs/common/g++-base.conf:
/usr/lib/i386-linux-gnu/qt5/mkspecs/common/g++-unix.conf:
/usr/lib/i386-linux-gnu/qt5/mkspecs/qconfig.pri:
/usr/lib/i386-linux-gnu/qt5/mkspecs/modules/qt_lib_accessibility_support_private.pri:
/usr/lib/i386-linux-gnu/qt5/mkspecs/modules/qt_lib_bootstrap_private.pri:
/usr/lib/i386-linux-gnu/qt5/mkspecs/modules/qt_lib_concurrent.pri:
/usr/lib/i386-linux-gnu/qt5/mkspecs/modules/qt_lib_concurrent_private.pri:
/usr/lib/i386-linux-gnu/qt5/mkspecs/modules/qt_lib_core.pri:
/usr/lib/i386-linux-gnu/qt5/mkspecs/modules/qt_lib_core_private.pri:
/usr/lib/i386-linux-gnu/qt5/mkspecs/modules/qt_lib_dbus.pri:
/usr/lib/i386-linux-gnu/qt5/mkspecs/modules/qt_lib_dbus_private.pri:
/usr/lib/i386-linux-gnu/qt5/mkspecs/modules/qt_lib_designer.pri:
/usr/lib/i386-linux-gnu/qt5/mkspecs/modules/qt_lib_devicediscovery_support_private.pri:
/usr/lib/i386-linux-gnu/qt5/mkspecs/modules/qt_lib_edid_support_private.pri:
/usr/lib/i386-linux-gnu/qt5/mkspecs/modules/qt_lib_egl_support_private.pri:
/usr/lib/i386-linux-gnu/qt5/mkspecs/modules/qt_lib_eglfs_kms_support_private.pri:
/usr/lib/i386-linux-gnu/qt5/mkspecs/modules/qt_lib_eglfsdeviceintegration_private.pri:
/usr/lib/i386-linux-gnu/qt5/mkspecs/modules/qt_lib_eventdispatcher_support_private.pri:
/usr/lib/i386-linux-gnu/qt5/mkspecs/modules/qt_lib_fb_support_private.pri:
/usr/lib/i386-linux-gnu/qt5/mkspecs/modules/qt_lib_fontdatabase_support_private.pri:
/usr/lib/i386-linux-gnu/qt5/mkspecs/modules/qt_lib_glx_support_private.pri:
/usr/lib/i386-linux-gnu/qt5/mkspecs/modules/qt_lib_gui.pri:
/usr/lib/i386-linux-gnu/qt5/mkspecs/modules/qt_lib_gui_private.pri:
/usr/lib/i386-linux-gnu/qt5/mkspecs/modules/qt_lib_help.pri:
/usr/lib/i386-linux-gnu/qt5/mkspecs/modules/qt_lib_input_support_private.pri:
/usr/lib/i386-linux-gnu/qt5/mkspecs/modules/qt_lib_kms_support_private.pri:
/usr/lib/i386-linux-gnu/qt5/mkspecs/modules/qt_lib_linuxaccessibility_support_private.pri:
/usr/lib/i386-linux-gnu/qt5/mkspecs/modules/qt_lib_network.pri:
/usr/lib/i386-linux-gnu/qt5/mkspecs/modules/qt_lib_network_private.pri:
/usr/lib/i386-linux-gnu/qt5/mkspecs/modules/qt_lib_opengl_private.pri:
/usr/lib/i386-linux-gnu/qt5/mkspecs/modules/qt_lib_openglextensions.pri:
/usr/lib/i386-linux-gnu/qt5/mkspecs/modules/qt_lib_openglextensions_private.pri:
/usr/lib/i386-linux-gnu/qt5/mkspecs/modules/qt_lib_platformcompositor_support_private.pri:
/usr/lib/i386-linux-gnu/qt5/mkspecs/modules/qt_lib_positioning.pri:
/usr/lib/i386-linux-gnu/qt5/mkspecs/modules/qt_lib_positioningquick.pri:
/usr/lib/i386-linux-gnu/qt5/mkspecs/modules/qt_lib_printsupport.pri:
/usr/lib/i386-linux-gnu/qt5/mkspecs/modules/qt_lib_printsupport_private.pri:
/usr/lib/i386-linux-gnu/qt5/mkspecs/modules/qt_lib_qml.pri:
/usr/lib/i386-linux-gnu/qt5/mkspecs/modules/qt_lib_qmlmodels.pri:
/usr/lib/i386-linux-gnu/qt5/mkspecs/modules/qt_lib_qmltest.pri:
/usr/lib/i386-linux-gnu/qt5/mkspecs/modules/qt_lib_qmlworkerscript.pri:
/usr/lib/i386-linux-gnu/qt5/mkspecs/modules/qt_lib_quick.pri:
/usr/lib/i386-linux-gnu/qt5/mkspecs/modules/qt_lib_quickwidgets.pri:
/usr/lib/i386-linux-gnu/qt5/mkspecs/modules/qt_lib_service_support_private.pri:
/usr/lib/i386-linux-gnu/qt5/mkspecs/modules/qt_lib_sql.pri:
/usr/lib/i386-linux-gnu/qt5/mkspecs/modules/qt_lib_sql_private.pri:
/usr/lib/i386-linux-gnu/qt5/mkspecs/modules/qt_lib_svg.pri:
/usr/lib/i386-linux-gnu/qt5/mkspecs/modules/qt_lib_testlib.pri:
/usr/lib/i386-linux-gnu/qt5/mkspecs/modules/qt_lib_testlib_private.pri:
/usr/lib/i386-linux-gnu/qt5/mkspecs/modules/qt_lib_theme_support_private.pri:
/usr/lib/i386-linux-gnu/qt5/mkspecs/modules/qt_lib_uiplugin.pri:
/usr/lib/i386-linux-gnu/qt5/mkspecs/modules/qt_lib_uitools.pri:
/usr/lib/i386-linux-gnu/qt5/mkspecs/modules/qt_lib_vulkan_support_private.pri:
/usr/lib/i386-linux-gnu/qt5/mkspecs/modules/qt_lib_webkit.pri:
/usr/lib/i386-linux-gnu/qt5/mkspecs/modules/qt_lib_webkitwidgets.pri:
/usr/lib/i386-linux-gnu/qt5/mkspecs/modules/qt_lib_widgets.pri:
/usr/lib/i386-linux-gnu/qt5/mkspecs/modules/qt_lib_widgets_private.pri:
/usr/lib/i386-linux-gnu/qt5/mkspecs/modules/qt_lib_xcb_qpa_lib_private.pri:
/usr/lib/i386-linux-gnu/qt5/mkspecs/modules/qt_lib_xkbcommon_support_private.pri:
/usr/lib/i386-linux-gnu/qt5/mkspecs/modules/qt_lib_xml.pri:
/usr/lib/i386-linux-gnu/qt5/mkspecs/modules/qt_lib_xml_private.pri:
/usr/lib/i386-linux-gnu/qt5/mkspecs/features/qt_functions.prf:
/usr/lib/i386-linux-gnu/qt5/mkspecs/features/qt_config.prf:
/usr/lib/i386-linux-gnu/qt5/mkspecs/linux-g++/qmake.conf:
/usr/lib/i386-linux-gnu/qt5/mkspecs/features/spec_post.prf:
.qmake.stash:
/usr/lib/i386-linux-gnu/qt5/mkspecs/features/exclusive_builds.prf:
/usr/lib/i386-linux-gnu/qt5/mkspecs/features/toolchain.prf:
/usr/lib/i386-linux-gnu/qt5/mkspecs/features/default_pre.prf:
/usr/lib/i386-linux-gnu/qt5/mkspecs/features/resolve_config.prf:
/usr/lib/i386-linux-gnu/qt5/mkspecs/features/default_post.prf:
/usr/lib/i386-linux-gnu/qt5/mkspecs/features/warn_on.prf:
/usr/lib/i386-linux-gnu/qt5/mkspecs/features/qt.prf:
/usr/lib/i386-linux-gnu/qt5/mkspecs/features/resources_functions.prf:
/usr/lib/i386-linux-gnu/qt5/mkspecs/features/resources.prf:
/usr/lib/i386-linux-gnu/qt5/mkspecs/features/moc.prf:
/usr/lib/i386-linux-gnu/qt5/mkspecs/features/unix/opengl.prf:
/usr/lib/i386-linux-gnu/qt5/mkspecs/features/uic.prf:
/usr/lib/i386-linux-gnu/qt5/mkspecs/features/unix/thread.prf:
/usr/lib/i386-linux-gnu/qt5/mkspecs/features/qmake_use.prf:
/usr/lib/i386-linux-gnu/qt5/mkspecs/features/file_copies.prf:
/usr/lib/i386-linux-gnu/qt5/mkspecs/features/testcase_targets.prf:
/usr/lib/i386-linux-gnu/qt5/mkspecs/features/exceptions.prf:
/usr/lib/i386-linux-gnu/qt5/mkspecs/features/yacc.prf:
/usr/lib/i386-linux-gnu/qt5/mkspecs/features/lex.prf:
project_set.pro:
qmake: FORCE
	@$(QMAKE) -o Makefile project_set.pro

qmake_all: FORCE


all: Makefile libMando.so

dist: distdir FORCE
	(cd `dirname $(DISTDIR)` && $(TAR) $(DISTNAME).tar $(DISTNAME) && $(COMPRESS) $(DISTNAME).tar) && $(MOVE) `dirname $(DISTDIR)`/$(DISTNAME).tar.gz . && $(DEL_FILE) -r $(DISTDIR)

distdir: FORCE
	@test -d $(DISTDIR) || mkdir -p $(DISTDIR)
	$(COPY_FILE) --parents $(DIST) $(DISTDIR)/
	$(COPY_FILE) --parents /usr/lib/i386-linux-gnu/qt5/mkspecs/features/data/dummy.cpp $(DISTDIR)/
	$(COPY_FILE) --parents qgismando.h $(DISTDIR)/
	$(COPY_FILE) --parents qgsmando.cpp $(DISTDIR)/


clean: compiler_clean 
	-$(DEL_FILE) $(OBJECTS)
	-$(DEL_FILE) *~ core *.core


distclean: clean 
	-$(DEL_FILE) $(TARGET) 
	-$(DEL_FILE) .qmake.stash
	-$(DEL_FILE) Makefile


####### Sub-libraries

mocclean: compiler_moc_header_clean compiler_moc_objc_header_clean compiler_moc_source_clean

mocables: compiler_moc_header_make_all compiler_moc_objc_header_make_all compiler_moc_source_make_all

check: first

benchmark: first

compiler_rcc_make_all:
compiler_rcc_clean:
compiler_moc_predefs_make_all: moc_predefs.h
compiler_moc_predefs_clean:
	-$(DEL_FILE) moc_predefs.h
moc_predefs.h: /usr/lib/i386-linux-gnu/qt5/mkspecs/features/data/dummy.cpp
	g++ -pipe -g -Wall -Wextra -dM -E -o moc_predefs.h /usr/lib/i386-linux-gnu/qt5/mkspecs/features/data/dummy.cpp

compiler_moc_header_make_all:
compiler_moc_header_clean:
compiler_moc_objc_header_make_all:
compiler_moc_objc_header_clean:
compiler_moc_source_make_all:
compiler_moc_source_clean:
compiler_uic_make_all:
compiler_uic_clean:
compiler_yacc_decl_make_all:
compiler_yacc_decl_clean:
compiler_yacc_impl_make_all:
compiler_yacc_impl_clean:
compiler_lex_make_all:
compiler_lex_clean:
compiler_clean: compiler_moc_predefs_clean 

####### Compile

qgsmando.o: qgsmando.cpp qgismando.h \
		ui_interface.h
	$(CXX) -c $(CXXFLAGS) $(INCPATH) -o qgsmando.o qgsmando.cpp

####### Install

install:  FORCE

uninstall:  FORCE

FORCE:
