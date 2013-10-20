# Created by: Rusmir Dusko <nemysis@FreeBSD.org>
# $FreeBSD: Mk/Uses/pure.mk 330779 2013-10-18 22:12:37Z nemysis $
#
# Provide support for Pure Programming Language based projects
#
# MAINTAINER= nemysis@FreeBSD.org
#
# Feature:		pure
# Usage:		USES=pure or USES=pure:ARGS
# Valid ARGS:		ffi
# ARGS description:
# ffi			makes the port depends on pure-ffi at runtime
#

.if !defined(_INCLUDE_USES_PURE_MK)
_INCLUDE_USES_PURE_MK=	yes

_valid_ARGS=		ffi
_pure_ARGS=		${pure_ARGS:C/\:/ /g}

# Sanity check
.if defined(pure_ARGS) && ${_pure_ARGS} != ffi
IGNORE=Incorrect 'USES+= pure:${pure_ARGS}' usage: argument [${pure_ARGS}] is not recognized
.endif

LIB_DEPENDS+=	libpure.so:${PORTSDIR}/lang/pure
.include "${PORTSDIR}/Mk/Uses/gmake.mk"

.if ${_pure_ARGS:Mffi}
RUN_DEPENDS+=	${LOCALBASE}/lib/pure/ffi.pure:${PORTSDIR}/devel/pure-ffi
.endif

MAKE_ARGS+=	prefix=${PREFIX} mandir=${PREFIX}/man \
		CC="${CC}" CFLAGS="${CFLAGS}" \
		CXX="${CXX}" CXXFLAGS="${CXXFLAGS}" \
		CPPFLAGS+=-I${LOCALBASE}/include \
		LDFLAGS+=-L${LOCALBASE}/lib

.endif #!defined(_INCLUDE_USES_PURE_MK)
