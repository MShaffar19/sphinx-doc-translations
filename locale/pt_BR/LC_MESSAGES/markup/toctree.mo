��    4      �              \     ]     t     �    �     �     �  b   �     6  %   Q  H   w  q   �  M   2  V   �  P   �  3  (  	   \  �   f  |   �  �   r	    
  �   .  m   �  Z   #  .  ~     �    �  �   �  �   O  �     N   �     ;  9  H  �   �  �   )  �     >   �  �   �  a   �     �  �     �   �  �   �  �   u  �   F  R   2  A   �  �   �  &   �     �     �     �  �  �     �     �     �    �     �        b          �   %   �   H   �   q   !  M   !  V   �!  P   $"  3  u"     �#  �   �#  |   I$  �   �$    q%  �   �&  m   	'  Z   w'  .  �'     )    )  �   *  �   �*  �   a+  N   @,     �,  9  �,  �   �-  �   }.  �   [/  >   �/  �   40  a   �0     61  �  T1  �   3  �   �3  �   �4  �   �5  R   �6  A   �6  �   7  &   �7     8     &8     F8   **Additional options** **Entries** **Section numbering** A note on available globbing syntax: you can use the standard shell constructs ``*``, ``?``, ``[...]`` and ``[!...]`` with the feature that these all don't match slashes.  A double star ``**`` can be used to match any sequence of characters *including* slashes. Added "globbing" option. Added "includehidden" option. Added "numbered" and "hidden" options as well as external links and support for "self" references. Added "titlesonly" option. Added numeric argument to "numbered". All other toctree entries can then be eliminated by the "hidden" option. Be careful with unusual characters in filenames.  Some formats may interpret these characters in unexpected ways: Consider this example (taken from the Python docs' library reference index):: Do not use the colon ``:`` for HTML based formats.  Links to other parts may not work. Do not use the plus ``+`` for the ePub format.  Some resources may not be found. Document titles in the :rst:dir:`toctree` will be automatically read from the title of the referenced document. If that isn't what you want, you can specify an explicit title and target using a similar syntax to reST hyperlinks (and Sphinx's :ref:`cross-referencing syntax <xref-syntax>`). This looks like:: Footnotes If you want only the titles of documents in the tree to show up, not other headings of the same level, you can use the ``titlesonly`` option:: If you want to have section numbers even in HTML output, give the **toplevel** toctree a ``numbered`` option.  For example:: In cases where you want to have only one top-level toctree and hide all other lower level toctrees you can add the "includehidden" option to the top-level toctree entry:: In the end, all documents in the :term:`source directory` (or subdirectories) must occur in some ``toctree`` directive; Sphinx will emit a warning if it finds a file that is not included, because that means that this file will not be reachable through standard navigation. Numbering then starts at the heading of ``foo``.  Sub-toctrees are automatically numbered (don't give the ``numbered`` flag to those). Numbering up to a specific depth is also possible, by giving the depth as a numeric argument to ``numbered``. Simple "inclusion" of one file in another can be done with the :dudir:`include` directive. Since reST does not have facilities to interconnect several documents, or split documents into multiple output files, Sphinx uses a custom directive to add relations between the single files the documentation is made of, as well as tables of contents.  The ``toctree`` directive is the central element. Special names Sphinx knows that the relative order of the documents ``intro``, ``strings`` and so forth, and it knows that they are children of the shown document, the library index.  From this information it generates "next chapter", "previous chapter" and "parent chapter" links. Sphinx reserves some document names for its own use; you should not try to create documents with these names -- it will cause problems. Tables of contents from all those documents are inserted, with a maximum depth of two, that means one nested heading.  ``toctree`` directives in those documents are also taken into account. The "master document" (selected by :confval:`master_doc`) is the "root" of the TOC tree hierarchy.  It can be used as the documentation's main page, or as a "full table of contents" if you don't give a ``maxdepth`` option. The Python module index contains one entry per :rst:dir:`py:module` directive. The TOC tree The ``maxdepth`` option does not apply to the LaTeX writer, where the whole table of contents will always be presented at the begin of the document, and its depth is controlled by the ``tocdepth`` counter, which you can reset in your :confval:`latex_preamble` config value using e.g. ``\setcounter{tocdepth}{2}``. The general index is populated with entries from modules, all index-generating :ref:`object descriptions <basic-domain-markup>`, and from :rst:dir:`index` directives. The search page contains a form that uses the generated JSON search index and JavaScript to full-text search the generated documents for search words; it should work on every major browser that supports modern JavaScript. The second line above will link to the ``strings`` document, but will use the title "All about strings" instead of the title of the ``strings`` document. The special document names (and pages generated for them) are: The special entry name ``self`` stands for the document containing the toctree directive.  This is useful if you want to generate a "sitemap" from the toctree. These are used for the general index, the Python module index, and the search page, respectively. This accomplishes two things: This directive inserts a "TOC tree" at the current location, using the individual TOCs (including "sub-TOC trees") of the documents given in the directive body.  Relative document names (not beginning with a slash) are relative to the document the directive occurs in, absolute names are relative to the source directory.  A numeric ``maxdepth`` option may be given to indicate the depth of the tree; by default, all levels are included. [#]_ This includes first all documents whose names start with ``intro``, then all documents in the ``recipe`` folder, then all remaining documents (except the one containing the directive, of course.) [#]_ This will still notify Sphinx of the document hierarchy, but not insert links into the document at the location of the directive -- this makes sense if you intend to insert these links yourself, in a different style, or in the HTML sidebar. Though only few such names are currently used by Sphinx, you should not create documents or document-containing directories with such names.  (Using ``_`` as a prefix for a custom template directory is fine.) Use :confval:`exclude_patterns` to explicitly exclude documents or directories from building completely.  Use :ref:`the "orphan" metadata <metadata>` to let a document be built, but notify Sphinx that it is not reachable via a toctree. You can also add external links, by giving an HTTP URL instead of a document name. You can also give a "hidden" option to the directive, like this:: You can use "globbing" in toctree directives, by giving the ``glob`` flag option.  All entries are then matched against the list of available documents, and matches are inserted into the list alphabetically.  Example:: ``genindex``, ``modindex``, ``search`` contents every name beginning with ``_`` table of Project-Id-Version:  sphinx-doc-1.2.0
Report-Msgid-Bugs-To: 
POT-Creation-Date: 2015-03-11 04:27+0000
PO-Revision-Date: 2015-03-11 05:43+0000
Last-Translator: sphinx-users.jp <shimizukawa+sphinxjp@gmail.com>
Language-Team: Portuguese (Brazil) (http://www.transifex.com/sphinx-doc/sphinx-doc-1_2_0/language/pt_BR/)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Generated-By: Babel 2.1.1
 **Additional options** **Entries** **Section numbering** A note on available globbing syntax: you can use the standard shell constructs ``*``, ``?``, ``[...]`` and ``[!...]`` with the feature that these all don't match slashes.  A double star ``**`` can be used to match any sequence of characters *including* slashes. Added "globbing" option. Added "includehidden" option. Added "numbered" and "hidden" options as well as external links and support for "self" references. Added "titlesonly" option. Added numeric argument to "numbered". All other toctree entries can then be eliminated by the "hidden" option. Be careful with unusual characters in filenames.  Some formats may interpret these characters in unexpected ways: Consider this example (taken from the Python docs' library reference index):: Do not use the colon ``:`` for HTML based formats.  Links to other parts may not work. Do not use the plus ``+`` for the ePub format.  Some resources may not be found. Document titles in the :rst:dir:`toctree` will be automatically read from the title of the referenced document. If that isn't what you want, you can specify an explicit title and target using a similar syntax to reST hyperlinks (and Sphinx's :ref:`cross-referencing syntax <xref-syntax>`). This looks like:: Notas de Rodapé If you want only the titles of documents in the tree to show up, not other headings of the same level, you can use the ``titlesonly`` option:: If you want to have section numbers even in HTML output, give the **toplevel** toctree a ``numbered`` option.  For example:: In cases where you want to have only one top-level toctree and hide all other lower level toctrees you can add the "includehidden" option to the top-level toctree entry:: In the end, all documents in the :term:`source directory` (or subdirectories) must occur in some ``toctree`` directive; Sphinx will emit a warning if it finds a file that is not included, because that means that this file will not be reachable through standard navigation. Numbering then starts at the heading of ``foo``.  Sub-toctrees are automatically numbered (don't give the ``numbered`` flag to those). Numbering up to a specific depth is also possible, by giving the depth as a numeric argument to ``numbered``. Simple "inclusion" of one file in another can be done with the :dudir:`include` directive. Since reST does not have facilities to interconnect several documents, or split documents into multiple output files, Sphinx uses a custom directive to add relations between the single files the documentation is made of, as well as tables of contents.  The ``toctree`` directive is the central element. Special names Sphinx knows that the relative order of the documents ``intro``, ``strings`` and so forth, and it knows that they are children of the shown document, the library index.  From this information it generates "next chapter", "previous chapter" and "parent chapter" links. Sphinx reserves some document names for its own use; you should not try to create documents with these names -- it will cause problems. Tables of contents from all those documents are inserted, with a maximum depth of two, that means one nested heading.  ``toctree`` directives in those documents are also taken into account. The "master document" (selected by :confval:`master_doc`) is the "root" of the TOC tree hierarchy.  It can be used as the documentation's main page, or as a "full table of contents" if you don't give a ``maxdepth`` option. The Python module index contains one entry per :rst:dir:`py:module` directive. The TOC tree The ``maxdepth`` option does not apply to the LaTeX writer, where the whole table of contents will always be presented at the begin of the document, and its depth is controlled by the ``tocdepth`` counter, which you can reset in your :confval:`latex_preamble` config value using e.g. ``\setcounter{tocdepth}{2}``. The general index is populated with entries from modules, all index-generating :ref:`object descriptions <basic-domain-markup>`, and from :rst:dir:`index` directives. The search page contains a form that uses the generated JSON search index and JavaScript to full-text search the generated documents for search words; it should work on every major browser that supports modern JavaScript. The second line above will link to the ``strings`` document, but will use the title "All about strings" instead of the title of the ``strings`` document. The special document names (and pages generated for them) are: The special entry name ``self`` stands for the document containing the toctree directive.  This is useful if you want to generate a "sitemap" from the toctree. These are used for the general index, the Python module index, and the search page, respectively. This accomplishes two things: This directive inserts a "TOC tree" at the current location, using the individual TOCs (including "sub-TOC trees") of the documents given in the directive body.  Relative document names (not beginning with a slash) are relative to the document the directive occurs in, absolute names are relative to the source directory.  A numeric ``maxdepth`` option may be given to indicate the depth of the tree; by default, all levels are included. [#]_ This includes first all documents whose names start with ``intro``, then all documents in the ``recipe`` folder, then all remaining documents (except the one containing the directive, of course.) [#]_ This will still notify Sphinx of the document hierarchy, but not insert links into the document at the location of the directive -- this makes sense if you intend to insert these links yourself, in a different style, or in the HTML sidebar. Though only few such names are currently used by Sphinx, you should not create documents or document-containing directories with such names.  (Using ``_`` as a prefix for a custom template directory is fine.) Use :confval:`exclude_patterns` to explicitly exclude documents or directories from building completely.  Use :ref:`the "orphan" metadata <metadata>` to let a document be built, but notify Sphinx that it is not reachable via a toctree. You can also add external links, by giving an HTTP URL instead of a document name. You can also give a "hidden" option to the directive, like this:: You can use "globbing" in toctree directives, by giving the ``glob`` flag option.  All entries are then matched against the list of available documents, and matches are inserted into the list alphabetically.  Example:: ``genindex``, ``modindex``, ``search`` contents every name beginning with ``_`` table of 