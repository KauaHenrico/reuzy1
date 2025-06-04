import 'package:flutter/material.dart';
import 'package:reuzy/widgets/custom_drawer.dart';
import 'package:reuzy/widgets/side_menu.dart';
import 'package:reuzy/models/conversa.dart';

class YourChatScreen extends StatelessWidget {
  const YourChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(
        nome: 'Floriano da Moura',
        fotoUrl:
            'https://randomuser.me/api/portraits/men/1.jpg', // coloque o link real da foto
        pontos: 20394,
        onResgatarPontos: () {
          // ação ao clicar em "Resgatar pontos"
        },
        onHistorico: () {
          // ação ao clicar em "Ver histórico de doações"
        },
        conversas: [
          Conversa(
            nome: 'Jennifer Markus',
            foto: 'https://randomuser.me/api/portraits/women/2.jpg',
            ultimaMensagem:
                'Boa tarde! Onde podemos nos encontrar para a doação?',
          ),
          Conversa(
            nome: 'Iva Ryan',
            foto: 'https://randomuser.me/api/portraits/women/3.jpg',
            ultimaMensagem: 'Troca Finalizada!',
          ),
          Conversa(
            nome: 'Jerry Helfer',
            foto: 'https://randomuser.me/api/portraits/men/4.jpg',
            ultimaMensagem: 'Doação Finalizada!',
          ),
          Conversa(
            nome: 'David Elson',
            foto: 'https://randomuser.me/api/portraits/men/5.jpg',
            ultimaMensagem: 'Doação Finalizada!',
          ),
          Conversa(
            nome: 'Mary Freund',
            foto: 'https://randomuser.me/api/portraits/women/6.jpg',
            ultimaMensagem: 'Doação Finalizada!',
          ),
        ],
      ),
      appBar: CustomChatAppBar(
        onMenu: () {
          Scaffold.of(context).openDrawer();
        },
      ),
      body: Center(child: Text('Conteúdo do chat aqui')),
    );
  }
}

class CustomChatAppBar extends StatelessWidget implements PreferredSizeWidget {
  final VoidCallback? onSearch;
  final VoidCallback? onMenu;

  const CustomChatAppBar({super.key, this.onSearch, this.onMenu});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Botão de busca com padding top e bottom
          Padding(
            padding: const EdgeInsets.only(
              top: 48,
              bottom: 16,
            ), // 3rem top, 1rem bottom
            child: Ink(
              decoration: const ShapeDecoration(
                color: Color(0xFFFDF3E4),
                shape: CircleBorder(),
              ),
              child: IconButton(
                icon: const Icon(Icons.search, color: Color(0xFF146356)),
                onPressed: onSearch,
              ),
            ),
          ),
          // Logo centralizada com padding top e bottom
          Padding(
            padding: const EdgeInsets.only(
              top: 48,
              bottom: 16,
            ), // 3rem top, 1rem bottom
            child: SizedBox(
              height: 32,
              child: Image.asset('assets/logo.png', fit: BoxFit.contain),
            ),
          ),
          // Botão de menu com Builder para contexto correto
          Padding(
            padding: const EdgeInsets.only(top: 48, bottom: 16),
            child: Builder(
              builder: (context) => IconButton(
                icon: const Icon(Icons.menu, color: Color(0xFF146356)),
                onPressed: () {
                  showGeneralDialog(
                    context: context,
                    barrierDismissible: true,
                    barrierLabel: "Menu",
                    transitionDuration: const Duration(milliseconds: 300),
                    pageBuilder: (context, anim1, anim2) {
                      return SideMenu(
                        nome: 'Floriano da Moura',
                        fotoUrl:
                            'https://randomuser.me/api/portraits/men/1.jpg',
                        pontos: 20394,
                        onResgatarPontos: () {},
                        onHistorico: () {},
                        conversas: [
                          Conversa(
                            nome: 'Jennifer Markus',
                            foto:
                                'https://randomuser.me/api/portraits/women/2.jpg',
                            ultimaMensagem:
                                'Boa tarde! Onde podemos nos encontrar para a doação?',
                          ),
                          // ...outras conversas
                        ],
                      );
                    },
                    transitionBuilder: (context, anim1, anim2, child) {
                      return SlideTransition(
                        position: Tween(
                          begin: const Offset(1, 0), // Direita para esquerda
                          end: Offset.zero,
                        ).animate(anim1),
                        child: child,
                      );
                    },
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56);
}
