# ====Váriaveis S3
nomebucket = "buckets3jesus"

# ====Váriaveis Intancia
instance_type = "t2.micro"
profile = "freetier"
region = "us-east-1"

# ====== Acessos

#testando a reescrita do arquivo tfvars
iam-jenkins-users = [
  "jenkins.mp-dev",
]

#valor 1 para gerar a chave local ou 0 para não gerar
create_privatekey_local = 0