# $FreeBSD$

PORTNAME=	conduit-extra
PORTVERSION=	1.3.0
PORTREVISION=	2
CATEGORIES=	devel haskell

MAINTAINER=	haskell@FreeBSD.org
COMMENT=	Batteries included conduit: adapters for common libraries

LICENSE=	MIT

USE_CABAL=	attoparsec>=0.10 blaze-builder>=0.3 conduit>=1.1 \
		monad-control network>=2.3 primitive>=0.5 resourcet>=1.1 \
		streaming-commons>=0.1.11 transformers-base typed-process

.include "${.CURDIR}/../../lang/ghc/bsd.cabal.mk"
.include <bsd.port.mk>
