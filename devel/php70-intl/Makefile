# Created by: Alex Dupre <ale@FreeBSD.org>
# $FreeBSD$

PORTREVISION=	1
CATEGORIES=	devel

MASTERDIR=	${.CURDIR}/../../lang/php70

PKGNAMESUFFIX=	-intl
USE_CXXSTD=	c++11

USES=		compiler:c++11-lib
USE_CXXSTD=	gnu++11

CPPFLAGS+=	-DU_USING_ICU_NAMESPACE=1

.include "${MASTERDIR}/Makefile"
