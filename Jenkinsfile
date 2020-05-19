pipeline {
   agent {
        docker {
            image 'python3'
            args '--network=skynet'
        }
   }

   stages {
      stage('Build') {
         steps {
            echo 'Baixando as dependências do projeto'
            sh 'pip install -r requirements.txt'

         }
      }
      stage('Test') {
         steps {
            echo 'Executando testes de regressão'
            sh 'robot -d ./logs tests/'
            robot 'logs'
         }
      }
      stage('UAT') {
         steps {
            echo 'Aprovação dos testes de aceitação'
         }
      }
      stage('Production') {
          steps {
              echo 'API Ok em produção'
          }
      }
   }
}



