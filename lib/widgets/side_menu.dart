import 'package:flutter/material.dart';
import 'package:reuzy/models/conversa.dart';

class SideMenu extends StatelessWidget {
  final String nome;
  final String fotoUrl;
  final int pontos;
  final VoidCallback onResgatarPontos;
  final VoidCallback onHistorico;
  final List<Conversa> conversas;

  const SideMenu({
    super.key,
    required this.nome,
    required this.fotoUrl,
    required this.pontos,
    required this.onResgatarPontos,
    required this.onHistorico,
    required this.conversas,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        width:
            MediaQuery.of(context).size.width *
            0.85, // Deixe 15% de espaço à esquerda
        height: double.infinity,
        color: Colors.white,
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Perfil
              Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 32,
                      backgroundImage: NetworkImage(fotoUrl),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            nome,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                          Row(
                            children: [
                              Text(
                                'Pontos: $pontos',
                                style: const TextStyle(fontSize: 15),
                              ),
                              const SizedBox(width: 4),
                              const Icon(
                                Icons.star,
                                color: Colors.amber,
                                size: 18,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              // Botões
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFB7E5B4),
                          foregroundColor: Colors.black,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        onPressed: onResgatarPontos,
                        child: const Text('Resgatar pontos'),
                      ),
                    ),
                    const SizedBox(height: 8),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFB7E5B4),
                          foregroundColor: Colors.black,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        onPressed: onHistorico,
                        child: const Text('Ver histórico de doações'),
                      ),
                    ),
                  ],
                ),
              ),
              const Divider(height: 32),
              // Conversas
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  'Todas as mensagens',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 8),
              Expanded(
                child: ListView.builder(
                  itemCount: conversas.length,
                  itemBuilder: (context, index) {
                    final conversa = conversas[index];
                    return ListTile(
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage(conversa.foto),
                      ),
                      title: Text(conversa.nome),
                      subtitle: Text(conversa.ultimaMensagem),
                      onTap: () {
                        // Abrir conversa
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
