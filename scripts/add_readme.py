import os

def criar_readmes(base_dir):
    """
    Cria um README.md em cada uma das pastas especificadas, com conteúdo padrão ou personalizado.
    
    Parâmetros:
        base_dir (str): Caminho absoluto ou relativo para o diretório base onde estão as pastas.
    """
    pastas = [
        'resource/auth',
        'resource/keywords',
        'resource/variables',  # Corrigido 'variebles' para 'variables'
        'suites'
    ]
    
    for pasta in pastas:
        caminho_completo = os.path.join(base_dir, pasta)
        readme_path = os.path.join(caminho_completo, 'README.md')
        
        if not os.path.exists(caminho_completo):
            os.makedirs(caminho_completo)
            print(f'Pasta criada: {caminho_completo}')
        
        if not os.path.exists(readme_path):
            with open(readme_path, 'w', encoding='utf-8') as f:
                if pasta == 'resource/keywords':
                    f.write("# Keywords\n\n")
                    f.write("Este diretório contém as **keywords** reutilizáveis usadas nos testes automatizados.\n\n")
                    f.write("## O que são Keywords?\n")
                    f.write("Keywords são funções ou procedimentos reutilizáveis que encapsulam passos comuns ou complexos dos testes. Elas ajudam a manter os testes mais legíveis, organizados e fáceis de manter.\n\n")
                    
                    f.write("## Boas práticas de escrita\n")
                    f.write("- Escolha nomes descritivos e claros.\n")
                    f.write("- Use o padrão `Title Case` ou `snake_case` conforme a convenção do projeto.\n")
                    f.write("- Mantenha a responsabilidade única para cada keyword.\n")
                    f.write("- Evite duplicações; centralize lógicas comuns.\n\n")
                    
                    f.write("## Uso de Documentation e Comentários\n")
                    f.write("- Sempre utilize a tag `Documentation` para explicar o objetivo da keyword.\n")
                    f.write("- Use **comentários** (`#`) para separar blocos lógicos dentro do arquivo:\n")
                    f.write("  - **Flows**: sequências completas de ações.\n")
                    f.write("  - **Pages**: ações ou interações específicas de uma página.\n")
                    f.write("  - **Validations**: verificações de estado ou assertivas.\n\n")
                    
                    f.write("## Sumário\n")
                    f.write("Inclua um sumário no início do arquivo, listando as principais keywords implementadas, para facilitar a navegação e entendimento.\n\n")
                    
                    f.write("_Exemplo:_\n")
                    f.write("```robot\n")
                    f.write("# Sumário\n")
                    f.write("# - Login Flow\n")
                    f.write("# - Preencher Formulário\n")
                    f.write("# - Validar Mensagem de Sucesso\n")
                    f.write("```\n")
                    
                    f.write("\n---\n")
                    f.write("Manter este diretório bem estruturado é fundamental para garantir a qualidade e a escalabilidade dos testes.\n")
                else:
                    nome = pasta.split('/')[-1].capitalize()
                    f.write(f"# {nome}\n\n")
                    f.write(f"Este diretório contém os arquivos relacionados ao módulo `{pasta}`.\n")
            
            print(f'README.md criado em: {readme_path}')
        else:
            print(f'README.md já existe em: {readme_path}')

# Exemplo de uso
# criar_readmes('.')  # Use '.' para o diretório atual ou substitua pelo caminho desejado.



# Função principal para executar o script
def main():
    criar_readmes('.')
    print("Todos os READMEs foram criados ou verificados com sucesso.")
    print("\nProcessamento concluído.")

if __name__ == "__main__":
    main()