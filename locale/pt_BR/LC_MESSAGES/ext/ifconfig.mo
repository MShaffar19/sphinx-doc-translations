��          T               �   D   �      �   �   �   �   �  @   w  �   �  �  P  D   �     @  �   `  �   C  @   �  �   &   :mod:`sphinx.ext.ifconfig` -- Include content based on configuration For example, one could write :: Include content of the directive only if the Python expression given as an argument is ``True``, evaluated in the namespace of the project's configuration (that is, all registered variables from :file:`conf.py` are available). The second argument is the default value, the third should always be ``True`` for such values (it selects if Sphinx re-reads the documents if the value changes). This extension is quite simple, and features only one directive: To make a custom config value known to Sphinx, use :func:`~sphinx.application.Sphinx.add_config_value` in the setup function in :file:`conf.py`, e.g.:: Project-Id-Version:  sphinx-doc-1.2.0
Report-Msgid-Bugs-To: 
POT-Creation-Date: 2015-03-11 04:27+0000
PO-Revision-Date: 2014-07-13 04:48+0000
Last-Translator: Takayuki Shimizukawa <shimizukawa@gmail.com>
Language-Team: Portuguese (Brazil) (http://www.transifex.com/sphinx-doc/sphinx-doc-1_2_0/language/pt_BR/)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Generated-By: Babel 2.1.1
 :mod:`sphinx.ext.ifconfig` -- Include content based on configuration For example, one could write :: Include content of the directive only if the Python expression given as an argument is ``True``, evaluated in the namespace of the project's configuration (that is, all registered variables from :file:`conf.py` are available). The second argument is the default value, the third should always be ``True`` for such values (it selects if Sphinx re-reads the documents if the value changes). This extension is quite simple, and features only one directive: To make a custom config value known to Sphinx, use :func:`~sphinx.application.Sphinx.add_config_value` in the setup function in :file:`conf.py`, e.g.:: 