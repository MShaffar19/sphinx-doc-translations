Þ          L               |   ô   }       r  }     Â       Ô    q            Ï   ¿  "    ©  ²	   An extension is simply a Python module.  When an extension is loaded, Sphinx imports this module and executes its ``setup()`` function, which in turn notifies Sphinx of everything the extension offers -- see the extension tutorial for examples. Developing extensions for Sphinx Since many projects will need special features in their documentation, Sphinx is designed to be extensible on several levels. The configuration file itself can be treated as an extension if it contains a ``setup()`` function.  All other extensions to load must be listed in the :confval:`extensions` configuration value. This is what you can do in an extension: First, you can add new :term:`builder`\s to support new output formats or actions on the parsed documents.  Then, it is possible to register custom reStructuredText roles and directives, extending the markup.  And finally, there are so-called "hook points" at strategic places throughout the build process, where an extension can register a hook and run specialized code. Project-Id-Version:  sphinx-doc-1.2.0
Report-Msgid-Bugs-To: 
POT-Creation-Date: 2015-03-11 04:27+0000
PO-Revision-Date: 2015-03-11 05:43+0000
Last-Translator: Takayuki Shimizukawa <shimizukawa@gmail.com>
Language-Team: Japanese (http://www.transifex.com/sphinx-doc/sphinx-doc-1_2_0/language/ja/)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Generated-By: Babel 2.1.1
 Sphinxæ¡å¼µã¯ã·ã³ãã«ãªPythonã¢ã¸ã¥ã¼ã«ã§ããæ¡å¼µæ©è½ãã­ã¼ããããæã«ã¯ãSphinxã¯ãã®ã¢ã¸ã¥ã¼ã«ãã¤ã³ãã¼ããã¦ãã¢ã¸ã¥ã¼ã«åã«ãã\ ``setup()``\ é¢æ°ãå¼ã³åºãã¾ãããã®é¢æ°ã®ä¸­ã§ã¯æ¡å¼µæ©è½ãæä¾ãããã®ãSphinxã«ç¥ããã¾ããè©³ããã¯Sphinxæ¡å¼µã®ãã¥ã¼ããªã¢ã«ã®ä¾ãè¦ã¦ãã ããã Developing extensions for Sphinx å¤ãã®ãã­ã¸ã§ã¯ãã¯ãã­ã¥ã¡ã³ãã®ä½æã«é¢ãã¦ç¹å¥ãªæ©è½ãå¿è¦ã¨ããã§ããããSphinxã¯ãã¾ãã¾ãªã¬ãã«ã§æ¡å¼µãã§ããããã«è¨­è¨ããã¦ãã¾ãã è¨­å®ãã¡ã¤ã«ãã®ãã®ãã\ ``setup()``\ é¢æ°ãæã£ã¦ããå ´åã«ã¯æ¡å¼µæ©è½ã¨ãã¦æ±ããã¾ããããä»¥å¤ã®ã­ã¼ããå¿è¦ãªãã¹ã¦ã®æ¡å¼µæ©è½ã¯ãè¨­å®ãã¡ã¤ã«ã®ä¸­ã® :confval:`extensions` ã®ä¸­ã«ãªã¹ãã¢ãããã¦ãã ããã æ¡å¼µæ©è½ãéãã¦ã§ãããã¨ã¯ä¸»ã«ï¼ã¤ããã¾ããä¸ã¤ç®ã¯æ°ããåºåå½¢å¼ã«å¯¾å¿ãããããã­ã¥ã¡ã³ããã¼ã¹æã®æ°ããã¢ã¯ã·ã§ã³ããµãã¼ãããããã«ã\ :term:`ãã«ãã¼`\ ãè¿½å ãããã¨ãã§ãã¾ããäºã¤ç®ã¯ãreStructuredTextç¨ã®ãæ°ããã«ã¹ã¿ã ã®ã­ã¼ã«ããã£ã¬ã¯ãã£ããè¿½å ãããããã¼ã¯ã¢ãããæ¡å¼µããããããã¨ãã§ãã¾ããä¸ã¤ç®ã¯"ããã¯ãã¤ã³ã"ã¨å¼ã°ãããã®ã§ããã«ããã­ã»ã¹ã®ãã¾ãã¾ãªç®æã«å­å¨ãã¦ãã¦ãç¹å¥ãªã³ã¼ããå®è¡ããããã®ããã¯ãç»é²ãããã¨ãã§ãã¾ãã 