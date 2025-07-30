# Node.js CI/CD with Jenkins and Docker 🚀

This is a simple Node.js Express application deployed using a Jenkins CI/CD pipeline and Docker.

## 📁 Project Structure

```
.
├── app.js         # Express app
├── server.js      # Entry point to start the server
├── Dockerfile     # Docker configuration
├── package.json   # NPM dependencies
├── app.test.js    # Jest test file
├── deploy.sh      # Deployment script
```

---

## 📦 Requirements

- Node.js
- Docker
- Jenkins (with Docker and pipeline plugins)
- DockerHub account

---

## 🐳 Docker Commands

### Build Docker Image

```bash
docker build -t viktalks/nodejs-jenkins-cicd:latest .
```

### Run Locally

```bash
docker run -d -p 8080:3000 --name nodejs-container viktalks/nodejs-jenkins-cicd:latest
```

Then visit: `http://localhost:8080`

---

## 🧪 Run Tests

```bash
npm test
```

---

## 🤖 Jenkins Pipeline (Simplified)

```groovy
pipeline {
  agent any
  stages {
    stage('Build Docker Image') {
      steps {
        sh 'docker build -t viktalks/nodejs-jenkins-cicd:latest .'
      }
    }
    stage('Push to DockerHub') {
      steps {
        withCredentials([usernamePassword(credentialsId: 'dockerhub-creds', passwordVariable: 'PASS', usernameVariable: 'USER')]) {
          sh 'echo $PASS | docker login -u $USER --password-stdin'
          sh 'docker push viktalks/nodejs-jenkins-cicd:latest'
        }
      }
    }
    stage('Deploy to Staging') {
      steps {
        sh './deploy.sh'
      }
    }
  }
  post {
    success {
      echo '✅ Pipeline completed successfully!'
    }
    failure {
      echo '❌ Pipeline failed!'
    }
  }
}
```

---

## 📜 License

MIT

---

Want a walkthrough video? Check out [@VikTalks](https://instagram.com/viktalks) on Instagram!
