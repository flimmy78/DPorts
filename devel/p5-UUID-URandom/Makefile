# $FreeBSD$

PORTNAME=	UUID-URandom
PORTVERSION=	0.001
CATEGORIES=	devel perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	perl@FreeBSD.org
COMMENT=	UUIDs based on /dev/urandom or the Windows Crypto API

LICENSE=	ART10 GPLv1+
LICENSE_COMB=	dual

RUN_DEPENDS=	p5-Crypt-URandom>=0.36:security/p5-Crypt-URandom
BUILD_DEPENDS:=	${RUN_DEPENDS}

USES=		perl5
USE_PERL5=	configure

.include <bsd.port.mk>
