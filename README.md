# Mprofiler (Minerador profiler)
MProfiler é um ruby gem criado para processar dados de conta telefonica, sendo esta em formato csv. 

## Utilização
Mprofiler foi criado para ser utilizado na linha de comando, ele espera como parametro o caminho para um arquivo csv com os dados da conta. Também existe um parametro opcional que é o caminho para um arquivo de configuração, seguindo um padrão exibido abaixo.
### Executando o gem
Após instalar o gem, basta rodar o seguinte comando substituindo o parametro com o caminho para o csv que deseja processar.
`mprofiler /caminho/para/o/arquivo.csv`
### Arquivo de configuração
Adicionando mais flexibilidade a gem, existe a possibilidade de editar as configurações utilizada no processo. Com isso podemos alterar as seguintes configurações:
-  **match_key**: o nome da coluna no csv em que devo procura o padrão que caracteriza determinado tipo de dado;
- **calc_key**: o nome da coluna no csv que utilizarei para extrair os valores para contabilização;
- **keys**: um dicionario onde a chave é a identificação do serviço a processar e o valor é um dicionario com as seguintes keys:
    - **pattern**: regex responsavel por definir se determinada linha pertence ao tipo de serviço especificado anteriormente;
    - **process_method**: como o dado presente na _calc_keY_ será contabilizado;
Existe atualmente três metodos permitidos no **process_method**, são eles:
- **count_occurrences**: é contada cada ocorrencia deste padrão;
- **sum_bytes**: o valor é convertido, considerando unidade de medida utilizada(KB,MB,GB), e somado com outras ocorrencias do mesmo padrão;
- **sum_minutes**: o valor é convertido, separando os minutos e segundos, e somado com outras ocorrencias do mesmo padrão;;

Exemplo do arquivo de configuração esperado:
**config.yaml**
```
match_key : new_match_key
calc_key  : new_calc_key
keys      : 
    internet:
        pattern: /new_pattern/
        process_method: sum_bytes
    sms:
        pattern: /SMS/
        process_method: count_occurrences
    local_cellphone:
        pattern: /Locais.*Celulares/
        process_method: sum_minutes
    local_phone:
        pattern: /Locais.*Fixos/
        process_method: sum_minutes
    long_distance_cellphone:
        pattern: /Longa Distância.*Celulares/
        process_method: sum_minutes
    long_distance_phone:
        pattern: /Longa Distância/
        process_method: sum_minutes
```
Para utilizar uma configuração custom na gem, basta informar o arquivo da seguinte forma:
- `mprofiler /caminho/para/o/arquivo.csv /caminho/para/o/arquivo/de/configuracao.yaml`