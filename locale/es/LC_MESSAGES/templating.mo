��    c      4              L  e   M  �   �  �   e    �  Q   	  �   U	  �   P
  -        J  �   Q  4   �       3   .  6   b  �   �     G     X  �   i  �     k   �  �  D     �  -   �  $         E  �   b  U   �  !   :     \  /   y  �   �  8  3  �   l  W  )  
   �  v   �  �     k   �     R  �   b  �   �  4  �  �   �  �   _  �     ;     
  T  P   _  q   �  8   "  �   [  P   �  �   2   ;   !  >   L!  @   �!  q   �!  )   >"  B   h"  �   �"  "   ;#  )   ^#  ,   �#  B   �#      �#      $      :$  �   [$  $   #%  �   H%  P   �%  Y  C&  �   �'    c(  0   z)  �   �)  V   z*  "   �*  �   �*  �   �+  �   a,  q   -  ]   �-  �   �-  Z   ~.  	   �.  
   �.     �.     �.  
   /     /     $/     B/     Z/     h/     u/     �/     �/  �  �/  e   /1  �   �1  �   G2    �2  Q   �3  �   74  �   25  -   �5     ,6  �   36  4   �6     �6  3   7  6   D7  �   {7     )8     :8  �   K8  �   �8  k   �9  �  &:     �;  -   �;  $   <     '<  �   D<  U   �<  !   =     >=  /   [=  �   �=  8  >  �   N?  W  @  
   cA  v   nA  �   �A  k   �B     4C  �   DC  �   �C  4  gD  �   �E  �   AF  �   �F  ;   �G  
  6H  P   AI  q   �I  8   J  �   =J  P   �J  �   K  ;   �K  >   .L  @   mL  q   �L  )    M  B   JM  �   �M  "   N  )   @N  ,   jN  B   �N      �N      �N      O  �   =O  $   P  �   *P  P   �P  Y  %Q  �   R    ES  0   \T  �   �T  V   \U  "   �U  �   �U  �   �V  �   CW  q   �W  ]   mX  �   �X  Z   `Y  	   �Y  
   �Y     �Y     �Y  
   �Y     �Y     Z     $Z     <Z     JZ     WZ     gZ     {Z   (The `sidebar2` location for the sidebar is needed by the ``sphinxdoc.css`` stylesheet, for example.) **Important**: If you override a block, call ``{{ super() }}`` somewhere to render the block's content in the extended template -- unless you don't want that content to show up. A callable yielding the global TOC tree containing the current page, rendered as HTML bullet lists.  Optional keyword arguments: A list of links to put at the left side of the relbar, next to "next" and "prev".  This usually contains links to the general index and other indices, such as the Python module index.  If you add something yourself, it must be a tuple ``(pagename, link title, accesskey, link text)``. A list of parent documents for navigation, structured like the :data:`next` item. A possible location for a sidebar.  `sidebar1` appears before the document and is empty by default, `sidebar2` after the document and contains the default sidebar.  If you want to swap the sidebar location override this and call the `sidebar` helper: A template contains **variables**, which are replaced with values when the template is evaluated, **tags**, which control the logic of the template and **blocks** which are used for template inheritance. Add additional script files here, like this:: Blocks By prefixing the name of the overridden template with an exclamation mark, Sphinx will load the layout template from the underlying HTML theme. Check if a document with the name *document* exists. Configuration Variables Do I need to use Sphinx' templates to produce HTML? Document metadata (a dictionary), see :ref:`metadata`. For example, to add a new link to the template area containing related links all you have to do is to add a new template called ``layout.html`` with the following contents:: Global Variables Helper Functions In addition to these values, there are also all **theme options** available (prefixed by ``theme_``), as well as the values given by the user in :confval:`html_context`. In documents that are created from source files (as opposed to automatically-generated files like the module index, or documents that already are in HTML form), these variables are also available: Inside templates you can set a couple of variables used by the layout template using the ``{% set %}`` tag: Inside the relbar there are three sections: The `rootrellink`, the links from the documentation and the custom `relbaritems`.  The `rootrellink` is a block that by default contains a list item pointing to the master document by default, the `relbaritems` is an empty block.  If you override them to add extra links into the bar make sure that they are list items and end with the :data:`reldelim1`. Jinja/Sphinx Templating Primer Like :data:`next`, but for the previous page. No.  You have several other options: Overriding works like this:: Return the path to a *file* which is a filename relative to the root of the generated output.  Use this to refer to static files. Return the path to a Sphinx document as a URL.  Use this to refer to built documents. Return the rendered relation bar. Return the rendered sidebar. Similar to :data:`script_files`, for CSS files. Sphinx provides various Jinja functions as helpers in the template.  You can use them to generate links or output multiply used elements. Sphinx uses the `Jinja <http://jinja.pocoo.org>`_ templating engine for its HTML templates.  Jinja is a text-based engine, and inspired by Django templates, so anyone having used Django will already be familiar with it.  It also has excellent documentation for those who need to make themselves familiar with it. Sphinx will look for templates in the folders of :confval:`templates_path` first, and if it can't find the template it's looking for there, it falls back to the selected theme's templates. Sphinx' *basic* theme provides base templates with a couple of blocks it will fill with data.  These are located in the :file:`themes/basic` subdirectory of the Sphinx installation directory, and used by all builtin Sphinx themes. Templates with the same name in the :confval:`templates_path` override templates supplied by the selected theme. Templating The "Show source" link within the sidebar (normally only shown if this is enabled by :confval:`html_show_sourcelink`). The "page name" of the current file, i.e. either the document name if the file is generated from a reST source, or the equivalent hierarchical name relative to the output directory (``[directory/]filename_without_extension``). The block for the footer div.  If you want a custom footer or markup before or after it, override this one. The build date. The builtin **basic** theme supplies the templates that all builtin Sphinx themes are based on.  It has the following elements you can override or use: The contents of the document itself.  It contains the block "body" where the individual content is put by subtemplates like ``page.html``. The default templating language in Sphinx is Jinja.  It's Django/Smarty inspired and easy to understand.  The most important concept in Jinja is :dfn:`template inheritance`, which means that you can overwrite only specific blocks within a template, customizing it while also keeping the changes at a minimum. The delimiter for the items on the left side of the related bar.  This defaults to ``' &raquo;'`` Each item in the related bar ends with the value of this variable. The delimiter for the items on the right side of the related bar.  This defaults to ``' |'``.  Each item except of the last one in the related bar ends with the value of this variable. The doctype of the output format.  By default this is XHTML 1.0 Transitional as this is the closest to what Sphinx and Docutils generate and it's a good idea not to change it unless you want to switch to HTML 5 or a different but compatible XHTML doctype. The following blocks exist in the ``layout.html`` template: The following four blocks are *only* used for pages that do not have assigned a list of custom sidebars in the :confval:`html_sidebars` config value.  Their use is deprecated in favor of separate sidebar templates, which can be included via :confval:`html_sidebars`. The local table of contents for the current page, rendered as HTML bullet lists. The logo location within the sidebar.  Override this if you want to place some content at the top of the sidebar. The name of the builder (e.g. ``html`` or ``htmlhelp``). The name of the copied source file for the current document.  This is only nonempty if the :confval:`html_copy_source` value is true. The name of the main stylesheet, as given by the theme or :confval:`html_style`. The next document for the navigation.  This variable is either false or has two attributes `link` and `title`.  The title contains HTML markup.  For example, to generate a link to the next page, you can use this snippet:: The path to the HTML favicon in the static path, or ``''``. The path to the HTML logo image in the static path, or ``''``. The relation links (previous, next document) within the sidebar. The search box within the sidebar.  Override this if you want to place some content at the bottom of the sidebar. The table of contents within the sidebar. The title of the current document, as used in the ``<title>`` tag. The title of the documentation (the value of :confval:`html_title`), except when the "single-file" builder is used, when it is set to ``None``. The value of :confval:`copyright`. The value of :confval:`html_short_title`. The value of :confval:`html_use_opensearch`. The value of :confval:`master_doc`, for usage with :func:`pathto`. The value of :confval:`project`. The value of :confval:`release`. The value of :confval:`version`. The value of the builder's :attr:`~.SerializingHTMLBuilder.out_suffix` attribute, i.e. the file name extension that the output files will get.  For a standard HTML builder, this is usually ``.html``. The version of Sphinx used to build. These global variables are available in every template and are safe to use. There are more, but most of them are an implementation detail and might change in the future. This block adds a couple of ``<link>`` tags to the head section of the template. This block contains the *relation bar*, the list of related links (the parent documents on the left, and the links to index, modules etc. on the right).  `relbar1` appears before the document, `relbar2` after the document.  By default, both blocks are filled; to show the relbar only before the document, you would override `relbar2` like this:: This block is empty by default and can be used to add extra contents into the ``<head>`` tag of the generated HTML file.  This is the right place to add references to JavaScript or extra CSS files. To customize the output of your documentation you can override all the templates (both the layout templates and the child templates) by adding files with the same name as the original filename into the template directory of the structure the Sphinx quickstart generated for you. True if :confval:`html_show_sourcelink` is true. True if the built HTML is meant to be embedded in some viewing application that handles navigation, not the web browser, such as for HTML help or Qt help formats.  In this case, the sidebar is not included. True if the reST document sources are copied (if :confval:`html_copy_source` is true). Working with the builtin templates You can :ref:`write a custom builder <writing-builders>` that derives from :class:`~sphinx.builders.html.StandaloneHTMLBuilder` and calls your template engine of choice. You can use the :class:`~sphinx.builders.html.PickleHTMLBuilder` that produces pickle files with the page contents, and postprocess them using a custom tool, or use them in your Web application. You can write a :class:`~sphinx.application.TemplateBridge` subclass that calls your template engine of choice, and set the :confval:`template_bridge` configuration value accordingly. ``collapse`` (true by default): if true, all TOC entries that are not ancestors of the current page are collapsed ``includehidden`` (false by default): if true, the TOC tree will also contain hidden entries. ``maxdepth`` (defaults to the max depth selected in the toctree directive): the maximum depth of the tree; set it to ``-1`` to allow unlimited depth ``titles_only`` (false by default): if true, put only toplevel document titles in the tree `doctype` `document` `extrahead` `footer` `linktags` `relbar1` / `relbar2` `rootrellink` / `relbaritems` `sidebar1` / `sidebar2` `sidebarlogo` `sidebarrel` `sidebarsearch` `sidebarsourcelink` `sidebartoc` Project-Id-Version:  sphinx-doc-1.2.0
Report-Msgid-Bugs-To: 
POT-Creation-Date: 2015-03-11 04:27+0000
PO-Revision-Date: 2013-01-28 12:43+0000
Last-Translator: FULL NAME <EMAIL@ADDRESS>
Language-Team: Spanish (http://www.transifex.com/sphinx-doc/sphinx-doc-1_2_0/language/es/)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Generated-By: Babel 2.1.1
 (The `sidebar2` location for the sidebar is needed by the ``sphinxdoc.css`` stylesheet, for example.) **Important**: If you override a block, call ``{{ super() }}`` somewhere to render the block's content in the extended template -- unless you don't want that content to show up. A callable yielding the global TOC tree containing the current page, rendered as HTML bullet lists.  Optional keyword arguments: A list of links to put at the left side of the relbar, next to "next" and "prev".  This usually contains links to the general index and other indices, such as the Python module index.  If you add something yourself, it must be a tuple ``(pagename, link title, accesskey, link text)``. A list of parent documents for navigation, structured like the :data:`next` item. A possible location for a sidebar.  `sidebar1` appears before the document and is empty by default, `sidebar2` after the document and contains the default sidebar.  If you want to swap the sidebar location override this and call the `sidebar` helper: A template contains **variables**, which are replaced with values when the template is evaluated, **tags**, which control the logic of the template and **blocks** which are used for template inheritance. Add additional script files here, like this:: Blocks By prefixing the name of the overridden template with an exclamation mark, Sphinx will load the layout template from the underlying HTML theme. Check if a document with the name *document* exists. Configuration Variables Do I need to use Sphinx' templates to produce HTML? Document metadata (a dictionary), see :ref:`metadata`. For example, to add a new link to the template area containing related links all you have to do is to add a new template called ``layout.html`` with the following contents:: Global Variables Helper Functions In addition to these values, there are also all **theme options** available (prefixed by ``theme_``), as well as the values given by the user in :confval:`html_context`. In documents that are created from source files (as opposed to automatically-generated files like the module index, or documents that already are in HTML form), these variables are also available: Inside templates you can set a couple of variables used by the layout template using the ``{% set %}`` tag: Inside the relbar there are three sections: The `rootrellink`, the links from the documentation and the custom `relbaritems`.  The `rootrellink` is a block that by default contains a list item pointing to the master document by default, the `relbaritems` is an empty block.  If you override them to add extra links into the bar make sure that they are list items and end with the :data:`reldelim1`. Jinja/Sphinx Templating Primer Like :data:`next`, but for the previous page. No.  You have several other options: Overriding works like this:: Return the path to a *file* which is a filename relative to the root of the generated output.  Use this to refer to static files. Return the path to a Sphinx document as a URL.  Use this to refer to built documents. Return the rendered relation bar. Return the rendered sidebar. Similar to :data:`script_files`, for CSS files. Sphinx provides various Jinja functions as helpers in the template.  You can use them to generate links or output multiply used elements. Sphinx uses the `Jinja <http://jinja.pocoo.org>`_ templating engine for its HTML templates.  Jinja is a text-based engine, and inspired by Django templates, so anyone having used Django will already be familiar with it.  It also has excellent documentation for those who need to make themselves familiar with it. Sphinx will look for templates in the folders of :confval:`templates_path` first, and if it can't find the template it's looking for there, it falls back to the selected theme's templates. Sphinx' *basic* theme provides base templates with a couple of blocks it will fill with data.  These are located in the :file:`themes/basic` subdirectory of the Sphinx installation directory, and used by all builtin Sphinx themes. Templates with the same name in the :confval:`templates_path` override templates supplied by the selected theme. Plantillas The "Show source" link within the sidebar (normally only shown if this is enabled by :confval:`html_show_sourcelink`). The "page name" of the current file, i.e. either the document name if the file is generated from a reST source, or the equivalent hierarchical name relative to the output directory (``[directory/]filename_without_extension``). The block for the footer div.  If you want a custom footer or markup before or after it, override this one. The build date. The builtin **basic** theme supplies the templates that all builtin Sphinx themes are based on.  It has the following elements you can override or use: The contents of the document itself.  It contains the block "body" where the individual content is put by subtemplates like ``page.html``. The default templating language in Sphinx is Jinja.  It's Django/Smarty inspired and easy to understand.  The most important concept in Jinja is :dfn:`template inheritance`, which means that you can overwrite only specific blocks within a template, customizing it while also keeping the changes at a minimum. The delimiter for the items on the left side of the related bar.  This defaults to ``' &raquo;'`` Each item in the related bar ends with the value of this variable. The delimiter for the items on the right side of the related bar.  This defaults to ``' |'``.  Each item except of the last one in the related bar ends with the value of this variable. The doctype of the output format.  By default this is XHTML 1.0 Transitional as this is the closest to what Sphinx and Docutils generate and it's a good idea not to change it unless you want to switch to HTML 5 or a different but compatible XHTML doctype. The following blocks exist in the ``layout.html`` template: The following four blocks are *only* used for pages that do not have assigned a list of custom sidebars in the :confval:`html_sidebars` config value.  Their use is deprecated in favor of separate sidebar templates, which can be included via :confval:`html_sidebars`. The local table of contents for the current page, rendered as HTML bullet lists. The logo location within the sidebar.  Override this if you want to place some content at the top of the sidebar. The name of the builder (e.g. ``html`` or ``htmlhelp``). The name of the copied source file for the current document.  This is only nonempty if the :confval:`html_copy_source` value is true. The name of the main stylesheet, as given by the theme or :confval:`html_style`. The next document for the navigation.  This variable is either false or has two attributes `link` and `title`.  The title contains HTML markup.  For example, to generate a link to the next page, you can use this snippet:: The path to the HTML favicon in the static path, or ``''``. The path to the HTML logo image in the static path, or ``''``. The relation links (previous, next document) within the sidebar. The search box within the sidebar.  Override this if you want to place some content at the bottom of the sidebar. The table of contents within the sidebar. The title of the current document, as used in the ``<title>`` tag. The title of the documentation (the value of :confval:`html_title`), except when the "single-file" builder is used, when it is set to ``None``. The value of :confval:`copyright`. The value of :confval:`html_short_title`. The value of :confval:`html_use_opensearch`. The value of :confval:`master_doc`, for usage with :func:`pathto`. The value of :confval:`project`. The value of :confval:`release`. The value of :confval:`version`. The value of the builder's :attr:`~.SerializingHTMLBuilder.out_suffix` attribute, i.e. the file name extension that the output files will get.  For a standard HTML builder, this is usually ``.html``. The version of Sphinx used to build. These global variables are available in every template and are safe to use. There are more, but most of them are an implementation detail and might change in the future. This block adds a couple of ``<link>`` tags to the head section of the template. This block contains the *relation bar*, the list of related links (the parent documents on the left, and the links to index, modules etc. on the right).  `relbar1` appears before the document, `relbar2` after the document.  By default, both blocks are filled; to show the relbar only before the document, you would override `relbar2` like this:: This block is empty by default and can be used to add extra contents into the ``<head>`` tag of the generated HTML file.  This is the right place to add references to JavaScript or extra CSS files. To customize the output of your documentation you can override all the templates (both the layout templates and the child templates) by adding files with the same name as the original filename into the template directory of the structure the Sphinx quickstart generated for you. True if :confval:`html_show_sourcelink` is true. True if the built HTML is meant to be embedded in some viewing application that handles navigation, not the web browser, such as for HTML help or Qt help formats.  In this case, the sidebar is not included. True if the reST document sources are copied (if :confval:`html_copy_source` is true). Working with the builtin templates You can :ref:`write a custom builder <writing-builders>` that derives from :class:`~sphinx.builders.html.StandaloneHTMLBuilder` and calls your template engine of choice. You can use the :class:`~sphinx.builders.html.PickleHTMLBuilder` that produces pickle files with the page contents, and postprocess them using a custom tool, or use them in your Web application. You can write a :class:`~sphinx.application.TemplateBridge` subclass that calls your template engine of choice, and set the :confval:`template_bridge` configuration value accordingly. ``collapse`` (true by default): if true, all TOC entries that are not ancestors of the current page are collapsed ``includehidden`` (false by default): if true, the TOC tree will also contain hidden entries. ``maxdepth`` (defaults to the max depth selected in the toctree directive): the maximum depth of the tree; set it to ``-1`` to allow unlimited depth ``titles_only`` (false by default): if true, put only toplevel document titles in the tree `doctype` `document` `extrahead` `footer` `linktags` `relbar1` / `relbar2` `rootrellink` / `relbaritems` `sidebar1` / `sidebar2` `sidebarlogo` `sidebarrel` `sidebarsearch` `sidebarsourcelink` `sidebartoc` 