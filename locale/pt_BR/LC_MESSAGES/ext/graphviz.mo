��          �               l  1   m  !   �  �   �  �   �  �   4  �   �  s   �  �   T  �   4  e        z  �   �     8  "   R  �   u  �   _	     
  '   �
  _   �
  �   
  �  �  1   6  !   h  �   �  �   Y  �   �  �   �  s   �  �     �   �  e   �     C  �   Q       "     �   >  �   (     �  '   K  _   s  �   �   :mod:`sphinx.ext.graphviz` -- Add Graphviz graphs Added support for external files. Additional command-line arguments to give to dot, as a list.  The default is an empty list.  This is the right place to set global graph, node or edge attributes via dot's ``-G``, ``-N`` and ``-E`` options. All three directives support a ``caption`` option that can be used to give a caption to the diagram.  Naturally, diagrams marked as "inline" cannot have a caption. All three directives support an ``alt`` option that determines the image's alternate text for HTML output.  If not given, the alternate text defaults to the graphviz code. All three directives support an ``inline`` flag that controls paragraph breaks in the output.  When set, the graph is inserted into the current paragraph.  If the flag is not given, paragraph breaks are introduced before and after the image (the default). As for all file references in Sphinx, if the filename is absolute, it is taken as relative to the source directory. Directive for embedding a single directed graph.  The name is given as a directive argument, the contents of the graph are the directive content. This is a convenience directive to generate ``digraph <name> { <content> }``. Directive for embedding a single undirected graph.  The name is given as a directive argument, the contents of the graph are the directive content. This is a convenience directive to generate ``graph <name> { <content> }``. Directive to embed graphviz code.  The input code for ``dot`` is given as the content.  For example:: For example:: In HTML output, the code will be rendered to a PNG or SVG image (see :confval:`graphviz_output_format`).  In LaTeX output, the code will be rendered to an embeddable PDF file. It adds these directives: Previously, output always was PNG. Since this setting is not portable from system to system, it is normally not useful to set it in ``conf.py``; rather, giving it on the :program:`sphinx-build` command line via the :option:`-D` option should be preferable, like this:: The command name with which to invoke ``dot``.  The default is ``'dot'``; you may need to set this to a full path if ``dot`` is not in the executable search path. The output format for Graphviz when building HTML files.  This must be either ``'png'`` or ``'svg'``; the default is ``'png'``. There are also these new config values: This extension allows you to embed `Graphviz <http://graphviz.org/>`_ graphs in your documents. You can also embed external dot files, by giving the file name as an argument to :rst:dir:`graphviz` and no additional content:: Project-Id-Version:  sphinx-doc-1.2.0
Report-Msgid-Bugs-To: 
POT-Creation-Date: 2015-03-11 04:27+0000
PO-Revision-Date: 2015-03-21 23:03+0000
Last-Translator: Takayuki Shimizukawa <shimizukawa@gmail.com>
Language-Team: Portuguese (Brazil) (http://www.transifex.com/sphinx-doc/sphinx-doc-1_2_0/language/pt_BR/)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Generated-By: Babel 2.1.1
 :mod:`sphinx.ext.graphviz` -- Add Graphviz graphs Added support for external files. Additional command-line arguments to give to dot, as a list.  The default is an empty list.  This is the right place to set global graph, node or edge attributes via dot's ``-G``, ``-N`` and ``-E`` options. All three directives support a ``caption`` option that can be used to give a caption to the diagram.  Naturally, diagrams marked as "inline" cannot have a caption. All three directives support an ``alt`` option that determines the image's alternate text for HTML output.  If not given, the alternate text defaults to the graphviz code. All three directives support an ``inline`` flag that controls paragraph breaks in the output.  When set, the graph is inserted into the current paragraph.  If the flag is not given, paragraph breaks are introduced before and after the image (the default). As for all file references in Sphinx, if the filename is absolute, it is taken as relative to the source directory. Directive for embedding a single directed graph.  The name is given as a directive argument, the contents of the graph are the directive content. This is a convenience directive to generate ``digraph <name> { <content> }``. Directive for embedding a single undirected graph.  The name is given as a directive argument, the contents of the graph are the directive content. This is a convenience directive to generate ``graph <name> { <content> }``. Directive to embed graphviz code.  The input code for ``dot`` is given as the content.  For example:: Por exemplo:: In HTML output, the code will be rendered to a PNG or SVG image (see :confval:`graphviz_output_format`).  In LaTeX output, the code will be rendered to an embeddable PDF file. It adds these directives: Previously, output always was PNG. Since this setting is not portable from system to system, it is normally not useful to set it in ``conf.py``; rather, giving it on the :program:`sphinx-build` command line via the :option:`-D` option should be preferable, like this:: The command name with which to invoke ``dot``.  The default is ``'dot'``; you may need to set this to a full path if ``dot`` is not in the executable search path. The output format for Graphviz when building HTML files.  This must be either ``'png'`` or ``'svg'``; the default is ``'png'``. There are also these new config values: This extension allows you to embed `Graphviz <http://graphviz.org/>`_ graphs in your documents. You can also embed external dot files, by giving the file name as an argument to :rst:dir:`graphviz` and no additional content:: 