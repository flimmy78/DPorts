# $FreeBSD$

PORTNAME=	openjdk
PORTVERSION=	${JDK_MAJOR_VERSION}.${JDK_UPDATE_VERSION}.${JDK_BUILD_NUMBER:S/^0//}
PORTREVISION=	1
CATEGORIES=	java devel
MASTER_SITES=	http://download.java.net/openjdk/jdk${JDK_MAJOR_VERSION}/promoted/b${DIST_BUILD_NUMBER}/:jdk \
		https://adopt-openjdk.ci.cloudbees.com/job/jtreg/${JTREG_JENKINS_BUILD}/artifact/:jtreg \
		http://dl.wolfpond.org/openjdk8/:bootstrap \
		http://leaf.dragonflybsd.org/~marino/dports-src/:bootstrap \
		LOCAL/jkim:jdk,jtreg
PKGNAMESUFFIX?=	${JDK_MAJOR_VERSION}
DISTNAME=	${PORTNAME}-${JDK_MAJOR_VERSION}-src-b${DIST_BUILD_NUMBER}-03_mar_2014
DISTFILES=	${DISTNAME}.zip:jdk ${BOOTSTRAP_DISTFILE}

PATCH_SITES=	LOCAL/glewis/openjdk8
PATCHFILES=	patch-8u05-b13.xz \
		patch-8u11-b13.xz \
		patch-8u20-b26.xz \
		patch-8u25-b17.xz \
		patch-8u31-b13.xz \
		patch-8u40-b25.xz \
		patch-8u45-b14.xz \
		patch-8u51-b16.xz \
		patch-8u60-b23.xz \
		patch-8u66-b17-1.xz \
		patch-8u72-b15.xz \
		patch-8u74-b02.xz \
		patch-8u77-b03.xz \
		patch-8u92-b14.xz \
		patch-8u102-b14.xz \
		patch-8u112-b16.xz \
		patch-8u121-b13.xz \
		patch-8u131-b11.xz \
		patch-8u144-b01.xz \
		patch-8u152-b16.xz \
		patch-8u162-b12.xz \
		patch-8u172-b11.xz

MAINTAINER=	java@FreeBSD.org
COMMENT?=	Java Development Kit ${JDK_MAJOR_VERSION}

LICENSE=	GPLv2

BUILD_DEPENDS=	zip:archivers/zip \
		autoconf>0:devel/autoconf \
		${LOCALBASE}/include/cups/cups.h:print/cups \
		bash:shells/bash
LIB_DEPENDS=	libfreetype.so:print/freetype2
RUN_DEPENDS=	javavm:java/javavmwrapper \
		dejavu>0:x11-fonts/dejavu

USES=		compiler:features dos2unix gmake iconv pkgconfig \
		shebangfix

.if !exists(/usr/bin/unzip)
BUILD_DEPENDS+=	${UNZIP_CMD}:archivers/unzip
.endif

ONLY_FOR_ARCHS=	aarch64 amd64 armv6 armv7 i386 powerpc powerpc64
WRKSRC=		${WRKDIR}/${PORTNAME}

DOS2UNIX_FILES= jdk/src/bsd/doc/man/appletviewer.1 \
		jdk/src/bsd/doc/man/extcheck.1 \
		jdk/src/bsd/doc/man/idlj.1 \
		jdk/src/bsd/doc/man/jar.1 \
		jdk/src/bsd/doc/man/jarsigner.1 \
		jdk/src/bsd/doc/man/java.1 \
		jdk/src/bsd/doc/man/javac.1 \
		jdk/src/bsd/doc/man/javadoc.1 \
		jdk/src/bsd/doc/man/javah.1 \
		jdk/src/bsd/doc/man/javap.1 \
		jdk/src/bsd/doc/man/jcmd.1 \
		jdk/src/bsd/doc/man/jconsole.1 \
		jdk/src/bsd/doc/man/jdb.1 \
		jdk/src/bsd/doc/man/jdeps.1 \
		jdk/src/bsd/doc/man/jhat.1 \
		jdk/src/bsd/doc/man/jinfo.1 \
		jdk/src/bsd/doc/man/jjs.1 \
		jdk/src/bsd/doc/man/jmap.1 \
		jdk/src/bsd/doc/man/jps.1 \
		jdk/src/bsd/doc/man/jrunscript.1 \
		jdk/src/bsd/doc/man/jsadebugd.1 \
		jdk/src/bsd/doc/man/jstack.1 \
		jdk/src/bsd/doc/man/jstat.1 \
		jdk/src/bsd/doc/man/jstatd.1 \
		jdk/src/bsd/doc/man/keytool.1 \
		jdk/src/bsd/doc/man/native2ascii.1 \
		jdk/src/bsd/doc/man/orbd.1 \
		jdk/src/bsd/doc/man/pack200.1 \
		jdk/src/bsd/doc/man/policytool.1 \
		jdk/src/bsd/doc/man/rmic.1 \
		jdk/src/bsd/doc/man/rmid.1 \
		jdk/src/bsd/doc/man/rmiregistry.1 \
		jdk/src/bsd/doc/man/schemagen.1 \
		jdk/src/bsd/doc/man/serialver.1 \
		jdk/src/bsd/doc/man/servertool.1 \
		jdk/src/bsd/doc/man/tnameserv.1 \
		jdk/src/bsd/doc/man/unpack200.1 \
		jdk/src/bsd/doc/man/wsgen.1 \
		jdk/src/bsd/doc/man/wsimport.1 \
		jdk/src/bsd/doc/man/xjc.1 \
		jdk/src/linux/doc/man/appletviewer.1 \
		jdk/src/linux/doc/man/extcheck.1 \
		jdk/src/linux/doc/man/idlj.1 \
		jdk/src/linux/doc/man/jar.1 \
		jdk/src/linux/doc/man/jarsigner.1 \
		jdk/src/linux/doc/man/java.1 \
		jdk/src/linux/doc/man/javac.1 \
		jdk/src/linux/doc/man/javadoc.1 \
		jdk/src/linux/doc/man/javah.1 \
		jdk/src/linux/doc/man/javap.1 \
		jdk/src/linux/doc/man/jcmd.1 \
		jdk/src/linux/doc/man/jconsole.1 \
		jdk/src/linux/doc/man/jdb.1 \
		jdk/src/linux/doc/man/jdeps.1 \
		jdk/src/linux/doc/man/jhat.1 \
		jdk/src/linux/doc/man/jinfo.1 \
		jdk/src/linux/doc/man/jjs.1 \
		jdk/src/linux/doc/man/jmap.1 \
		jdk/src/linux/doc/man/jps.1 \
		jdk/src/linux/doc/man/jrunscript.1 \
		jdk/src/linux/doc/man/jsadebugd.1 \
		jdk/src/linux/doc/man/jstack.1 \
		jdk/src/linux/doc/man/jstat.1 \
		jdk/src/linux/doc/man/jstatd.1 \
		jdk/src/linux/doc/man/keytool.1 \
		jdk/src/linux/doc/man/native2ascii.1 \
		jdk/src/linux/doc/man/orbd.1 \
		jdk/src/linux/doc/man/pack200.1 \
		jdk/src/linux/doc/man/policytool.1 \
		jdk/src/linux/doc/man/rmic.1 \
		jdk/src/linux/doc/man/rmid.1 \
		jdk/src/linux/doc/man/rmiregistry.1 \
		jdk/src/linux/doc/man/schemagen.1 \
		jdk/src/linux/doc/man/serialver.1 \
		jdk/src/linux/doc/man/servertool.1 \
		jdk/src/linux/doc/man/tnameserv.1 \
		jdk/src/linux/doc/man/unpack200.1 \
		jdk/src/linux/doc/man/wsgen.1 \
		jdk/src/linux/doc/man/wsimport.1 \
		jdk/src/linux/doc/man/xjc.1 \
		jdk/src/share/classes/com/sun/org/apache/xml/internal/security/resource/xmlsecurity_en.properties \
		jdk/src/solaris/doc/sun/man/man1/appletviewer.1 \
		jdk/src/solaris/doc/sun/man/man1/extcheck.1 \
		jdk/src/solaris/doc/sun/man/man1/idlj.1 \
		jdk/src/solaris/doc/sun/man/man1/jar.1 \
		jdk/src/solaris/doc/sun/man/man1/jarsigner.1 \
		jdk/src/solaris/doc/sun/man/man1/java.1 \
		jdk/src/solaris/doc/sun/man/man1/javac.1 \
		jdk/src/solaris/doc/sun/man/man1/javadoc.1 \
		jdk/src/solaris/doc/sun/man/man1/javah.1 \
		jdk/src/solaris/doc/sun/man/man1/javap.1 \
		jdk/src/solaris/doc/sun/man/man1/jcmd.1 \
		jdk/src/solaris/doc/sun/man/man1/jconsole.1 \
		jdk/src/solaris/doc/sun/man/man1/jdb.1 \
		jdk/src/solaris/doc/sun/man/man1/jdeps.1 \
		jdk/src/solaris/doc/sun/man/man1/jhat.1 \
		jdk/src/solaris/doc/sun/man/man1/jinfo.1 \
		jdk/src/solaris/doc/sun/man/man1/jjs.1 \
		jdk/src/solaris/doc/sun/man/man1/jmap.1 \
		jdk/src/solaris/doc/sun/man/man1/jps.1 \
		jdk/src/solaris/doc/sun/man/man1/jrunscript.1 \
		jdk/src/solaris/doc/sun/man/man1/jsadebugd.1 \
		jdk/src/solaris/doc/sun/man/man1/jstack.1 \
		jdk/src/solaris/doc/sun/man/man1/jstat.1 \
		jdk/src/solaris/doc/sun/man/man1/jstatd.1 \
		jdk/src/solaris/doc/sun/man/man1/keytool.1 \
		jdk/src/solaris/doc/sun/man/man1/native2ascii.1 \
		jdk/src/solaris/doc/sun/man/man1/orbd.1 \
		jdk/src/solaris/doc/sun/man/man1/pack200.1 \
		jdk/src/solaris/doc/sun/man/man1/policytool.1 \
		jdk/src/solaris/doc/sun/man/man1/rmic.1 \
		jdk/src/solaris/doc/sun/man/man1/rmid.1 \
		jdk/src/solaris/doc/sun/man/man1/rmiregistry.1 \
		jdk/src/solaris/doc/sun/man/man1/schemagen.1 \
		jdk/src/solaris/doc/sun/man/man1/serialver.1 \
		jdk/src/solaris/doc/sun/man/man1/servertool.1 \
		jdk/src/solaris/doc/sun/man/man1/tnameserv.1 \
		jdk/src/solaris/doc/sun/man/man1/unpack200.1 \
		jdk/src/solaris/doc/sun/man/man1/wsgen.1 \
		jdk/src/solaris/doc/sun/man/man1/wsimport.1 \
		jdk/src/solaris/doc/sun/man/man1/xjc.1 \
		nashorn/test/script/jfx.js \
		nashorn/test/script/jfx/kaleidoscope.js \
		nashorn/test/script/jfx/spread.js
SHEBANG_FILES=	configure

_MAKE_JOBS=	#
CPPFLAGS+=	-I${LOCALBASE}/include
LDFLAGS+=	-L${LOCALBASE}/lib
MAKE_ENV=	CLASSPATH="" JAVA_HOME=""
MAKE_ENV+=	IGNORE_OLD_CONFIG=true
MAKE_ENV+=	COMPILER_WARNINGS_FATAL="false"

JDK_BUILDDIR=	${WRKSRC}/build/${JDK_OSARCH}-normal-${JDK_BUILD_JVM}-${JDK_BUILD_TYPE}
.if !defined(BUILD_JRE)
JDK_IMAGEDIR=	${JDK_BUILDDIR}/images/j2sdk-image
JRE_IMAGEDIR=	${JDK_BUILDDIR}/images/j2sdk-image/jre
.else
JRE_IMAGEDIR=	${JDK_BUILDDIR}/images/j2re-image
.endif
JDK_JVMDIR=	lib/${ARCH:S/x86_64/amd64/}
JDK_OSARCH=	bsd-${ARCH:S/amd64/x86_64/:C/armv.*/arm/:S/i386/x86/:S/powerpc64/ppc64/}
INSTALLDIR=	${PREFIX}/${PKGBASE}

NO_CCACHE=		yes
NOPRECIOUSMAKEVARS=	yes

JDK_MAJOR_VERSION=	8
JDK_UPDATE_VERSION=	172
JDK_BUILD_NUMBER=	11
DIST_BUILD_NUMBER=	132
JTREG_VERSION=		4.1
JTREG_BUILD_NUMBER=	b08
JTREG_JENKINS_BUILD=	77

GNU_CONFIGURE=		yes
CONFIGURE_ARGS=		--with-boot-jdk=${BOOTSTRAPJDKDIR}
CONFIGURE_ARGS+=	--with-build-number="b${JDK_BUILD_NUMBER}"
.if ${JDK_UPDATE_VERSION} > 0
CONFIGURE_ARGS+=	--with-update-version=${JDK_UPDATE_VERSION}
.endif
CONFIGURE_ARGS+=	--disable-ccache \
			--disable-freetype-bundling \
			--disable-zip-debug-info \
			--with-cacerts-file=${FILESDIR}/cacerts \
			--with-cups=${LOCALBASE} \
			--with-debug-level=${JDK_BUILD_TYPE} \
			--with-freetype=${LOCALBASE} \
			--with-freetype-include=${LOCALBASE}/include/freetype2 \
			--with-jobs=${MAKE_JOBS_NUMBER} \
			--with-jvm-variants=${JDK_BUILD_JVM} \
			--with-milestone=fcs \
			--with-package-path=${LOCALBASE} \
			--with-zlib=system
CONFIGURE_SCRIPT=	../../configure
CONFIGURE_WRKSRC=	${WRKSRC}/common/autoconf

OPTIONS_DEFINE=		ALSA POLICY TZUPDATE X11 FONTCONFIG
OPTIONS_DEFINE_armv6=	FPUHACK
OPTIONS_DEFINE_armv7=	FPUHACK
OPTIONS_DEFAULT=	POLICY TZUPDATE X11
OPTIONS_DEFAULT_armv6=	FPUHACK
OPTIONS_DEFAULT_armv7=	FPUHACK
FPUHACK_DESC=		Hack denormalized numbers in flush-to-zero mode
POLICY_DESC=		Install the Unlimited Strength Policy Files
TZUPDATE_DESC=		Update the time zone data

FPUHACK_EXTRA_PATCHES=	${PATCHDIR}/fpuhack.patch
POLICY_CONFIGURE_ENABLE=	unlimited-crypto
TZUPDATE_RUN_DEPENDS=	java-zoneinfo>0:java/java-zoneinfo
X11_BUILD_DEPENDS_OFF=	${LOCALBASE}/include/X11/Xlib.h:x11/libX11 \
			${LOCALBASE}/include/X11/extensions/Xdbe.h:x11/libXext \
			${LOCALBASE}/include/X11/extensions/Xrender.h:x11/libXrender \
			${LOCALBASE}/include/X11/Intrinsic.h:x11-toolkits/libXt
X11_CONFIGURE_OFF=	--disable-headful
X11_CONFIGURE_ON=	--with-giflib=system \
			--x-includes=${LOCALBASE}/include \
			--x-libraries=${LOCALBASE}/lib
X11_LIB_DEPENDS=	libgif.so:graphics/giflib \
			libfontconfig.so:x11-fonts/fontconfig
X11_MAKE_ENV_OFF=	BUILD_HEADLESS_ONLY=1 \
			MAKEFLAGS=X_CFLAGS="-I${LOCALBASE}/include"
X11_MAKE_ENV_ON=	MAKEFLAGS=""
X11_USE=		XORG=x11,xext,xi,xrender,xt,xtst
FONTCONFIG_IMPLIES=	X11

JAVAVMS_COMMENT=	OpenJDK${JDK_MAJOR_VERSION}

ALSA_LIB_DEPENDS=	libasound.so:audio/alsa-lib
ALSA_CONFIGURE_ON=	--with-alsa=${LOCALBASE}
ALSA_CONFIGURE_ENV_OFF=	ALSA_NOT_NEEDED=yes

.if !defined(BUILD_JRE)
OPTIONS_DEFINE+=	TEST
OPTIONS_DEFAULT+=	RELEASE ALSA
OPTIONS_SINGLE=		BUILD
OPTIONS_SINGLE_BUILD=	DEBUG DEBUGFAST RELEASE
BUILD_DESC=		Select OpenJDK build type
DEBUG_DESC=		Build for debugging (without optimizations)
DEBUGFAST_DESC=		Build for debugging (with optimizations)
RELEASE_DESC=		Build for release (default)
TEST_DESC=		Run regression tests

DEBUG_VARS=		JDK_BUILD_TYPE=slowdebug
DEBUGFAST_VARS=		JDK_BUILD_TYPE=fastdebug
RELEASE_BUILD_DEPENDS_OFF=	${LOCALBASE}/bin/objcopy:devel/binutils
RELEASE_CONFIGURE_ON=	--disable-debug-symbols
RELEASE_VARS=		JDK_BUILD_TYPE=release
RELEASE_VARS_OFF=	OBJCOPY=${LOCALBASE}/bin/objcopy
TEST_ALL_TARGET=	test
TEST_ALL_TARGET_OFF=	images
TEST_CONFIGURE_ON=	--with-jtreg=${WRKDIR}/jtreg
TEST_DISTFILES=		jtreg${JTREG_VERSION}-${JTREG_BUILD_NUMBER}${EXTRACT_SUFX}:jtreg
.else
ALL_TARGET=		images
CONFIGURE_ARGS+=	--disable-debug-symbols
JAVAVMS_COMMENT+=	JRE
JDK_BUILD_TYPE=		release
.endif

# XXX configure script rejects CC/CPP/CXX with absolute paths.
.for t in CC CPP CXX
.if defined(${t}) && ${${t}:M/*}
BUILD_${t}=	${${t}:C|.*/||g}
CONFIGURE_ENV+=	${t}="${BUILD_${t}}"
TOOLS_DIR+=	${${t}:S|/${BUILD_${t}}$||}
.endif
.endfor
.if defined(TOOLS_DIR)
CONFIGURE_ARGS+=	--with-tools-dir="${TOOLS_DIR:u:S/ /:/g}"
.endif

.include <bsd.port.pre.mk>

BOOTSTRAP_JDKS=	${LOCALBASE}/openjdk8 \
		${LOCALBASE}/openjdk7 \
		${LOCALBASE}/bootstrap-openjdk8

# do we have valid native jdk installed?
.for BJDK in ${BOOTSTRAP_JDKS}
.  if !defined(BOOTSTRAPJDKDIR) && exists(${BJDK}/bin/javac)
BOOTSTRAPJDKDIR=	${BJDK}
.  endif
.endfor

# if no valid jdk found, set dependency
.if !defined(BOOTSTRAPJDKDIR)
BOOTSTRAPJDKDIR=	${WRKDIR}/bootstrap
BOOTSTRAP_DISTFILE=	bootstrap-openjdk8-8.40.25.tar.xz:bootstrap
MAKE_ENV+=		LD_LIBRARY_PATH="${BOOTSTRAPJDKDIR}/jre/lib/amd64"
.endif

.if ${ARCH} == armv6 || ${ARCH} == armv7 || ${ARCH} == i386
# XXX We must limit max heap size for 32-bit targets.
CONFIGURE_ARGS+=	--with-boot-jdk-jvmargs="-Xmx768m"
MAKE_ENV+=	JAVADOC_CMD_MEM="-Xmx768m"
.endif

.if ${ARCH} == i386
# Fix the build for i386 when WITH_LLD_IS_LD is set
# https://bugs.freebsd.org/bugzilla/show_bug.cgi?id=225741
MAKE_ENV+=	LFLAGS="-Wl,-z,notext"
.endif

.if ${ARCH} == x86_64 || ${ARCH} == i386 || ${ARCH} == powerpc64
JDK_BUILD_JVM=	server
.else
JDK_BUILD_JVM=	zero
LIB_DEPENDS+=	libffi.so:devel/libffi
.endif

.if ${COMPILER_TYPE} == clang
.if ${COMPILER_VERSION} >= 35
MAKE_ENV+=	COMPILER_WARNINGS_FATAL=false
.endif
MAKE_ENV+=	USE_CLANG=true
.if ${COMPILER_FEATURES:Mlibc++}
CONFIGURE_ENV+=	LIBCXX="-lc++"
.endif
.endif

# GCC is broken with PCH: https://lists.freebsd.org/pipermail/svn-src-all/2015-March/101722.html
.if ${COMPILER_TYPE} == gcc
.if ${ARCH} == "powerpc64"
MAKE_ARGS+=	USE_PRECOMPILED_HEADER=1
.else
MAKE_ARGS+=	USE_PRECOMPILED_HEADER=0
.endif
.endif

.if empty(ICONV_LIB)
ICONV_CPPFLAGS=	-DLIBICONV_PLUG
.else
ICONV_CPPFLAGS=	-I${LOCALBASE}/include
ICONV_LDFLAGS=	-L${LOCALBASE}/lib ${ICONV_LIB}
.endif

post-extract:
	@${CP} ${FILESDIR}/jdk-test-javax-imageio-plugins-jpeg-truncated.jpg \
	    ${WRKSRC}/jdk/test/javax/imageio/plugins/jpeg/truncated.jpg
	@${CP} ${FILESDIR}/nashorn-test-script-jfx-flyingimage-golden-bsd.png \
	    ${WRKSRC}/nashorn/test/script/jfx/flyingimage/golden/bsd.png
	@${CP} ${FILESDIR}/nashorn-test-script-jfx-kaleidoscope-golden-bsd.png \
	    ${WRKSRC}/nashorn/test/script/jfx/kaleidoscope/golden/bsd.png
	@${CP} ${FILESDIR}/nashorn-test-script-jfx-spread-golden-bsd.png \
	    ${WRKSRC}/nashorn/test/script/jfx/spread/golden/bsd.png

post-extract-TEST-on:
	@${LN} -sf ${WRKDIR}/jtreg/linux/bin ${WRKDIR}/jtreg/

do-patch-FONTCONFIG-on:
	@${PATCH} -d ${PATCH_WRKSRC} < ${PATCHDIR}/fontconfig.patch

post-patch:
	@${FIND} ${WRKSRC} -name '*.orig' -delete
	@${RMDIR} ${WRKSRC}/jdk/src/macosx/classes/java/net \
	    ${WRKSRC}/jdk/src/macosx/native/sun/nio/ch \
	    ${WRKSRC}/jdk/src/macosx/native/sun/nio
	@${SED} -e 's|%%LOCALBASE%%|${LOCALBASE}|' \
	    ${FILESDIR}/bsd.fontconfig.properties.in > \
	    ${WRKSRC}/jdk/src/solaris/classes/sun/awt/fontconfigs/bsd.fontconfig.properties
	@${REINPLACE_CMD} -e 's|%%LOCALBASE%%|${LOCALBASE}|' \
	    -e 's|%%OBJCOPY%%|${OBJCOPY}|' \
	    ${WRKSRC}/configure \
	    ${WRKSRC}/common/autoconf/toolchain.m4 \
	    ${WRKSRC}/jdk/make/lib/Awt2dLibraries.gmk \
	    ${WRKSRC}/jdk/src/share/classes/com/sun/java/swing/plaf/gtk/Metacity.java \
	    ${WRKSRC}/jdk/src/share/classes/sun/print/PSPrinterJob.java \
	    ${WRKSRC}/jdk/src/solaris/classes/sun/nio/fs/BsdFileSystemProvider.java
	@${REINPLACE_CMD} -e 's|/usr/local/share/java/classes|${LOCALBASE}/share/java/classes|' \
	    ${WRKSRC}/jdk/src/bsd/doc/man/*.1
	@${REINPLACE_CMD} -e 's|%%ICONV_CPPFLAGS%%|${ICONV_CPPFLAGS}|' \
	    -e 's|%%ICONV_LDFLAGS%%|${ICONV_LDFLAGS}|' \
	    ${WRKSRC}/jdk/make/lib/Awt2dLibraries.gmk \
	    ${WRKSRC}/jdk/make/lib/CoreLibraries.gmk \
	    ${WRKSRC}/jdk/make/lib/ServiceabilityLibraries.gmk
.if defined(BUILD_JRE)
	@${REINPLACE_CMD} -e 's|-f Images.gmk$$|& jre-image|' \
	    -e 's|-f Images.gmk overlay-images$$|-f Images.gmk jre-overlay-image|' \
	    ${WRKSRC}/jdk/make/BuildJdk.gmk
.endif
	@${CHMOD} 755 ${WRKSRC}/configure

post-patch-ALSA-off:
	@${REINPLACE_CMD} '/EXTRA_SOUND_JNI_LIBS += jsoundalsa/d' \
		${WRKSRC}/jdk/make/lib/SoundLibraries.gmk

post-build:
.if !defined(BUILD_JRE)
	@${BOOTSTRAPJDKDIR}/bin/jar cfe \
	    ${JRE_IMAGEDIR}/lib/compilefontconfig.jar \
	    build.tools.compilefontconfig.CompileFontConfig \
	    -C ${JDK_BUILDDIR}/jdk/btclasses build/tools/compilefontconfig
	@${BOOTSTRAPJDKDIR}/bin/jar cfe \
	    ${JRE_IMAGEDIR}/lib/javazic.jar \
	    build.tools.tzdb.TzdbZoneRulesCompiler \
	    -C ${JDK_BUILDDIR}/jdk/btclasses build/tools/tzdb
.endif

post-build-TZUPDATE-on:
	@# Update time zones
	@${RM} -r ${JRE_IMAGEDIR}/lib/zi
	@${LN} -sf ${LOCALBASE}/share/java/zi ${JRE_IMAGEDIR}/lib

do-install:
	@${MKDIR} ${STAGEDIR}${INSTALLDIR}
.if !defined(BUILD_JRE)
	@cd ${JDK_IMAGEDIR} && ${COPYTREE_SHARE} . ${STAGEDIR}${INSTALLDIR}
	@cd ${STAGEDIR}${INSTALLDIR} && \
	${FIND} bin jre/bin -type f -exec ${CHMOD} ${BINMODE} {} \; && \
	${CHMOD} ${BINMODE} jre/${JDK_JVMDIR}/jexec \
	    jre/${JDK_JVMDIR}/jspawnhelper ${JDK_JVMDIR}/jexec
	cd ${STAGEDIR}${INSTALLDIR}/include && ln -s dragonfly freebsd
	@${ECHO} "@dir ${INSTALLDIR}/jre/lib/applet" >> ${TMPPLIST}
.else
	@cd ${JRE_IMAGEDIR} && ${COPYTREE_SHARE} . ${STAGEDIR}${INSTALLDIR}
	@cd ${STAGEDIR}${INSTALLDIR} && \
	${FIND} bin -type f -exec ${CHMOD} ${BINMODE} {} \; && \
	${CHMOD} ${BINMODE} ${JDK_JVMDIR}/jexec ${JDK_JVMDIR}/jspawnhelper
	@${ECHO} "@dir ${INSTALLDIR}/lib/applet" >> ${TMPPLIST}
.endif
	@${ECHO} "@javavm ${INSTALLDIR}/bin/java" >> ${TMPPLIST}
	@${FIND} ${STAGEDIR}${INSTALLDIR} -not -type d | ${SORT} | \
	    ${SED} -e 's|^${STAGEDIR}${PREFIX}/||' >> ${TMPPLIST}

.include <bsd.port.post.mk>
