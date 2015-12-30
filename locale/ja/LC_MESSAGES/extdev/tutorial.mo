Þ    K      t              Ì     Í     Ý  
   é     ô                5     U     l  Ö     N   X  +  §  º   Ó  \     :  ë  ¸   &
  [  ß
     ;  ×   Ò     ª  û   ·     ³  Ò   Ä  a     ?   ù  b  9  ³     T   P  n   ¥  P        e  ³  w  v   +  ä   ¢       ¸     #   Ï  Ï   ó  1   Ã  Ú   õ  ¸   Ð             ¬     =  ë  Û  Å   Ç   D   !     Ò!     è!     û!     "  1   "  ,   Q"  Ö   ~"  í   U#  ÷   C$  z   ;%  <   ¶%  §   ó%  (   &     Ä&  ?   Y'     '  e   1(  *  (    Â*  á   O,  \   1-  æ   -  ¿   u.  $   5/  G   Z/  5   ¢/    Ø/     u1     1  
   £1     ®1     ¾1      Ü1  )   ý1     '2      B2    c2     õ3    4  $  6     ´7    A8  ú   ×9  Ü  Ò:  Æ   ¯<  (  v=     >  D  ¸>     ý?  ,  @  }   @A  g   ¾A  U  &B  &  |E  T   £F  ®   øF  y   §G     !H  Ã  =H      K  C  ¢K  ê   æL    ÑM  ;   àN  ñ   O  E   P  e  TP  í   ºQ  x  ¨R  »  !T  ,  ÝU  '  
W    2X    K[     d\     ò\     ]     *]     =]  N   I]  F   ]  <  ß]  Y  _  V  v`  ë   Ía  e   ¹b  Á   c  0   ác  à   d  V   ód    Je     Zf  D  îf    3j  A  ´l      öm  4  n  *  Ìo  5   ÷p  Y   -q  X   q   **Application** **Builder** **Config** **Environment** **Phase 0: Initialization** **Phase 1: Reading** **Phase 2: Consistency checks** **Phase 3: Resolving** **Phase 4: Writing** :meth:`~Sphinx.add_config_value` lets Sphinx know that it should recognize the new *config value* ``todo_include_todos``, whose default value should be ``False`` (this also tells Sphinx that it is a boolean value). :meth:`~Sphinx.add_directive` adds a new *directive*, given by name and class. :meth:`~Sphinx.add_node` adds a new *node class* to the build system.  It also can specify visitor functions for each supported output format.  These visitor functions are needed when the new nodes stay until phase 4 -- since the ``todolist`` node is always replaced in phase 3, it doesn't need any. A "todo" directive, containing some content that is marked with "TODO", and only shown in the output if a new config value is set.  (Todo entries should not be in the output by default.) A "todolist" directive that creates a list of all todo entries throughout the documentation. A directive class is a class deriving usually from :class:`docutils.parsers.rst.Directive`.  The directive interface is also covered in detail in the `docutils documentation`_; the important thing is that the class has attributes that configure the allowed markup and a method ``run`` that returns a list of nodes. A new config value ``todo_include_todos`` (config value names should start with the extension name, in order to stay unique) that controls whether todo entries make it into the output. An admonition is created using a standard docutils function (wrapped in Sphinx for docutils cross-version compatibility).  The first argument gives the node class, in our case ``todo``.  The third argument gives the admonition title (use ``arguments`` here to let the user specify the title).  A list of nodes is returned from ``make_admonition``. An instance of our ``todolist`` node class is created and returned.  The todolist directive has neither content nor arguments that need to be handled. As an example, we will cover a "todo" extension that adds capabilities to include todo entries in the documentation, and collecting these in a central place.  (A similar "todo" extension is distributed with Sphinx.) Build Phases During reading, the build environment is updated with all meta- and cross reference data of the read documents, such as labels, the names of headings, described Python objects and index entries.  This will later be used to replace the temporary nodes. Extension Design Finally, :meth:`~Sphinx.connect` adds an *event handler* to the event whose name is given by the first argument.  The event handler function is called with several arguments which are documented with the event. Finally, let's look at the event handlers.  First, the one for the :event:`env-purge-doc` event:: For that, we will need to add the following elements to Sphinx: If not, todo nodes just stay where and how they are.  Todolist nodes are replaced by a list of todo entries, complete with backlinks to the location where they come from.  The list items are composed of the nodes from the todo entry and docutils nodes created on the fly: a paragraph for each entry, containing text that gives the location, and a link (reference node containing an italic node) with the backreference.  The reference URI is built by ``app.builder.get_relative_uri`` which creates a suitable URI depending on the used builder, and appending the todo node's (the target's) ID as the anchor name. If the third argument was ``True``, all documents would be re-read if the config value changed its value.  This is needed for config values that influence reading (build phase 1). If you have the application object, the environment is available as ``app.builder``. If you have the application or builder object, the environment is available as ``app.env`` or ``builder.env``. If you have the environment object, the application is available as ``env.app``. Important objects In Phase 1, all source files (and on subsequent builds, those that are new or changed) are read and parsed.  This is the phase where directives and roles are encountered by the docutils, and the corresponding code is executed.  The output of this phase is a *doctree* for each source files, that is a tree of docutils nodes.  For document elements that aren't fully known until all existing files are read, temporary nodes are created. In the last line, the nodes that should be put into the doctree are returned: the target node and the admonition node. In this phase, almost nothing interesting for us happens.  The source directory is searched for source files, and extensions are initialized. Should a stored build environment exist, it is loaded, otherwise a new one is created. It is a bit more involved.  If our new "todo_include_todos" config value is false, all todo and todolist nodes are removed from the documents. Its API provides methods to do with access to metadata, resolving references, etc.  It can also be used by extensions to cache information that should persist for incremental rebuilds. Let's start with the node classes:: Many extensions will not have to create their own node classes and work fine with the nodes already provided by `docutils <http://docutils.sourceforge.net/docs/ref/doctree.html>`__ and :ref:`Sphinx <nodes>`. New directives, called ``todo`` and ``todolist``. New document tree nodes to represent these directives, conventionally also called ``todo`` and ``todolist``.  We wouldn't need new nodes if the new directives only produced some content representable by existing nodes. New event handlers: one for the :event:`doctree-resolved` event, to replace the todo and todolist nodes, and one for :event:`env-purge-doc` (the reason for that will be covered later). Node classes usually don't have to do anything except inherit from the standard docutils classes defined in :mod:`docutils.nodes`.  ``todo`` inherits from ``Admonition`` because it should be handled like a note or warning, ``todolist`` is just a "general" node. Now that the metadata and cross-reference data of all existing documents is known, all temporary nodes are replaced by nodes that can be converted into output.  For example, links are created for object references that exist, and simple literal nodes are created for those that don't. One thing that is vital in order to understand extension mechanisms is the way in which a Sphinx project is built: this works in several phases. Several important things are covered here. First, as you can see, you can refer to the build environment instance using ``self.state.document.settings.env``. Since we store information from source files in the environment, which is persistent, it may become out of date when the source file changes.  Therefore, before each source file is read, the environment's records of it are cleared, and the :event:`env-purge-doc` event gives extensions a chance to do the same. Here we clear out all todos whose docname matches the given one from the ``todo_all_todos`` list.  If there are todos left in the document, they will be added again during parsing. Some builders deviate from this general build plan, for example, the builder that checks external links does not need anything more than the parsed doctrees and therefore does not have phases 2--4. Some checking is done to ensure no surprises in the built documents. The Directive Classes The Event Handlers The Node Classes The Setup Function The ``todo`` directive function looks like this:: The ``todolist`` directive is quite simple:: The application object (usually called ``app``) is an instance of :class:`.Sphinx`.  It controls the most high-level functionality, such as the setup of extensions, event dispatching and producing output (logging). The build environment object (usually called ``env``) is an instance of :class:`.BuildEnvironment`.  It is responsible for parsing the source documents stores all metadata about the document collection and is serialized after each build. The builder object (usually called ``builder``) is an instance of a specific subclass of :class:`.Builder`.  Each builder class knows how to convert the parsed documents into an output format, or otherwise process them (e.g. check external links). The calls in this function refer to classes and functions not yet written.  What the individual calls do is the following: The config is available as ``app.config`` or ``env.config``. The config object (usually called ``config``) provides the values of configuration values set in :file:`conf.py` as attributes.  It is an instance of :class:`.Config`. The handler functions are created later. The new elements are added in the extension's setup function.  Let us create a new Python module called :file:`todo.py` and add the setup function:: The node structure that the directive returns looks like this:: The other handler belongs to the :event:`doctree-resolved` event.  This event is emitted at the end of phase 3 and allows custom resolving to be done:: The parsed doctrees are stored on the disk, because it is not possible to hold all of them in memory. Then, the todo node is added to the environment.  This is needed to be able to create a list of all todo entries throughout the documentation, in the place where the author puts a ``todolist`` directive.  For this case, the environment attribute ``todo_all_todos`` is used (again, the name should be unique, so it is prefixed by the extension name).  It does not exist when a new environment is created, so the directive must check and create it if necessary.  Various information about the todo entry's location are stored along with a copy of the node. Then, to act as a link target (from the todolist), the todo directive needs to return a target node in addition to the todo node.  The target ID (in HTML, this will be the anchor name) is generated by using ``env.new_serialno`` which returns a new unique integer on each call and therefore leads to unique target names.  The target node is instantiated without any text (the first two arguments). There are nodes provided by docutils, which are documented `in the docutils documentation <http://docutils.sourceforge.net/docs/ref/doctree.html>`__. Additional nodes are provided by Sphinx and :ref:`documented here <nodes>`. There are several key objects whose API you will use while writing an extension.  These are: This phase converts the resolved doctrees to the desired output format, such as HTML or LaTeX.  This happens via a so-called docutils writer that visits the individual nodes of each doctree and produces some output in the process. This section is intended as a walkthrough for the creation of custom extensions. It covers the basics of writing and activating an extensions, as well as commonly used features of extensions. Tutorial: Writing a simple extension We need to create the two node classes ``todo`` and ``todolist`` later. We want the extension to add the following to Sphinx: Project-Id-Version:  sphinx-doc-1.2.0
Report-Msgid-Bugs-To: 
POT-Creation-Date: 2015-03-11 04:27+0000
PO-Revision-Date: 2015-09-13 05:35+0000
Last-Translator: Takayuki Shimizukawa <shimizukawa@gmail.com>
Language-Team: Japanese (http://www.transifex.com/sphinx-doc/sphinx-doc-1_2_0/language/ja/)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Generated-By: Babel 2.1.1
 **ã¢ããªã±ã¼ã·ã§ã³** **ãã«ãã¼** **Config** **Environment** **ãã§ã¼ãº 0: åæå** **ãã§ã¼ãº 1: èª­ã¿è¾¼ã¿** **ãã§ã¼ãº 2: ä¸è²«æ§ãã§ãã¯** **ãã§ã¼ãº 3: è§£æ±º** **ãã§ã¼ãº 4: æ¸ãåºã** :meth:`~Sphinx.add_config_value` ã¡ã½ããã¯Sphinxã«å¯¾ãã¦æ°ãã\ **è¨­å®å¤**\ ã§ãã\  ``todo_include_todos``\ ãè¿½å ããããã«æç¤ºãã¦ã :file:`conf.py` ã®ä¸­ã«æ¸ããããã«ãã¾ãããã®ãªãã·ã§ã³ã®ããã©ã«ãå¤ã¯\ ``False``\ ã«ãªãã¾ããã¾ãããã®è¨­å®å¤ããã¼ãªã¢ã³ã®å¤ãåãã¨ãããã¨ãSphinxã«ç¥ããã¾ãã :meth:`~Sphinx.add_directive` ã¡ã½ããã¯ãæå®ãããååã¨ã¯ã©ã¹ãããæ°ãã\ ``ãã£ã¬ã¯ãã£ã``\ ãè¿½å ãã¾ãã :meth:`~Sphinx.add_node` ã¡ã½ããã¯ããã«ãã·ã¹ãã ã«å¯¾ãã¦æ°ãã\ **ãã¼ãã¯ã©ã¹**\ ãè¿½å ãã¾ãããã®ã¡ã½ããã¯ãµãã¼ãããåºåå½¢å¼ãã¨ã«ãã¸ã¿ã¼é¢æ°ãå®ç¾©ãããã¨ãã§ãã¾ãããããã®ãã¸ã¿ã¼é¢æ°ã¯æ°ãããã¼ãããã§ã¼ãº.4ã¾ã§æ®ã£ã¦ããå ´åã«å¿è¦ã«ãªãã¾ãã\ ``todolist``\ ã¯ãã§ã¼ãº.3ã¾ã§ã«ãã¹ã¦ç½®ãæãããã¦ãã¾ãããããã¸ã¿ã¼ãæå®ããå¿è¦ã¯ããã¾ããã "todo"ãã£ã¬ã¯ãã£ãã¯ã"TODO"ã¨ãã¦ãããªããã°ãªããªããã¨ãã³ã³ãã³ãã¨ãã¦æã¡ãæ°ããè¨­å®å¤ã§è¡¨ç¤ºããããã«æå®ãããã¨ãã ãè¡¨ç¤ºãã¾ããããã©ã«ãã§ã¯todoã®ã¨ã³ããªã¼ã¯è¡¨ç¤ºãããªãããã«ãã¾ãã "todolist"ãã£ã¬ã¯ãã£ããããã¨ãå¨ãã­ã¥ã¡ã³ãã«å«ã¾ããTodoã®é ç®ãéãã¦ããªã¹ããä½æãã¾ãã directiveã¯ã©ã¹ã¯éå¸¸ ``docutils.parsers.rst.Directive`` ããæ´¾çãã¾ãããã£ã¬ã¯ãã£ãã®ã¤ã³ã¿ãã§ã¼ã¹ã®è©³ç´°ã¯ `docutils documentation`_ ã§ãè¿°ã¹ããã¦ãã¾ããéè¦ãªãã¨ã¨ãã¦ããã®ã¯ã©ã¹ã¯ãã¼ã¯ã¢ããã«è¨±ãããè¨­å®ã®ããã®å±æ§ã¨ããã¼ãã®ãªã¹ããè¿ã ``run`` ã¨ããã¡ã½ãããæã¤ã¨ãããã¨ã§ãã ``todo_include_todos``\ ã¨ããæ°ããè¨­å®å¤ãè¨­å®å¤ã®ååã¯ãä¸ææ§ãä¿ã¤ããã«æ¡å¼µåããå§ã¾ãååã«ãã¦ãã ããããã®è¨­å®å¤ã¯todoã®ã¨ã³ããªã¼ããåºåãè¡ããã©ãããå¤æ­ãã¾ã Admonition(å§å)ã¯æ¨æºã®docutilsé¢æ°(docutilsã®ãã¼ã¸ã§ã³éã®äºææ§ã®ããã«Sphinxã§ã©ãããã¦ãã)ãä½¿ã£ã¦ä½æãã¾ããæåã®å¼æ°ã¯ãã¼ãã®ã¯ã©ã¹ã§ãããã§ã¯\ ``todo``\ ãè¨­å®ãã¦ãã¾ããï¼çªç®ã®å¼æ°ã¯Admonitionã®ã¿ã¤ãã«ã§ãã\ ``arguments``\ ãä½¿ç¨ãã¦ãã¦ã¼ã¶å®ç¾©ã®ååã«ãªãã¾ãã\ ``make_admonition``\ ããè¿ããããã®ã¯ãã¼ãã®ãªã¹ãã«ãªãã¾ãã ``todolist``\ ãã¼ãã¯ã©ã¹ã®ã¤ã³ã¹ã¿ã³ã¹ãä½ã£ã¦è¿ãã¦ãã¾ãã\ ``todolist``\ ãã£ã¬ã¯ãã£ãã§ã¯ãã³ã³ãã³ããå¼æ°ãåãæ±ãå¿è¦ã¯ããã¾ããã ãµã³ãã«ã¨ãã¦ã¯ããã­ã¥ã¡ã³ãã®ä¸­ã«ToDoãæ¸ããã¨ãã§ããããã«ãªããæå®ãããå ´æã«ãã¹ã¦ã®ToDoã®ä¸è¦§ãåºåããã"todo"æ¡å¼µãæ±ããã¨æãã¾ããSphinxã®éå¸ç©ã«å«ã¾ãã"todo"æ¡å¼µã¨ã»ã¼åããã®ã«ãªãã¾ãã ãã«ãã»ãã§ã¼ãº ã½ã¼ã¹ãèª­ã¿è¾¼ãã§ããéã¯ãã©ãã«ãè¦åºãåãèª¬æããã¦ããPythonãªãã¸ã§ã¯ããç´¢å¼ã®ã¨ã³ããªã¼ãªã©ã®ãããªæå ±ãã¯ã­ã¹ãã¡ã³ã¬ã¹ã®æå ±ããã«ãç°å¢ã«åºåããã¾ãããããã®æå ±ã¯ãå¾ã§ä¸æçãªãã¼ãã¨ç½®ãæãããã¾ãã æ¡å¼µã®ãã¶ã¤ã³ æå¾ã«ã :meth:`~Sphinx.connect` ã¡ã½ããã¯ãæåã®å¼æ°ã«æå®ãããã¤ãã³ãã®ååã«å¯¾ããã\ **ã¤ãã³ããã³ãã©**\ ãè¿½å ãã¾ããã¤ãã³ããã³ãã©ã®é¢æ°ã¯ããã­ã¥ã¡ã³ãã«é¢ããå¼æ°ãããã¤ãä¼´ã£ã¦å¼ã³åºããã¾ãã æå¾ã«ãã¤ãã³ããã³ãã©ãè¦ã¦ããã¾ããæåã«è¦ãã®ã¯ :event:`env-purge-doc` ã¤ãã³ãã§ã:: ãããå®ç¾ããããã«ã¯ãSphinxã«ä»¥ä¸ã®é ç®ãè¿½å ããå¿è¦ãããã§ããã: trueã®å ´åã«ã¯todoã®ãã¼ãã¯ãã®å ´ã«ä¿æããã¾ããtodolistãã¼ãã¯todoã®ã¨ã³ããªã¼ã®ãªã¹ãã«ç½®ãæããããå®ç¾©ãããå ´æã¸ã®éãªã³ã¯ãå¼µããã¾ãããªã¹ãã¢ã¤ãã ã¯todoã¨ã³ããªã¼ã®ãã¼ãã®åå®¹ããä½æããããã®å ´ã§docutilsã®ãã¼ããä½æããã¾ããã¨ã³ããªã¼ãã¨ã«æ®µè½ãä½ããã¾ããæ®µè½ã®ä¸­ã«ã¯å®ç¾©ãããä½ç½®ãè¡¨ããã­ã¹ãã¨éåç§ã®ããã®ãªã³ã¯ãå«ã¾ãã¾ããã¾ãåç§ã¯ã¤ã¿ãªãã¯ä½ã®ãã¼ãã®ä¸­ã«å®ç¾©ããã¾ããåç§ã®ãªã³ã¯ã¯\ ``app.builder.get_relative_uri``\ é¢æ°ã«ãã£ã¦ä½æããã¾ããããã¯ãã«ãã¼ãã¨ã«é©ããURIãä½æãã¾ãããªã³ã¯ã«ã¯ããã¼ãã®ã¿ã¼ã²ããã®IDãã¢ã³ã«ã¼åã¨ãã¦è¿½å ããã¦ãã¾ãã ããã3çªç®ã®å¼æ°ã\ ``True``\ ã®å ´åã«ã¯ãè¨­å®å¤ãå¤æ´ãããå ´åã«ãã¹ã¦ã®ãã­ã¥ã¡ã³ããåèª­ã¿è¾¼ã¿ããã¾ãããã®å¼æ°ã¯ãè¨­å®å¤ããã§ã¼ãº.1ã®èª­ã¿è¾¼ã¿ã«å¯¾ãã¦å½±é¿ãä¸ãããã©ãããæå®ããã®ã«å¿è¦ã§ãã If you have the application object, the environment is available as ``app.builder``. ããã¢ããªã±ã¼ã·ã§ã³ããã«ãã¼ã®ãªãã¸ã§ã¯ããããã°ã ``app.env`` ã ``builder.env`` ã®ããã«ç°å¢ãªãã¸ã§ã¯ããæä¾ããã¾ãã ãããç°å¢ãªãã¸ã§ã¯ããããã°ã ``env.app`` ã®ããã«ã¢ããªã±ã¼ã·ã§ã³ãæä¾ããã¾ãã éè¦ãªãªãã¸ã§ã¯ã ãã§ã¼ãº 1ã§ã¯ãã¹ã¦ã®ã½ã¼ã¹ãã¡ã¤ã«ãèª­ã¿è¾¼ã¾ãããã¼ã¹ããã¾ãããªãããã®å¾ã®ãã§ã¼ãºã¯æ°è¦ã®ãã¡ã¤ã«ãå¤æ´ããããã¡ã¤ã«ã«å¯¾ãã¦å®è¡ããã¾ãããã®ãã§ã¼ãºã§ã¯docutilsã«ãã£ã¦ãã£ã¬ã¯ãã£ããã­ã¼ã«ãå¦çãããããã«å¯¾å¿ããã³ã¼ããå®è¡ããã¾ãããã®ãã§ã¼ãºã®åºåã¯ãã½ã¼ã¹ãã¡ã¤ã«ãã¨ã®\ **DOCããªã¼**\ ã§ããããã¯ãdocutilsã®ãã¼ããããªã¼ä¸ã«æ§æããã¦ãããã®ã§ãããã¹ã¦ã®ãã¡ã¤ã«ãèª­ã¿è¾¼ãã¾ã§ã¯å®å¨ã«è§£éã§ããªããã­ã¥ã¡ã³ãã®è¦ç´ ã«é¢ãã¦ã¯ãä¸æçãªãã¼ããä½ããã¾ãã æå¾ã®è¡ã§ã¯ãä½æããã¿ã¼ã²ãããã¼ãã¨ãAdmonitionãã¼ããDOCããªã¼ã®ä¸­ã«éç½®ããããã«ãreturnã§è¿ãã¦ãã¾ãã ãã®ãã§ã¼ãºã§ã¯æ¡å¼µä½æèã«ã¨ã£ã¦é¢ç½ããã®ã¯ä½ãããã¾ããã ã½ã¼ã¹ãã£ã¬ã¯ããªåã®ã½ã¼ã¹ãã¡ã¤ã«ãæ¢ç´¢ããæ¡å¼µæ©è½ãåæåãã¾ãã ä¿å­ããããã«ãç°å¢ãããã°ãããã­ã¼ããããªããã°æ°ãããã«ãç°å¢ãä½æãã¾ãã ãã®ã³ã¼ãã¯å¤å°è¾¼ã¿å¥ã£ã¦ãã¾ãããããæ°ããè¨­å®å¤ã§ãã\ ``"todo_include_todos"``\ ãfalseã®å ´åã«ã¯ããã¹ã¦ã®todoããã³ãtodolistã®ãã¼ãããã­ã¥ã¡ã³ãããåé¤ãã¾ãã ç°å¢ãªãã¸ã§ã¯ãã¯ã¡ã¿ãã¼ã¿ã«ã¢ã¯ã»ã¹ããããã®APIããåç§ãè§£æ±ºããAPIãªã©ãæã£ã¦ãã¾ããããã¯ã¾ããæ¡å¼µããæå ±ã®ã­ã£ãã·ã¥ã¨ãã¦ä½¿ãããããã«ãã£ã¦æ¼¸é²çãªåãã«ããã§ãã¾ãã ããã§ã¯ãã¼ãã¯ã©ã¹ãå®è£ãã¦ããã¾ã:: å¤ãã®æ¡å¼µã¯ç¬èªã®ãã¼ãã¯ã©ã¹ãå®è£ããå¿è¦ã¯ãªãã  `docutils <http://docutils.sphinx-users.jp/docutils/docs/ref/doctree.html>`__ ã¨ :ref:`Sphinx <nodes>` ãæä¾ãããã¼ããä½¿ãã°è¯ãã§ãããã ``todo``, ``todolist``\ ã¨å¼ã°ããæ°ãããã£ã¬ã¯ãã£ã ``todo``, ``todolist``\ ã¨ãããã£ã¬ã¯ãã£ããä½¿ç¨ãããå ´åã«ããããè¡¨ç¾ããæ£ç¿çãªæ°ãããã­ã¥ã¡ã³ãããªã¼ã®ãã¼ããããããæ°ãããã£ã¬ã¯ãã£ãããæ¢å­ã®ãã¼ãã§è¡¨ç¾å¯è½ãªãã®ã ããçæããã®ã§ããã°ãæ°ãããã¼ããä½æããå¿è¦ã¯ããã¾ããã æ°ããã¤ãã³ããã³ãã©ãä¸ã¤ã¯todoã¨todolistã®ãã¼ããç½®ãæããããã® :event:`doctree-resolved` ã¤ãã³ããã³ãã©ã§ãããä¸ã¤ã¯  :event:`env-purge-doc` (çç±ã¯å¾ã§èª¬æãã¾ã)ã§ãã ãã¼ãã¯ã©ã¹ã¯ :mod:`docutils.nodes` ã®ä¸­ã§å®ç¾©ããã¦ããdocutilsã®æ¨æºã¯ã©ã¹ãç¶æ¿ããä»¥å¤ã«ã¯ä½ãããå¿è¦ã¯ããã¾ããã\ ``todo``\ ã¯\ ``note``\ ã\ ``warning``\ ã®ããã«ä½¿ç¨ãããªããã°ãªããªãããã\ ``Admonition``\ ã¯ã©ã¹ãå®ç¾©ãã¦ãã¾ãã\ ``todolist``\ ã¯åãªã"ä¸è¬"ãã¼ãã§ãã èª­ã¿è¾¼ã¾ãããã¹ã¦ã®ãã­ã¥ã¡ã³ãããåéãããã¡ã¿ãã¼ã¿ãããã³ã¯ã­ã¹ãªãã¡ã¬ã³ã¹ã®ãã¼ã¿ãä½¿ã£ã¦ãä¸æçãªãã¼ãããåºåå¯è½ãªãã¼ãã«ç½®ãæãã¦ããã¾ããä¾ãã°ãå­å¨ãããªãã¸ã§ã¯ãã¸ã®åç§ãããã°ãªã³ã¯ãä½æããã¾ãããªã³ã¯åãå­å¨ããªããã®ã¯ã·ã³ãã«ãªãªãã©ã«(ç­å¹)ã®ãã¼ããä½æããã¾ãã Sphinxã®ãã­ã¸ã§ã¯ãããã«ããããéç¨ã§ãæ¡å¼µæ©è½ãã©ã®ããã«å®è¡ãããã®ãã¨ãããã¨ãçè§£ãããã¨ã¯ãæ¡å¼µæ©è½ã®éçºãããããã§å¿è¦ä¸å¯æ¬ ã§ãããã®ä½æ¥­ã¯ä»¥ä¸ã®ããã¤ãã®ãã§ã¼ãºããæ§æããã¦ãã¾ãã æ¡å¼µæ©è½ã®ä½æã«ããã£ã¦éè¦ãªãã¨ããã®ã¯ã©ã¹ã§ã«ãã¼ããã¦ãã¾ããã¾ãæåã«ãè¦ã¦ãããããã«ã\ ``self.state.document.settings.env``\ ãéãã¦ããã«ãç°å¢ã®ã¤ã³ã¹ã¿ã³ã¹ãåç§ãããã¨ãã§ããã¨ãããã¨ã§ãã ã½ã¼ã¹ãã¡ã¤ã«ã®ä¸­ããæå ±ãåãåºããç°å¢ã®ä¸­ã«æ ¼ç´ãã¾ããããããã¯æ°¸ç¶åããã¾ãããã®ãããã½ã¼ã¹ãã¡ã¤ã«ãå¤æ´ãããã¨å¤ãæå ±ã«ãªã£ã¦ãã¾ãå¯è½æ§ãããã¾ãããã®ãããããããã®ã½ã¼ã¹ãã¡ã¤ã«ãèª­ã¿è¾¼ãåã«ãç°å¢ã®è¨é²ãã¯ãªã¢ãã¦ãã¾ãã :event:`env-purge-doc` ã¤ãã³ãã¯ãæ¡å¼µæ©è½ã®ä¸­ã§ãã®ãããªä½æ¥­ãè¡ãã®ã«é©ããå ´æã«ãªãã¾ããããã§ã¯\ ``todo_all_todos``\ ã®ãªã¹ãã®ä¸­ã®é ç®ã®ãã¡ããã­ã¥ã¡ã³ãã®åå(``docname``)ãããããããã®ãåé¤ãã¦ãã¾ããããããã­ã¥ã¡ã³ãåã®ToDoãæ®ã£ã¦ããã¨ãããããã¼ã¹æã«éè¤ãã¦è¿½å ããã¦ãã¾ãã¾ãã ããã¤ãã®ãã«ãã¼ã®ä¸­ã«ã¯ããã®ä¸è¬çãªãã«ãè¨ç»ããå¤ãã¦ãããã®ãããã¾ãã ä¾ãã°ãå¤é¨ãªã³ã¯ãã§ãã¯ã®ãã«ãã¼ã¯doctreeã®ãã¼ã¹ãããä»¥ä¸ã®æå ±ã¯ä¸è¦ãªã®ã§ããã§ã¼ãº2ï½4ãè¡ãã¾ããã ãã«ãããããã­ã¥ã¡ã³ãã®ä¸­ã«ãã³ã£ãããããããªãã®ããªãããããã¤ãã®ãã§ãã¯ãè¡ãã¾ãã ãã£ã¬ã¯ãã£ãã¯ã©ã¹ ã¤ãã³ããã³ãã© ãã¼ãã¯ã©ã¹ setupé¢æ° ``todo``\ ãã£ã¬ã¯ãã£ãã®ã¯ã©ã¹ã¯ä»¥ä¸ã®ããã«ãªãã¾ã:: ``todolist``\ ãã£ã¬ã¯ãã£ãã¯ãããã¦ã·ã³ãã«ã§ã:: ã¢ããªã±ã¼ã·ã§ã³ãªãã¸ã§ã¯ã(éå¸¸ ``app`` ã¨å¼ã°ãã)ã¯ :class:`.Sphinx` ã®ã¤ã³ã¹ã¿ã³ã¹ã§ããããã¯é«ä½ã®æ©è½ãã³ã³ãã­ã¼ã«ãã¾ããä¾ãã°ãæ¡å¼µã®ã»ããã¢ããããã¤ãã³ãã®ãã£ã¹ããããã¢ã¦ããããã®çæ(ã­ã®ã³ã°)ç­ã§ãã ãã«ãç°å¢ãªãã¸ã§ã¯ã(éå¸¸ ``env`` ã¨å¼ã°ãã)ã¯ :class:`.BuildEnvironment` ã®ã¤ã³ã¹ã¿ã³ã¹ã§ããããã¯ãã­ã¥ã¡ã³ãã½ã¼ã¹ã®ãã¼ã¹ãè¡ãããã­ã¥ã¡ã³ãã»ããã«é¢ããå¨ã¦ã®ã¡ã¿ãã¼ã¿ãä¿æãããããããã«ãå¾ã«ã·ãªã¢ã©ã¤ãºããè²¬ä»»ãæã£ã¦ãã¾ãã ãã«ãã¼ãªãã¸ã§ã¯ã(éå¸¸ ``builder`` ã¨å¼ã°ãã)ã¯ :class:`.Biulder` ã®ãµãã¯ã©ã¹ã®ã¤ã³ã¹ã¿ã³ã¹ã§ããåãã«ãã¼ã¯ã©ã¹ã¯ãã¼ã¹ãããã­ã¥ã¡ã³ããä½¿ã£ã¦ãåºåãã©ã¼ãããã«å¤æãããããã¼ã¿å¦çããããã¾ã(ä¾ãã°ãå¤é¨ãªã³ã¯ã®ãã§ãã¯ãªã©)ã ãã®é¢æ°ã®ä¸­ã§åç§ããã¦ããã¯ã©ã¹ã¨é¢æ°ã®ä¸­ã«ã¯ãã¾ã èª¬æãã¦ããªããã®ãããã¾ããå¼ã°ãã¦ãããã®ãåãã«ä½ããã¦ããããã¨ããã®ãé çªã«èª¬æãã¦ããã¾ã: ã³ã³ãã£ã°ãªãã¸ã§ã¯ãã¯ ``app.config`` ã ``env.config`` ã¨ãã¦æä¾ããã¾ãã ã³ã³ãã£ã°ãªãã¸ã§ã¯ã(éå¸¸ ``config`` ã¨å¼ã°ãã)ã¯ :file:`conf.py` ã®è¨­å®å¤ãå±æ§ã¨ãã¦æä¾ãã¾ããããã¯ :class:`.Config` ã®ã¤ã³ã¹ã¿ã³ã¹ã§ãã ãã³ãã©ã¼é¢æ°ã¯å¾ã§ä½æãã¾ãã æ°ããè¦ç´ ã¯ãæ¡å¼µã®ä¸­ã®setupé¢æ°ã®ä¸­ã§è¿½å ãã¦ããã¾ããã¾ãã¯ :file:`todo.py` ã¨ããæ°ããPythonã®ã¢ã¸ã¥ã¼ã«ãä½æãã¦ãä»¥ä¸ã®ãããªsetupé¢æ°ãè¿½å ãã¾ããã:: ãã£ã¬ã¯ãã£ããè¿ããã¼ãæ§é ã¯ä»¥ä¸ã®ããã«ãªã£ã¦ãã¾ã:: ããä¸ã¤ :event:`doctree-resolved` ã¤ãã³ãã«é¢é£ãããã³ãã©ãå®ç¾©ããã¦ãã¾ãããã®ã¤ãã³ãã¯ãã§ã¼ãº.3ãå®äºããã¨ããã§çºç(emit)ãã¾ããè§£æ±ºå¦çãç¬èªã«å®è£ãããã¨ãã§ããããã«ãªãã¾ã:: ãã¼ã¹ãããDOCããªã¼ã¯ãã¹ã¦ã®ã¡ã¢ãªä¸ã§ä¿å­ãã¦ãããã¨ãã§ããªãããããã£ã¹ã¯ä¸ã«ä¿å­ããã¾ãã ``todo``\ ãã¼ããç°å¢ã«è¿½å ããã¾ãããããã¯å¨ãã­ã¥ã¡ã³ãã®ToDoã®ã¨ã³ããªã¼ã®ãªã¹ããä½æã§ããããã«ããããã«å¿è¦ãªãã®ã§ããããã§ä½ã£ããªã¹ãã¯\ ``todolist``\ ãã£ã¬ã¯ãã£ããç½®ããã¦ããã¨ããã«åºåããã¾ãããã®å ´åãç°å¢ã®å±æ§ã®\ ``todo_all_todos``\ ãä½¿ç¨ããã¾ããç¹°ãè¿ãã«ãªãã¾ãããååã®éè¤ãé¿ããããã«ãå±æ§åã®é ­ã«ã¯æ¡å¼µåãè¨­å®ãã¾ããæ°ããç°å¢ãä½æãããã¨ãã«ã¯ã¾ã å­å¨ãã¦ããªãããããã£ã¬ã¯ãã£ãã®ä¸­ã§ã¯å¿è¦ã«å¿ãã¦ãããã©ãããã§ãã¯ãè¡ããä½æããå¿è¦ãããã¾ããToDoã¨ã³ããªã¼ã®ä½ç½®ã«é¢ãããã¾ãã¾ãªæå ±ããã¼ãã®ã³ãã¼ã®ä¸­ã«ä¿å­ããã¾ãã ã§ãã®ã§ã(``todolist`` ããã®)ãªã³ã¯ã¿ã¼ã²ããã¨ãã¦åä½ãããããã«ã¯ã ``todo`` ãã£ã¬ã¯ãã£ãã ``todo`` ãã¼ãã ãã§ãªããã¿ã¼ã²ããã¨ãªããã¼ããè¿ãå¿è¦ãããã¾ããã¿ã¼ã²ããã®IDã¯ ``env.new_serialno`` ãä½¿ç¨ãã¦ä½æããã¾ã(HTMLã§ã¯ã¢ã³ã«ã¼åã«ãªãã¾ã)ãããããã®å¼ã³åºããã¨ã«ãã¦ãã¼ã¯ãªã¿ã¼ã²ããåã«ãªããããªãã¦ãã¼ã¯ãªæ°å¤ãè¿ãã¾ããã¿ã¼ã²ãããã¼ãã¯ããããããã­ã¹ã(æåã®äºã¤ã®å¼æ°)ãåãåããã¨ãªããã¤ã³ã¹ã¿ã³ã¹åããã¾ãã docutilsã«ãã£ã¦æä¾ããããã¼ããããã¾ãããããã¯ `docutilsã®ãã­ã¥ã¡ã³ã <http://docutils.sphinx-users.jp/docutils/docs/ref/doctree.html>`__. ã§èª¬æããã¦ãã¾ããè¿½å ã®ãã¼ãã¯Sphinxã«ãã£ã¦æä¾ããã :ref:`ãã­ã¥ã¡ã³ãã¯ãã <nodes>` ã«ããã¾ãã ããªããæ¡å¼µãæ¸ãã¨ãã«ä½¿ç¨ããAPIãæã¤ãããã¤ãã®éµã¨ãªããªãã¸ã§ã¯ããããã¾ãããããã¯æ¬¡ã®ã¨ããã§ã: ãã®ãã§ã¼ãºã§ã¯åç§ãè§£æ±ºãããDOCããªã¼ããHTMLãLaTeXãªã©ã®æå®ãããåºåãã©ã¼ãããã«å¤æãã¾ãããã®ãã­ã»ã¹ä¸­ã§ã¯ãdocutilsã®ã©ã¤ã¿ã¼ã¨å¼ã°ãããã®ãDOCããªã¼ã®åãã®ãã¼ãããã©ã£ã¦ãåºåãè¡ã£ã¦ããã¾ãã ãã®ã»ã¯ã·ã§ã³ã§ã¯ã«ã¹ã¿ã ã®æ¡å¼µã®ä½æã«ã¤ãã¦ä¸éãèª¬æãã¦ããããã¨æãã¾ãã ããã®èª¬æã§ã«ãã¼ããã®ã¯ãæ¡å¼µã®åºæ¬çãªæ¸ãæ¹ã¨ç»é²ã®ä»æ¹ããã¨ã¯æ¡å¼µãä½æããã®ã«ä½¿ç¨ãããä¸è¬çãªæ©è½ãªã©ã§ãã ãã¥ã¼ããªã¢ã«: ã·ã³ãã«ãªæ¡å¼µãä½æ å¾ã»ã©ã ``todo`` ã¨ ``todolist`` ã¨ãã2ã¤ã®nodeã¯ã©ã¹ãä½æãã¾ãã ä»¥ä¸ã®ãããªæ¡å¼µæ©è½ãSphinxã«è¿½å ãããã¨èãã¦ããã¨ãã¾ã: 