
$FreeBSD: head/textproc/agrep/files/patch-utilities.c 340725 2014-01-22 17:40:44Z mat $

--- utilities.c.orig	Fri Jan 17 20:14:43 1992
+++ utilities.c	Sun Jul 21 03:50:47 2002
@@ -2,6 +2,7 @@
    and manipulating regular expression syntax trees.	*/
 
 #include <stdio.h>
+#include <stdlib.h>
 #include "re.h"
 
 /************************************************************************/
