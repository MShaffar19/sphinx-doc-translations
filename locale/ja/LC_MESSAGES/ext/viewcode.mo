Þ          <               \   B   ]   ¢       Æ  C    
  `   §  Â     ;  Ë   :mod:`sphinx.ext.viewcode` -- Add links to highlighted source code There are currently no configuration values for this extension; you just need to add ``'sphinx.ext.viewcode'`` to your :confval:`extensions` value for it to work. This extension looks at your Python object descriptions (``.. class::``, ``.. function::`` etc.) and tries to find the source files where the objects are contained.  When found, a separate HTML page will be output for each module with a highlighted version of the source code, and a link will be added to all object descriptions that leads to the source code of the described object.  A link back from the source to the description will also be inserted. Project-Id-Version:  sphinx-doc-1.2.0
Report-Msgid-Bugs-To: 
POT-Creation-Date: 2015-03-11 04:27+0000
PO-Revision-Date: 2015-03-11 05:43+0000
Last-Translator: Takayuki Shimizukawa <shimizukawa@gmail.com>
Language-Team: Japanese (http://www.transifex.com/sphinx-doc/sphinx-doc-1_2_0/language/ja/)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Generated-By: Babel 2.1.1
 :mod:`sphinx.ext.viewcode` -- ãã¤ã©ã¤ãæ¸ã¿ã®ã½ã¼ã¹ã³ã¼ãã¸ã®ãªã³ã¯ãè¿½å  åä½ãããããã«ã¯ã ``'sphinx.ext.viewcode'`` ã :confval:`extensions` ã«è¿½å ããå¿è¦ãããã¾ãããç¾å¨ã¯ãã®æ¡å¼µã¯ããä»¥å¤ã®è¨­å®å¤ãæã¡ã¾ããã ãã®æ¡å¼µã¯ãPythonã®ãªãã¸ã§ã¯ãèª¬æ(``.. class::``, ``.. function::`` ãªã©)ããã®ãªãã¸ã§ã¯ããå«ã¾ããã½ã¼ã¹ã³ã¼ããæ¢ãã«è¡ãã¾ããããè¦ã¤ããã°ãããããã®ã¢ã¸ã¥ã¼ã«ãã¨ã«ãã¤ã©ã¤ããããã½ã¼ã¹ã³ã¼ãã®HTMLãã¼ã¸ãåºåãããã¹ã¦ã®èª¬æãªãã¸ã§ã¯ãããã®ãªã³ã¯ãè¿½å ããã¾ããããã«ãããèª¬æãªãã¸ã§ã¯ãã®ã½ã¼ã¹ã³ã¼ããè¦ã«è¡ããã¨ãã§ãã¾ããã¾ããèª¬æãªãã¸ã§ã¯ãã¸ã®éãªã³ã¯ãæ¿å¥ããã¾ãã 