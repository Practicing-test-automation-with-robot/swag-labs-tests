import os
import re
import shutil

# Para rodar o script basta rodar o comando:
# python separar_robot.py

# Gerar caminho base para rodar script em diferentes pastas
def gerar_caminho_base(modulo_nome):
    base = r"C:\small-daily-challenges"
    caminho = os.path.join(base, modulo_nome, "resources")
    print(f"Caminho gerado: {caminho}")
    return caminho

    # adicionar o seguinte trecho na main: 

    # modulos = ["modulo_x", "modulo_financeiro", "modulo_vendas"]

    # for modulo in modulos:
    #     print(f"\n Processando módulo: {modulo}")
    #     caminho_resources = gerar_caminho_base(modulo)

    #     # Processa separação
    #     separar_arquivos_robot(caminho_resources)

    #     # Atualiza main
    #     atualizar_referencias_main(caminho_resources)

    #     # Apaga arquivos antigos
    #     apagar_arquivos_antigos(caminho_resources)

    #     print(f" Módulo {modulo} processado com sucesso!")

    # print("\n Todos os módulos foram processados com sucesso!")

# Script para separar seções de arquivos Robot Framework (.robot)
def separar_secoes(caminho_arquivo, dir_base):
    """Separa as seções e retorna os caminhos dos novos arquivos criados."""
    
    novos_caminhos = {'variables': None, 'keywords': None}
    
    with open(caminho_arquivo, 'r', encoding='utf-8') as f:
        conteudo = f.read()
    
    nome_arquivo = os.path.splitext(os.path.basename(caminho_arquivo))[0]

    # Padrões regex
    padrao_variables = r'\*\*\*\s*Variables\s*\*\*\*(.*?)((\*\*\*.*)|\Z)'
    padrao_keywords = r'\*\*\*\s*Keywords\s*\*\*\*(.*?)((\*\*\*.*)|\Z)'

    variaveis = re.search(padrao_variables, conteudo, re.DOTALL | re.IGNORECASE)
    keywords = re.search(padrao_keywords, conteudo, re.DOTALL | re.IGNORECASE)

    # Cria as pastas
    pasta_vars = os.path.join(dir_base, 'variables')
    pasta_kws = os.path.join(dir_base, 'keywords')

    os.makedirs(pasta_vars, exist_ok=True)
    os.makedirs(pasta_kws, exist_ok=True)

    cabecalho = '*** Settings ***\nResource    ../main.resource\nLibrary    SeleniumLibrary\n\n'

    # Salva variáveis
    if variaveis:
        caminho_vars = os.path.join(pasta_vars, f'var_{nome_arquivo}.resource')
        with open(caminho_vars, 'w', encoding='utf-8') as f:
            f.write(cabecalho)
            f.write('*** Variables ***\n')
            f.write(variaveis.group(1).strip())
        print(f"Arquivo de variáveis salvo: {caminho_vars}")
        novos_caminhos['variables'] = os.path.relpath(caminho_vars, dir_base).replace("\\", "/")

    # Salva keywords
    if keywords:
        caminho_kws = os.path.join(pasta_kws, f'kw_{nome_arquivo}.resource')
        with open(caminho_kws, 'w', encoding='utf-8') as f:
            f.write(cabecalho)
            f.write('*** Keywords ***\n')
            f.write(keywords.group(1).strip())
        print(f"Arquivo de keywords salvo: {caminho_kws}")
        novos_caminhos['keywords'] = os.path.relpath(caminho_kws, dir_base).replace("\\", "/")

    return novos_caminhos

# Função para processar a pasta e criar listas de novos caminhos
def processar_pasta(pasta):
    """Percorre a pasta, processa arquivos e retorna listas de novos caminhos."""
    arquivos_variaveis = []
    arquivos_keywords = []

    for dirpath, dirnames, filenames in os.walk(pasta):
        for nome_arquivo in filenames:
            if nome_arquivo.endswith('.robot'):
                caminho_completo = os.path.join(dirpath, nome_arquivo)
                print(f"Processando: {caminho_completo}")
                novos = separar_secoes(caminho_completo, pasta)

                if novos['variables']:
                    arquivos_variaveis.append(novos['variables'])
                if novos['keywords']:
                    arquivos_keywords.append(novos['keywords'])

    return arquivos_variaveis, arquivos_keywords

# Função para renomear main.robot para main.resource, fazer backup e atualizar referências
def renomear_e_atualizar_main(pasta, arquivos_variaveis, arquivos_keywords):
    """Renomeia main.robot para main.resource, faz backup e atualiza as referências."""
    main_robot = os.path.join(pasta, 'main.robot')
    main_backup = os.path.join(pasta, 'main_backup.robot')
    main_resource = os.path.join(pasta, 'main.resource')

    if not os.path.exists(main_robot):
        print("main.robot não encontrado!")
        return

    # Backup
    shutil.copy2(main_robot, main_backup)
    print(f"Backup criado: {main_backup}")

    # Renomeia
    os.rename(main_robot, main_resource)
    print(f"Renomeado para: {main_resource}")

    # Atualiza conteúdo
    with open(main_resource, 'r', encoding='utf-8') as f:
        conteudo = f.readlines()

    novo_conteudo = []
    for linha in conteudo:
        match = re.match(r'(Resource\s+)(.+\.robot)', linha, re.IGNORECASE)
        if match:
            nome = os.path.splitext(os.path.basename(match.group(2)))[0]
            # Procurar se há variáveis e keywords com esse nome
            var = next((v for v in arquivos_variaveis if f"var_{nome}.resource" in v), None)
            kw = next((k for k in arquivos_keywords if f"kw_{nome}.resource" in k), None)

            if var:
                novo_conteudo.append(f"Resource    ./{var}\n")
            if kw:
                novo_conteudo.append(f"Resource    ./{kw}\n")
        else:
            novo_conteudo.append(linha)

    # Sobrescreve
    with open(main_resource, 'w', encoding='utf-8') as f:
        f.writelines(novo_conteudo)

    print("main.resource atualizado com novos caminhos.")


# Função para apagar arquivos antigos
def apagar_arquivos_antigos(diretorio, extensao='.robot'):
    for root, _, files in os.walk(diretorio):
        for file in files:
            if file.endswith(extensao):
                caminho_arquivo = os.path.join(root, file)
                os.remove(caminho_arquivo)
                print(f"❌ Arquivo apagado: {caminho_arquivo}")



# Função principal para executar o script
def main():
    pasta = r"C:\small-daily-challenges\swag-labs-tests\resources"

    # Processa a pasta e obtém listas de arquivos variáveis e keywords
    arquivos_variaveis, arquivos_keywords = processar_pasta(pasta)

    # Renomeia main.robot para main.resource e atualiza referências
    renomear_e_atualizar_main(pasta, arquivos_variaveis, arquivos_keywords)

    # Apaga arquivos antigos
    apagar_arquivos_antigos(pasta)

    print("\nProcessamento concluído.")

if __name__ == "__main__":
    main()

