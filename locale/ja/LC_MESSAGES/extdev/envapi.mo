Þ          ä               ¬     ­     ¼  B   Ð       7   3  g   k     Ó  @   é  F   *  '   q       ð   ©  ¡     A   <  )   ~  7   ¨  5   à  _     *   v  ;   ¡  8   Ý  >     ¥   U  B   û    >  
   Û	     æ	     
     
  `   §
            O     e   í  <   S         ¯  ×   B  }     8     C   Ñ  Z     ]   p  E   Î  C     N   X  `   §  Ò     {   Û   **Attributes** **Utility methods** *filename* should be absolute or relative to the source directory. A set of all existing docnames. Add *filename* as a dependency of the current document. Add the current document to the list of documents that will automatically be re-read at the next build. Build environment API Dictionary mapping docnames to "metadata" (see :ref:`metadata`). Dictionary mapping docnames to the docutils node for their main title. Directory for storing pickled doctrees. Emit a warning. If *base* is True, return absolute path under self.srcdir. If *base* is None, return relative path to self.srcdir. If *base* is a path string, return absolute path under that. If *suffix* is not None, add it instead of config.source_suffix. In the input "filename", absolute filenames are taken as relative to the source dir, while relative filenames are relative to the dir of the containing document. Like :meth:`warn`, but with source information taken from *node*. Reference to the :class:`.Config` object. Reference to the :class:`.Sphinx` (application) object. Return a serial number, e.g. for index entry targets. Return paths to a file referenced from a document, relative to documentation root and absolute. Return the filename for the document name. Returns the docname of the document currently being parsed. Source directory (the directory containing ``conf.py``). The number is guaranteed to be unique in the current document. This differs from using ``app.warn()`` in that the warning may not be emitted instantly, but collected for emitting all warnings after the update of the environment. This means that the document will be rebuilt if this file changes. Project-Id-Version:  sphinx-doc-1.2.0
Report-Msgid-Bugs-To: 
POT-Creation-Date: 2015-03-11 04:27+0000
PO-Revision-Date: 2015-10-12 07:13+0000
Last-Translator: Takayuki Shimizukawa <shimizukawa@gmail.com>
Language-Team: Japanese (http://www.transifex.com/sphinx-doc/sphinx-doc-1_2_0/language/ja/)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Generated-By: Babel 2.1.1
 **å±æ§** **ã¦ã¼ãã£ãªãã£é¢æ°** \ *filename*\ ã¯çµ¶å¯¾ãã¹ãããã¯ãã½ã¼ã¹ãã£ã¬ã¯ããªããã®ç¸å¯¾ãã¹ã§æå®ããå¿è¦ãããã¾ãã å­å¨ãã¦ããå¨docname ç¾å¨ã®ãã­ã¥ã¡ã³ãã¨ã®ä¾å­é¢ä¿ãç¤ºãããã® *filename* ãè¿½å ãã¾ãã ç¾å¨ã®ãã­ã¥ã¡ã³ãããæ¬¡åãã«ãã®éã«èªååèª­ã¿è¾¼ã¿ãããã­ã¥ã¡ã³ãä¸è¦§ã«è¿½å ãã¾ãã ãã«ãç°å¢API docnameãã¡ã¿ãã¼ã¿ã«ãããã³ã°ããããã®ãã£ã¯ã·ã§ããª docnameãdocutilã®ã¡ã¤ã³ã¿ã¤ãã«ã®ãã¼ãã«ãããã³ã°ããããã®è¾æ¸ã§ãã pickleåããã doctree ãæ ¼ç´ãããã£ã¬ã¯ããª è­¦åãçºçããã¾ãã \ *base*\ ãTrueã®å ´åã«ã¯ãself.srcdirä»¥ä¸ã®çµ¶å¯¾ãã¹ãè¿ãã¾ãã
\ *base*\ ãNoneã®å ´åã«ã¯ãself.srcdirããã®ç¸å¯¾ãã¹ãè¿ãã¾ãã
\ *base*\ ããã¹ãè¡¨ãæå­åã§ããã°ãããä»¥ä¸ã®çµ¶å¯¾ãã¹ãè¿ãã¾ãã
*suffix* ãNoneã§ãªãå ´åã«ã¯ããããconfig.source_suffixã®ä»£ããã«ãµãã£ãã¯ã¹ã¨ãã¦è¿½å ããã¾ãã "filename"ãçµ¶å¯¾ãã¹ã§ããã°ãã½ã¼ã¹ãã£ã¬ã¯ããªããã®ç¸å¯¾ãã¹ã¨ã¿ãªããã¾ãã*filename*ãç¸å¯¾ãã¹ã§ããã°ããã­ã¥ã¡ã³ãããã®ç¸å¯¾ãã¹ã¨ã¿ãªããã¾ãã \ :meth:`warn`\ ã¨ä¼¼ã¦ãã¾ããã\ *node*\ ãæã£ã¦ããã½ã¼ã¹æå ±ã¨ã¨ãã«è­¦åãçºçããã¾ãã :class:`.Config` ãªãã¸ã§ã¯ãã¸ã®åç§ã§ãã :class:`.Sphinx` (application) ãªãã¸ã§ã¯ãã¸ã®åç§ã§ã ã¤ã³ããã¯ã¹ãªã©ã§ç¨ããããã®ãã·ãªã¢ã«ãã³ãã¼ãè¿ãã¾ãã ãããã­ã¥ã¡ã³ãã«é¢é£ãããç¸å¯¾ãã¹ã¾ãã¯çµ¶å¯¾ãã¹ãè¿ãã¾ãã ãã­ã¥ã¡ã³ãåã«é¢é£ãããã¡ã¤ã«åãè¿ãã¾ãã ç¾å¨ã®ãã­ã¥ã¡ã³ãã«å¯¾å¿ããdocnameãè¿ãã¾ãã ã½ã¼ã¹ãã£ã¬ã¯ããª (\ ``conf.py``\ ãå«ã¾ãããã£ã¬ã¯ããª) ã·ãªã¢ã«çªå·ã¯ãç¾å¨ã®ææ¸ã®ãªãã§ä¸æã§ãããã¨ãä¿è¨¼ããã¾ãã ``app.warn()`` ãä½¿ç¨ããã®ã¨ã¯ç°ãªããè­¦åã¯å³æã«ã¯çºè¡ãããããã¹ã¦ã®ç°å¢ã¢ãããã¼ããæ¸ãã§ãããã¹ã¦ã®è­¦åãçºè¡ãããããã¾ã¨ãããã¾ãã ããã«ãããä¾å­ãã¡ã¤ã«ã«å¤æ´ãçããéã«ã¯ç¾å¨ã®ãã­ã¥ã¡ã³ãããªãã«ãããã¾ãã 