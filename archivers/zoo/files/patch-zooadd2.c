--- ./zooadd2.c.orig	1991-07-20 01:38:10.000000000 +0200
+++ ./zooadd2.c	2011-12-22 14:00:55.000000000 +0100
@@ -258,12 +258,15 @@
 register struct direntry *direntry;
 {
 #ifdef GETTZ
+	long mstonix();
 	long gettz();
+	long t;
 #endif
    direntry->zoo_tag = ZOO_TAG;
    direntry->type = 2;                  /* type is now 2 */
 #ifdef GETTZ
-	direntry->tz = gettz() / (15 * 60); /* seconds => 15-min units */
+	t = mstonix (direntry->date, direntry->time);
+	direntry->tz = gettz(t) / (15 * 60); /* seconds => 15-min units */
 #else
    direntry->tz = NO_TZ;                /* timezone unknown */
 #endif
