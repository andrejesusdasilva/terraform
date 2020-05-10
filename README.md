# Objetivo
Ter uma infraestrutura local Aws + Terraform para poder fazer testes iniciais e se familiarizar com os conceitos de nuvem da Aws.

Criado vpv, security group, internet gateway, pares de chaves para acesso a máquina, volume ebs, busca AMI, alterado o tamanho do disco da AMI utilizada, comentado a instalação via "remote-exec", utilizado a funcionalidade de output para printar a chave e criado subnet.

Criado um Jenkinsfile para parametrizar a construção do Job via Jenkins, para evitar a execução de várias linhas de comando na shell. Todos os comandos podem ser adicionados no Jenkinsfile.