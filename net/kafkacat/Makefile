# Created by: Victor Yagofarov <xnasx@yandex.ru>
# $FreeBSD$

PORTNAME=	kafkacat
PORTVERSION=	1.3.1
CATEGORIES=	net

MAINTAINER=	ports@FreeBSD.org
COMMENT=	Generic command line non-JVM Apache Kafka producer and consumer

LICENSE=	BSD2CLAUSE
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	bash:shells/bash \
		pkg-config:devel/pkgconf
LIB_DEPENDS=	librdkafka.so:net/librdkafka

USE_GITHUB=	yes
GH_ACCOUNT=	edenhill

PLIST_FILES=	bin/kafkacat

USES=	gmake
GNU_CONFIGURE=	yes

post-install:
	${STRIP_CMD} ${STAGEDIR}${PREFIX}/bin/kafkacat

.include <bsd.port.mk>
