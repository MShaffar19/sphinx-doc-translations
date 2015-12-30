��          L               |   �   }       r  }   �  �     �  �  �  q       $     �   B  �   �  �  �   An extension is simply a Python module.  When an extension is loaded, Sphinx imports this module and executes its ``setup()`` function, which in turn notifies Sphinx of everything the extension offers -- see the extension tutorial for examples. Developing extensions for Sphinx Since many projects will need special features in their documentation, Sphinx is designed to be extensible on several levels. The configuration file itself can be treated as an extension if it contains a ``setup()`` function.  All other extensions to load must be listed in the :confval:`extensions` configuration value. This is what you can do in an extension: First, you can add new :term:`builder`\s to support new output formats or actions on the parsed documents.  Then, it is possible to register custom reStructuredText roles and directives, extending the markup.  And finally, there are so-called "hook points" at strategic places throughout the build process, where an extension can register a hook and run specialized code. Project-Id-Version:  sphinx-doc-1.2.0
Report-Msgid-Bugs-To: 
POT-Creation-Date: 2015-03-11 04:27+0000
PO-Revision-Date: 2015-04-06 06:39+0000
Last-Translator: Takayuki Shimizukawa <shimizukawa@gmail.com>
Language-Team: Portuguese (Brazil) (http://www.transifex.com/sphinx-doc/sphinx-doc-1_2_0/language/pt_BR/)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Generated-By: Babel 2.1.1
 Uma extensão é simplesmente um módulo Python. Quando uma extensão é carregada, Sphinx importa esse módulo e executa sua função  ``setup()``, a qual notifica Sphinx de todas as ofertas que a extensão possui -- ver tutorial de exemplos de extensão. Desenvolvendo extensões para Sphinx Como muitos projetos necessitam de funcionalidades especiais em sua documentação, Sphix foi desenhado para ser extensível em diversos níveis. A configuração do próprio arquivo pode ser tratada como uma extensão se ela contiver uma função  ``setup()``. Todas as outras extensões para serem carregadas devem estar listadas em :confval:`extensions`  É para isto que serve uma extensão: Primeiro, adicinar novo :term:`construtor` para suporte do novo formato ou ação nos documentos envolvidos. Então, será possivel registrar diretivas e funções de marcas extendidas. E finalmente, existem os pontos "de referência" como locais estratégicos no processo de construção, onde uma extensão pode interagir e executar código específico. 