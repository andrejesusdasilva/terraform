def listParams = []

pipeline {
      
      parameters {
        string(defaultValue: '', description: 'Bucket S3', name: 'nomebucket')
        string(defaultValue: '', description: 'Tipo da Instancia', name: 'instance_type')
        string(defaultValue: '', description: 'Profile', name: 'profile')
        string(defaultValue: '', description: 'Regiao', name: 'region')
    }
      
      //usar any da ero ao usar o docker, pq esse agente acaba sendo usado no processo
      agent {
        node {
            label 'docker-dind'
        }
     }
   
    stages{
        
        //se for necessário adicionar alguma validação em alguma variável
        stage("Validando parametros obrigatórios"){
           
            steps {
                script {
                    if (!params.nomebucket) {
                        error('Parametro Oracle Id image não informado')
                    }
                    else{
                        listParams.add(params.nomebucket)
                    }
                    if (!params.instance_type) {
                        error('Parametro Tomcat Id image não informado')
                    }
                    else{
                        listParams.add(params.instance_type)
                    }
                    if (!params.profile) {
                        error('Parametro solicitante não informado')
                    }
                    else{
                        listParams.add(params.profile)
                    }
                    if (!params.region) {
                        error('Parametro solicitante não informado')
                    }
                    else{
                        listParams.add(params.region)
                    }
                
                }
                
                
            }
        }
        
        //clone do repositório que possui os arquivos do terraform
        stage("Clone repositorio"){
           
           steps{
            script{
                git branch: 'feature/terraform_aws', credentialsId: 'devops_usr', url: 'ssh://git@stash.matera.com:7999/~andrej/lab_localstack_terraform.git'

                 sh 'pwd'
                 //def file = readFile "envs/freetier.tfvars"
                 def tfvarproperties = readProperties file: "envs/freetier.tfvars"
                 //as variaveis seguem o padrão do terraform, onde é necessário usar as aspas, então foi 
                 //necessário remover para fazer a comparação com as variaveis de ambiente
                 println("Valores antigos: " + tfvarproperties)
                 
                 def newparams = params.toString()
                 def tfvarpropertiesmodified = readProperties file: "envs/freetier.tfvars", text: newparams.replace("{","").replace("}","")
                 println("Valores novos: " + tfvarpropertiesmodified)
                 
                 //println(tfvarproperties['nomebucket'].replace("\"",""))
                 println(tfvarproperties)
                 println(listParams)
                 println(params)
                 
                 println("Reescrevendo o arquivo tfvars")
                 
                
            }
            
           archiveArtifacts artifacts: 'envs/*.tfvars'       
           }
       
        }
        stage("TF Plan"){
           steps{
               script{
                    //já baixa a imagem mas não é o jeito certo de usar eu acho, mas funcionou
                    docker.image('hashicorp/terraform:0.11.14')
                    .inside(""){}
               }

                //sh 'docker run -it -e AWS_ACCESS_KEY_ID=AKIAX5CVAFJHA54HFYVA -e AWS_SECRET_ACCESS_KEY=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 -v $(pwd):/workpace -w /workpace docker_terraform plan'
                //a imagem do terraform na documentação não esta clara, mas pode passar as credenciais
                sh 'docker run -i -v $(pwd):/workpace -w /workpace hashicorp/terraform:0.11.14 init'
                sh 'docker run -i -v $(pwd):/workpace -w /workpace hashicorp/terraform:0.11.14 plan -out=myfreetierplan -var-file=envs/freetier.tfvars'
                //arquivar o arquivo tfplan e deixar dispoível no Job
               
           }
       
        }
       stage('TF Apply') {
          steps {
                script {
                    def userInput = input(id: 'confirm', message: 'Apply Terraform?', parameters: [ [$class: 'BooleanParameterDefinition', defaultValue: false, description: 'Apply terraform', name: 'confirm'] ])
                    println userInput
                    
                    if(userInput){
                        //sh 'docker run -i -v $(pwd):/workpace -w /workpace hashicorp/terraform:0.11.14 apply'
                        println "Rodando comando apply"    
                    }
                    
        }
      }
    }
    
    }
}