Þ    H      \                *     Ð   È  &     ø   À    ¹  L   Ô  L   !  /   n  ,     &   Ë  )   ò  Æ   	  ã   ã	  W   Ç
  ,     "   L  G   o  «   ·  6   c  Ô    9   o  	   ©     ³  $   À  :   å       !   "  ë   D  ¤   0     Õ  Ô   W  d   ,          ­     Â  W   ß  1   7     i  *   u           ¸  C   C  .         ¶  #   ×     û  t     A   |  Ã   ¾  ­        0  Ã   ·  p   {  =   ì     *  $   6     [  %   x  %     ,   Ä  <   ñ  |   .  ?   «  s   ë     _     z  8        Î     ë     q  >       Æ  ,   c  C    '   Ô   *  ü   H  '"  g   p#  u   Ø#  L   N$  W   $  J   ó$  J   >%  a  %    ë&  v   ÷'  0   n(  ?   (  q   ß(  Ó   Q)  Z   %*    *  ^   ,     g,     n,  $   s,  U   ,  ^  î,  -   M.  b  {.  æ   Þ/     Å0  3  U1     2  )   3  	   ?3  &   I3     p3  V   4     b4  A   x4  -   º4  ·   è4  U    5  C   ö5  @   :6     {6     6     ¦6  _   @7  ù    7  Ø   8     s9  ,  :  «   3;  S   ß;     3<  9   :<      t<  A   <  E   ×<  >   =  N   \=     «=  j   1>  ³   >     P?     k?  8   ?     ¿?  À   Ü?  :   @  >   Ø@   (after acceptance) translate on transifex. **gettext** [1]_ is an established standard for internationalization and localization.  It naively maps messages in a program to a translated string. Sphinx uses these facilities to translate whole documents. Add configurations to your `conf.py`:: After Sphinx successfully ran the :class:`~sphinx.builders.gettext.MessageCatalogBuilder` you will find a collection of ``.pot`` files in your output directory.  These are **catalog templates** and contain messages in your original language *only*. An example: you have a document ``usage.rst`` in your Sphinx project.  The gettext builder will put its messages into ``usage.pot``.  Imagine you have Spanish translations [2]_ on your hands in ``usage.po`` --- for your builds to be translated you need to follow these instructions: Another case, msgid is multi-line text and contains reStructuredText syntax: As a result, many pot files are generated under ``_build/locale`` directory. Because nobody expects the Spanish Inquisition! Build mo files and make translated document. Build po files into mo and make html:: Click ``Request language`` and fill form. Compile your message catalog to a locale directory, say ``locale``, so it ends up in ``./locale/es/LC_MESSAGES/usage.mo`` in your source directory (where ``es`` is the language code for Spanish.) :: Complementary to translations provided for Sphinx-generated messages such as navigation bars, Sphinx provides mechanisms facilitating *document* translations in itself.  See the :ref:`intl-options` for details on configuration. Congratulations! You got the translated documentation in the ``_build/html`` directory. Contributing to Sphinx reference translation Create config files for tx command Create your transifex_ account and create new project for your document Currently, transifex does not allow for a translation project to have more than one version of the document, so you'd better include a version number in your project name. Done. You got these directories that contain po files: Every single element in the doctree will end up in a single message which results in lists being equally split into different chunks while large paragraphs will remain as coarsely-grained as they were in the original document.  This grants seamless document updates while still providing a little bit of context for translators in free-text passages.  It is the maintainer's task to split up paragraphs which are too large as there is no sane automated way to do that. Extract document's translatable messages into pot files:: Footnotes For example: Forward the translation on transifex Get translated catalogs and build mo files (ex. for 'de'): Gettext compiles them into a binary format known as **binary catalogs** through :program:`msgfmt` for efficiency reasons.  If you make these files discoverable with :confval:`locale_dirs` for your :confval:`language`, Sphinx will pick them up automatically. Go to `sphinx translation page`_. If a document is updated, it is necessary to generate updated pot files and to apply differences to translated po files. In order to apply the updating difference of a pot file to po file, use the :command:`sphinx-intl update` command. If you want to push all language's po files, you can be done by using :command:`tx push -t` command. Watch out! This operation overwrites translations in transifex. In other words, if you have updated each in the service and local po files, it would take much time and effort to integrate them. Initially project maintainers have to collect all translatable strings (also referred to as *messages*) to make them known to translators.  Sphinx extracts these through invocation of ``sphinx-build -b gettext``. Install `sphinx-intl`_ by :command:`pip install sphinx-intl` or :command:`easy_install sphinx-intl`. Install `transifex-client`_ Internationalization Login to transifex_ service. Please be careful not to break reST notation.  Most po-editors will help you with that. Pull translated po files and make translated html Quick guide Register pot files to ``.tx/config`` file: Run your desired build. See the `GNU gettext utilites <http://www.gnu.org/software/gettext/manual/gettext.html#Introduction>`_ for details on that software suite. Set :confval:`language` to ``es`` (also possible via :option:`-D`). Set :confval:`locale_dirs` to ``["locale/"]``. Setup/Update your `locale_dir`:: Sphinx internationalization details That's all! The recommended way for new contributors to translate Sphinx reference is to join the translation team on Transifex. There is `sphinx translation page`_ for Sphinx-1.2 documentation. They can be delivered to translators which will transform them to ``.po`` files --- so called **message catalogs** --- containing a mapping from the original messages to foreign-language strings. This case-study assumes that :confval:`locale_dirs` is set to 'locale/' and :confval:`gettext_compact` is set to `False` (the Sphinx document is already configured as such). This process will create ``.tx/config`` in the current directory, as well as a ``~/.transifexrc`` file that includes auth information. Transifex_ is one of several services that allow collaborative translation via a web interface.  It has a nifty Python-based command line client that makes it easy to fetch and push translations. Translate po file under ``./locale/de/LC_MESSAGES`` directory. The case of builders.po file for sphinx document: Translate your po files under `./locale/<lang>/LC_MESSAGES/`. Translating Translating locally and on Transifex Translating with sphinx-intl Update your po files by new pot files Upload pot files to transifex service Using Transifex service for team translation Wait acceptance by transifex sphinx translation maintainers. Workflow visualization of translations in Sphinx.  (The stick-figure is taken from an `XKCD comic <http://xkcd.com/779/>`_.) You need :command:`tx` command to upload resources (pot files). You need a :confval:`language` parameter in ``conf.py`` or you may also specify the parameter on the command line:: `./locale/de/LC_MESSAGES/` `./locale/ja/LC_MESSAGES/` `Transifex Client v0.8 &mdash; Transifex documentation`_ ``sphinx-document-test_1_0`` `sphinx-intl`_ is a useful tool to work with Sphinx translation flow. This section describe a easy way to translate with sphinx-intl. and upload pot files: https://www.transifex.com/projects/p/sphinx-document-test_1_0/ Project-Id-Version:  sphinx-doc-1.2.0
Report-Msgid-Bugs-To: 
POT-Creation-Date: 2015-03-11 04:27+0000
PO-Revision-Date: 2015-09-13 05:59+0000
Last-Translator: Takayuki Shimizukawa <shimizukawa@gmail.com>
Language-Team: Japanese (http://www.transifex.com/sphinx-doc/sphinx-doc-1_2_0/language/ja/)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Generated-By: Babel 2.1.1
 (æ¿èªå¾)transifexä¸ã§ç¿»è¨³ãã¾ãã **gettext** [1]_ ã¯å½éåã¨ã­ã¼ã«ã«åã®ææ®µã¨ãã¦ãããä½¿ç¨ããã¦ããæ¹æ³ã§ãããã­ã°ã©ã ä¸­ã§ä½¿ç¨ãããã¡ãã»ã¼ã¸ã¨ãç¿»è¨³æå­åã®å¯¾å¿è¡¨ãä½¿ã£ã¦ç½®ãæãã¦ãã¾ããSphinxã¯ãã®æ©è½ãä½¿ã£ã¦ããã­ã¥ã¡ã³ãå¨ä½ãç¿»è¨³ãã¦ããã¾ãã `conf.py` ã«è¨­å®ãè¿½å ãã¾ã:: Sphinxã® :class:`~sphinx.builders.gettext.MessageCatalogBuilder` ã®å®è¡ãå®äºããã¨ã ``.pot`` ãã¡ã¤ã«ç¾¤ãåºåãã£ã¬ã¯ããªã«åºåããã¾ãããããã¯ **ã«ã¿ã­ã°ãã³ãã¬ã¼ã** ã¨å¼ã°ããåã®è¨èªã®ã¡ãã»ã¼ã¸ **ã®ã¿** ãå«ã¾ãã¾ãã ä¾: ``usage.rst`` ã¨ãããã­ã¥ã¡ã³ããããã¨ãã¾ããgettext ãã«ãã¼ã¯æç« ã ``usage.pot`` ã«æ¸ãåºãã¾ãã ``usage.po`` ã®ã¹ãã¤ã³èªç¿»è¨³ [2]_ ããããã¨ãã¾ãããã --- ç¿»è¨³ããããã­ã¥ã¡ã³ãããã«ãããã«ã¯ä»¥ä¸ã®ããã«ããå¿è¦ãããã¾ãã å¥ã®å ´åã¨ãã¦ãmsgid ãè¤æ°è¡ã®ãã­ã¹ãã§ reStructuredText ã®æ§æãå«ãå ´å: ãããããã¨ã§å¤ãã® pot ãã¡ã¤ã«ã ``_build/locale`` ãã£ã¬ã¯ããªä»¥ä¸ã«çæããã¾ãã ãªããªãèª°ãã¹ãã¤ã³ç°ç«¯å¯©åãæå¾ãã¦ããªããã§ã! mo ãã¡ã¤ã«ããã«ãããç¿»è¨³ããããã­ã¥ã¡ã³ããçæãã¾ãã poãã¡ã¤ã«ãmoãã¡ã¤ã«ã«å¤æããmake htmlãå®è¡ãã¾ã: ``Request language``ããã¯ãªãã¯ãããã©ã¼ã ãåãã¾ãã ã¡ãã»ã¼ã¸ã«ã¿ã­ã°ãã³ã³ãã¤ã«ãã¦ãlocaleãã£ã¬ã¯ããªã«ç½®ãã¾ãããã®ãã£ã¬ã¯ããªåã ``locale`` ã ã¨ããã¨ãã½ã¼ã¹ãã£ã¬ã¯ããªåã® ``./locale/es/LC_MESSAGES/usage.mo`` ã¨ããå ´æã«ãã¤ããªã«ã¿ã­ã°ãç½®ããããã¨ã«ãªãã¾ã( ``es`` ã¯ã¹ãã¤ã³èªã®è¨èªã³ã¼ã):: Sphinxã§ã¯ãããã²ã¼ã·ã§ã³ãã¼ãªã©ã®æå­åãåå½èªã«ããæ©è½ãæä¾ãã¦ãã¾ãããã **æç« ** ãã®ãã®ãç¿»è¨³ããæ©è½ãæä¾ãã¾ããç´°ããè¨­å®ã«ã¤ãã¦ã¯ :ref:`intl-options` ãåç§ãã¦ãã ããã ããã§ã¨ããããã¾ã!! ``_build/html`` ä»¥ä¸ã«ç¿»è¨³ããããã­ã¥ã¡ã³ããçæããã¾ããã Sphinxãã­ã¥ã¡ã³ãã®ç¿»è¨³ã«è²¢ç®ãã tx ã³ãã³ãã®ããã«è¨­å®ãã¡ã¤ã«ãä½æãã¾ã transifex_ ã®ã¢ã«ã¦ã³ããä½æãããã­ã¥ã¡ã³ãç¨ã«æ°è¦ãã­ã¸ã§ã¯ããä½æãã¾ãã ç¾å¨ã®ã¨ãããtransifexã¯1ã¤ã®ç¿»è¨³ãã­ã¸ã§ã¯ãã«è¤æ°ã®ãã¼ã¸ã§ã³ãæã¦ã¾ããããã®ããããã­ã¸ã§ã¯ãåã«ãã¼ã¸ã§ã³çªå·ãå«ããã®ãè¯ãã§ãããã ã§ãã¾ããããã£ã¬ã¯ããªã®ä¸­ã«ã¯poãã¡ã¤ã«ãåºæ¥ã¦ãã¯ãã§ã: ãã¹ã¦doctreeã®è¦ç´ ã¯ããããããã¡ãã»ã¼ã¸ã¨ãªãã¾ããå·¨å¤§ãªãã©ã°ã©ãã¯åæã®ã¾ã¾æ®ãã¾ããããã¯ãç¿»è¨³èã«ã³ã³ãã­ã¹ãæå ±ãä¸ãã¯ãã¾ãããç¶ãç®ã®ãªããã­ã¥ã¡ã³ããçæããã¾ããå·¨å¤§ãªãã©ã°ã©ããåå²ããã®ã¯ã¡ã³ããã¼ã®å½¹å²ã§ãèªååãããæ¹æ³ã¯ããã¾ããã ãã­ã¥ã¡ã³ãã®ç¿»è¨³å¯è½ãªã¡ãã»ã¼ã¸ã pot ãã¡ã¤ã«ã«å±éãã¾ãã:: èæ³¨ ä¾: transifexä¸ã§ç¿»è¨³ãé²ãã¾ã ç¿»è¨³æ¸ã¿ã«ã¿ã­ã°ãåå¾ãã moãã¡ã¤ã«ãä½æãã¾ã (ä¾: 'de'): gettextã® :program:`msgfmt` ã³ãã³ããä½¿ãããã¤ããªå½¢å¼ã§å¹çè¯ã **ãã¤ããªã«ã¿ã­ã°** ã«ã³ã³ãã¤ã«ãã¾ãã :confval:`language` ãªãã·ã§ã³ã¨ã :confval:`locale_dirs` è¨­å®ã®å ´æã«ãããã®ãã¤ããªã«ã¿ã­ã°ãç½®ãã¨ãSphinxã¯ãããã®ãã¡ã¤ã«ãèª­ã¿è¾¼ãã§ä½¿ç¨ãã¾ãã `sphinx translation page`_ ã«è¡ãã¾ãã ãããã­ã¥ã¡ã³ããã¢ãããã¼ããããããã¢ãããã¼ãããã potãã¡ã¤ã«ãååº¦çæãããã¨ã¨å¤æ´ãç¿»è¨³æ¸ã¿poãã¡ã¤ã«ã¸é©ç¨ããå¿è¦ãããã¾ããpotãã¡ã¤ã«ã®ã¢ãããã¼ãå·®åãpoãã¡ã¤ã«ã¸é©ç¨ããã«ã¯ã :command:`sphinx-intl update` ã³ãã³ããå©ç¨ãã¾ãã ããå¨ã¦ã®è¨èªã®poãã¡ã¤ã«ãããã·ã¥ããããªãã :command:`tx push -t`  ã§å®è¡ãå¯è½ã§ãããããè¦ã¦ã¿ã¾ãããï¼ãã®ãªãã¬ã¼ã·ã§ã³ã¯Transifexä¸ã®ç¿»è¨³ãä¸æ¸ããã¾ãã ã¤ã¾ããæ´æ°ããåãµã¼ãã¹ã¨ã­ã¼ã«ã«poãã¡ã¤ã«ã¨ãå¤ãã®æéã¨ããããçµ±åããå´åããããã¾ãã ã¾ãæåã«ããã­ã¸ã§ã¯ãã®ã¡ã³ããã¼ã¯ãã¹ã¦ã®ç¿»è¨³æå­åãéãã¦ããå¿è¦ãããã¾ã(ããã **ã¡ãã»ã¼ã¸** ã¨å¼ã¶)ããããç¿»è¨³èã«æ¸¡ãã¾ããSphinxã§ã¯ã ``sphinx-build -b gettext`` ãå®è¡ããã¨ããããè¡ããã¨ãã§ãã¾ãã :command:`pip install sphinx-intl` ã :command:`easy_install sphinx-intl` ãå©ç¨ãã¦ `sphinx-intl`_ ãã¤ã³ã¹ãã¼ã«ãã¾ãã `transifex-client`_ ã®ã¤ã³ã¹ãã¼ã« å½éå transifex_ ã«ã­ã°ã¤ã³ãã¾ãã reSTè¨æ³ãå´©ããªããããæ³¨æãã¦ä¸ãããæ®ã©ã®poã¨ãã£ã¿ãreSTè¨æ³ã«ã¤ãã¦ãããªããå©ãã¦ãããã§ãããã ç¿»è¨³æ¸ã¿ã®poãã¡ã¤ã«ãåå¾ããç¿»è¨³ããããã­ã¥ã¡ã³ããçæ ã¯ã¤ãã¯ã¬ã¤ã potãã¡ã¤ã«ã ``.tx/config`` ãã¡ã¤ã«ã«ç»é²ãã¾ã: åºåãããå½¢å¼ã§ãã«ããã¾ãã ãã®ãã¼ã«ç¾¤ã®è©³ç´°ã«ã¤ãã¦ã¯ã `GNU gettextã¦ã¼ãã£ãªãã£ <http://www.gnu.org/software/gettext/manual/gettext.html#Introduction>`_ ãåç§ãã¦ãã ããã :confval:`language` ã« ``es`` (:option:`-D` ãªãã·ã§ã³ãä½¿ç¨ã§ãã¾ã)ã :confval:`locale_dirs` ã« ``["locale/"]`` ãã»ãããã¾ãã `locale_dir` ä»¥ä¸ãåæè¨­å® ãããã¯æ´æ°ãã¾ã:: Sphinx å½éåã«ã¤ãã¦ ä»¥ä¸ã§ã! Sphinxãªãã¡ã¬ã³ã¹ã®ç¿»è¨³ã«æ°ããå ããããäººã«ãå§ãããæ¹æ³ã¯ãTransifexä¸ã®ç¿»è¨³ãã¼ã ã«åå ãããã¨ã§ãã Sphinx-1.2 ãã­ã¥ã¡ã³ãã¼ã·ã§ã³åãã« `sphinx translation page` ãããã¾ãã ãããã®ãã¡ã¤ã«ãç¿»è¨³èã«æ¸¡ãã **ã¡ãã»ã¼ã¸ã«ã¿ã­ã°** ã¨å¼ã°ãã ``.po`` ãã¡ã¤ã«ãä½ã£ã¦ãããã¾ããããã«ã¯ãåã®ã¡ãã»ã¼ã¸ã«å¯¾å¿ãããå¤å½èªã®æå­åãæ¸ããã¦ãã¾ãã ä»åã¯ :confval:`locale_dirs` ã 'locale/' ã« :confval:`gettext_compact` ã `False` ã«è¨­å®ããã¦ããã¨ä»®å®ãã¦é²ãã¾ã(Sphinx ã®ãã­ã¥ã¡ã³ãã¯ãã®ããã«è¨­å®ããã¦ãã¾ã)ã ãã®æé ã¯ç¾å¨ã®ãã£ã¬ã¯ããªã¸ ``.tx/config` ãçæãã ``~/.transifexrc`` ãã¡ã¤ã«åæ§ã«èªè¨¼æå ±ãå«ã¿ã¾ãã Transifex_ ã¯ã¦ã§ãã¤ã³ã¿ã¼ãã§ã¼ã¹ãéãã¦ã³ã©ãã¬ã¼ãã£ããªç¿»è¨³ããããã¨ãå¯è½ã«ãããµã¼ãã¹ã®ä¸ã¤ã§ãã Pythonãã¼ã¹ã®ã³ãã³ãã©ã¤ã³ã¯ã©ã¤ã¢ã³ãããããç¿»è¨³ã®ãã§ãããããã·ã¥ãç°¡åã«å®æ½ãã¦ããã¾ãã ``./locale/de/LC_MESSAGES`` ãã£ã¬ã¯ããªä»¥ä¸ã® po ãã¡ã¤ã«ãç¿»è¨³ãã¾ããsphinx ãã­ã¥ã¡ã³ãã®  builders.po ãã¡ã¤ã«ã®å ´åã¯ããã§ã: `./locale/<lang>/LC_MESSAGES/` ä»¥ä¸ã«ãã po ãã¡ã¤ã«ãç¿»è¨³ãã¾ãã ç¿»è¨³ Transifexä¸ã§ã®ç¿»è¨³ããã³ã­ã¼ã«ã«ã§ã®ç¿»è¨³ sphinx-intlãä½¿ã£ã¦ã®ç¿»è¨³ poãã¡ã¤ã«ãæ°ããpotãã¡ã¤ã«ã§ç½®ãæãã¾ãã potãã¡ã¤ã«ãtransifexãµã¼ãã¼ã«ã¢ããã­ã¼ããã¾ã ãã¼ã ã§ã®ç¿»è¨³ã« Transifex ãµã¼ãã¹ãå©ç¨ãã sphinxç¿»è¨³ã®ã¡ã³ããã¼ã«ãã£ã¦æ¿èªãããã®ãå¾ã¡ã¾ãã Sphinxã«ããç¿»è¨³ã®ãã¸ã¥ã¢ã«ãªã¯ã¼ã¯ãã­ã¼(äººã®çµµã¯ `XKCD comic <http://xkcd.com/779/>`_ ããåãã¾ãã) resources(pot ãã¡ã¤ã«) ãã¢ããã­ã¼ãããã«ã¯ :command:`tx` ã³ãã³ããå¿è¦ã§ãã ``conf.py`` ã§ :confval:`language` ãã©ã¡ã¼ã¿ã¼ãè¨­å®ããå¿è¦ãããã¾ããã¾ããã³ãã³ãã©ã¤ã³ã§ãã©ã¡ã¼ã¿ãè¨­å®ãããã¨ãã§ãã¾ã:: `./locale/de/LC_MESSAGES/` `./locale/ja/LC_MESSAGES/` `Transifex Client v0.8 &mdash; Transifex documentation`_ ``sphinx-document-test_1_0`` `sphinx-intl`_ ã¯ Sphinx ã§ã®ç¿»è¨³ãã­ã¼ã§å©ç¨ããã®ã«ä¾¿å©ãªãã¼ã«ã§ãããã®ç¯ã§ã¯ sphinx-intl ãå©ç¨ãã¦ç°¡åã«ç¿»è¨³ããæ¹æ³ã«ã¤ãã¦è¿°ã¹ã¾ãã ããã¦ãpotãã¡ã¤ã«ãã¢ããã­ã¼ããã¾ã: https://www.transifex.com/projects/p/sphinx-document-test_1_0/ 