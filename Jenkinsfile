node('master') {
    stage('Prepare') {
        echo "1.Prepare Stage"
        checkout scm
        git url: 'https://github.com/samples28/python-docker.git'
        script {
            build_tag = sh(returnStdout: true, script: 'git rev-parse --short HEAD').trim()
            if (env.BRANCH_NAME != 'master') {
                build_tag = "${env.BRANCH_NAME}-${build_tag}"
            }
        }
    }
    stage('Test') {
      echo "2.Test Stage"
    }
    stage('Build') {
        echo "3.Build Docker Image Stage"
        sh "echo ${build_tag}"
        sh "sudo docker build -t registry-vpc.cn-beijing.aliyuncs.com/qq/python-docker:${build_tag} ."
    }
    stage('Push') {
        echo "4.Push Docker Image Stage"
        
           // sh "sudo docker login -u samples28 -p 055af8e8-d98f-4928-a724-a3b07b1fc3e0"
            sh  "sudo docker login --username=webmaster@qq.com registry-vpc.cn-beijing.aliyuncs.com -p 01DMGCYY66NW0CVQET1F"
            sh "sudo docker push registry-vpc.cn-beijing.aliyuncs.com/qq/python-docker:${build_tag}"
       
       
    }
    stage('Deploy') {
        echo "5. Deploy Stage"
        if (env.BRANCH_NAME == 'master') {
            input "确认要部署线上环境吗？"
        }
        sh "sed -i 's/<BUILD_TAG>/${build_tag}/' k8s.yaml"
        sh "sed -i 's/<BRANCH_NAME>/${env.BRANCH_NAME}/' k8s.yaml"
        sh "sudo /usr/local/bin/kubectl apply -f k8s.yaml --record"
    }
}
