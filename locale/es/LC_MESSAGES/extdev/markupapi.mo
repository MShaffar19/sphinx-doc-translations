��    (      \              �  _   �  H   �  
   F  �   Q          4  #   7  x   [  =   �  Z     �   m  /   �     -  *   M  5   x  :   �  '   �  �     !   �     	  �   	  @   �	  z   (
  0   �
  M   �
  9   "  [   \  C   �  Y   �  g   V  !   �  S   �  +   4  q   `  �   �  V   �  	   �  N        S  �  o  _   �  H   X  
   �  �   �     {    �  #   �  x   �  =   /  Z   m  �   �  /   X     �  *   �  5   �  :   	  '   D  �   l  !   P     r  �   x  @   B  z   �  0   �  M   /  9   }  [   �  C     Y   W  g   �  !     S   ;  +   �  q   �  �   -  V   �  	   U  N   _     �   :func:`sphinx.util.nodes.nested_parse_with_titles` -- this allows titles in the parsed content. Both APIs parse the content into a given node. They are used like this:: Directives Directives are handled by classes derived from ``docutils.parsers.rst.Directive``.  They have to be registered by an extension using :meth:`.Sphinx.add_directive` or :meth:`.Sphinx.add_directive_to_domain`. Docutils markup API Docutils represents document source lines in a class ``docutils.statemachine.ViewList``.  This is a list with extended functionality -- for one, slicing creates views of the original list, and also the list contains information about the source line numbers. HOWTO of the Docutils documentation If you don't need the wrapping node, you can use any concrete node type and return ``node.children`` from the Directive. Instance attributes that are always set on the directive are: Internal offset of the directive content.  Used when calling ``nested_parse`` (see below). Many directives will contain more markup that must be parsed.  To do this, use one of the following APIs from the :meth:`Directive.run` method: Mapping of option names to validator functions. May the directive have content? May the final argument contain whitespace? New directives must implement the :meth:`run` method: Number of optional arguments after the required arguments. Number of required directive arguments. Option validator functions take a single parameter, the option argument (or ``None`` if not given), and should validate it or convert it to the proper form.  They raise :exc:`ValueError` or :exc:`TypeError` to indicate failure. Parsing directive content as ReST Roles The :attr:`Directive.content` attribute is a ViewList.  If you generate content to be parsed as ReST, you have to create a ViewList yourself.  Important for content generation are the following points: The ``.append()`` method takes a line and a source name as well. The absolute line number on which the directive appeared.  This is not always a useful value; use :attr:`srcline` instead. The arguments given to the directive, as a list. The constructor takes a list of strings (lines) and a source (document) name. The directive content, if given, as a :class:`.ViewList`. The directive name (useful when registering the same directive class under multiple names). The line number in the source file on which the directive appeared. The markup syntax of the new directive is determined by the follow five class attributes: The options given to the directive, as a dictionary mapping option names to validated/converted values. The source file of the directive. The state and state machine which controls the parsing.  Used for ``nested_parse``. The string containing the entire directive. There are several predefined and possibly useful validators in the :mod:`docutils.parsers.rst.directives` module. This method must process the directive arguments, options and content, and return a list of Docutils/Sphinx nodes that will be inserted into the document tree at the point where the directive was encountered. This section describes the API for adding ReST markup elements (roles and directives). ViewLists `Creating directives <http://docutils.sf.net/docs/howto/rst-directives.html>`_ ``self.state.nested_parse`` Project-Id-Version:  sphinx-doc-1.2.0
Report-Msgid-Bugs-To: 
POT-Creation-Date: 2015-03-11 04:27+0000
PO-Revision-Date: 2014-05-02 06:50+0000
Last-Translator: FULL NAME <EMAIL@ADDRESS>
Language-Team: Spanish (http://www.transifex.com/sphinx-doc/sphinx-doc-1_2_0/language/es/)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Generated-By: Babel 2.1.1
 :func:`sphinx.util.nodes.nested_parse_with_titles` -- this allows titles in the parsed content. Both APIs parse the content into a given node. They are used like this:: Directives Directives are handled by classes derived from ``docutils.parsers.rst.Directive``.  They have to be registered by an extension using :meth:`.Sphinx.add_directive` or :meth:`.Sphinx.add_directive_to_domain`. Docutils markup API Docutils represents document source lines in a class ``docutils.statemachine.ViewList``.  This is a list with extended functionality -- for one, slicing creates views of the original list, and also the list contains information about the source line numbers. HOWTO of the Docutils documentation If you don't need the wrapping node, you can use any concrete node type and return ``node.children`` from the Directive. Instance attributes that are always set on the directive are: Internal offset of the directive content.  Used when calling ``nested_parse`` (see below). Many directives will contain more markup that must be parsed.  To do this, use one of the following APIs from the :meth:`Directive.run` method: Mapping of option names to validator functions. May the directive have content? May the final argument contain whitespace? New directives must implement the :meth:`run` method: Number of optional arguments after the required arguments. Number of required directive arguments. Option validator functions take a single parameter, the option argument (or ``None`` if not given), and should validate it or convert it to the proper form.  They raise :exc:`ValueError` or :exc:`TypeError` to indicate failure. Parsing directive content as ReST Roles The :attr:`Directive.content` attribute is a ViewList.  If you generate content to be parsed as ReST, you have to create a ViewList yourself.  Important for content generation are the following points: The ``.append()`` method takes a line and a source name as well. The absolute line number on which the directive appeared.  This is not always a useful value; use :attr:`srcline` instead. The arguments given to the directive, as a list. The constructor takes a list of strings (lines) and a source (document) name. The directive content, if given, as a :class:`.ViewList`. The directive name (useful when registering the same directive class under multiple names). The line number in the source file on which the directive appeared. The markup syntax of the new directive is determined by the follow five class attributes: The options given to the directive, as a dictionary mapping option names to validated/converted values. The source file of the directive. The state and state machine which controls the parsing.  Used for ``nested_parse``. The string containing the entire directive. There are several predefined and possibly useful validators in the :mod:`docutils.parsers.rst.directives` module. This method must process the directive arguments, options and content, and return a list of Docutils/Sphinx nodes that will be inserted into the document tree at the point where the directive was encountered. This section describes the API for adding ReST markup elements (roles and directives). ViewLists `Creating directives <http://docutils.sf.net/docs/howto/rst-directives.html>`_ ``self.state.nested_parse`` 