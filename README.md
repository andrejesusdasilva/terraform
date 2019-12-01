# Objetivo
Ter uma infraestrutura local Aws + Terraform para poder fazer testes iniciais e se familiarizar com os conceitos de nuvem da Aws.

## Pré Requisitos para estes testes
* Windows 7 + Docker Machine
* Já ter uma Vm configurada funcionando o docker
* Docker-Compose
* Fazer um clone do projeto ``` ssh://git@stash.matera.com:7999/~andrej/lab_localstack_terraform.git ``` 

### Subir os serviços desejados no localstack

Foram realizados testes com os serviços **EC2** e **S3**
	
* Editar o arquivo **docker-compose.yaml**
* Adicionar os serviços para testes em ** SERVICES=ec2,s3 ** 
* As portas podem ser modificadas

```
docker-compose up -d
docker-compose logs -f (para consultar a saída)
```
### Terraform

Editar a tag  **endpoints** no script **cria_ec2_terraform.tf**. Ele deve apontar para o endereço do servidor onde subiu o docker-compose.

As informações de ** acess_key ** e ** secret_key ** são fakes.

obs: No exemplo **ec2 = "http://192.168.99.101:4597"**, é o endereço da Vm do docker-machine.

Gerar a imagem docker:
```
docker build -t terraform_localstack -f Dockerfile_Terraform .
```

Criar o container:
```
docker run --rm terraform_localstack
```
Neste momento o **Terraform** vai criar as **EC2** na Aws fake (localstack)

Acessar o Dashboard **http://192.168.99.101:8080/#!/infra**

### Comandos úteis para testes:

É necessário ter o **aws cli** instalado.

**Criando bucket**:
aws --endpoint-url=http://192.168.99.101:4572 s3 mb s3://test-bucket

**Copiando arquivo**:
aws --endpoint-url=http://192.168.99.101:4572 s3 cp teste.txt s3://test-bucket

**Listando as instancias**
aws ec2 --endpoint-url=http://192.168.99.101:4572 describe-instances

**Criando instancias**
aws ec2 run-instances --endpoint-url http://192.168.99.101:4597 --count 3 --image-id ami-4dd2575b --key-name andre.jesus --security-group-id sg-4160203e --instance-type us-east-1 --output text

**Terminando instancias**
aws ec2 --endpoint-url http://192.168.99.101:4597 terminate-instances --instance-ids $(aws ec2 --endpoint-url http://192.168.99.101:4597 describe-instances | grep InstanceId | awk '{ print $2}' | sed 's/[^a-z|0-9-]//g')


## Referências

https://github.com/localstack/localstack

https://www.terraform.io/docs/providers/aws

https://boto3.amazonaws.com

https://docs.aws.amazon.com/cli



# terraform_first_steps git init git add README.md git commit -m first commit git remote add origin git@github.com:andrejesusdasilva/terraform_first_steps.git git push -u origin master
