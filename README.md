# Node.js CI/CD Pipeline with Jenkins, Docker, and Webhook Integration

This project demonstrates a complete CI/CD pipeline using **Jenkins**, **Docker**, **GitHub Webhook**, and **Node.js**. It builds a simple Node.js app, runs tests, builds a Docker image, pushes it to DockerHub, and can optionally deploy it to a staging environment.

---

## 🧾 Features

- Node.js app with Express
- Jest testing integrated
- Jenkins pipeline with declarative syntax
- Dockerized application
- Pushes image to DockerHub
- Webhook integration with GitHub

---

## 📁 Project Structure

```
.
├── Dockerfile
├── app.js
├── app.test.js
├── deploy.sh
├── package.json
├── package-lock.json
├── server.js
└── Jenkinsfile
```

---

## 🧑‍💻 Steps to Set Up

### 1. Clone the Repository

```bash
git clone https://github.com/<your-username>/nodejs-jenkins-cicd.git
cd nodejs-jenkins-cicd
```

### 2. Install Dependencies

```bash
npm install
```

### 3. Test the App

```bash
npm test
```

### 4. Run Locally

```bash
node server.js
# or
npm start
```

App will run on `http://localhost:3000`

---

## 🐳 Docker

### Build Docker Image

```bash
docker build -t viktalks/nodejs-jenkins-cicd:latest .
```

### Run Docker Container

```bash
docker run -p 3000:3000 viktalks/nodejs-jenkins-cicd:latest
```

---

## ⚙️ Jenkins Setup

### Install Plugins:

- Docker Pipeline
- GitHub Integration
- NodeJS Plugin

### Pipeline Script

Place your `Jenkinsfile` in the root directory of your project and configure your Jenkins project as a **Pipeline** project pointing to your GitHub repo.

---

## 🔔 Webhook Setup (GitHub to Jenkins)

1. Go to your GitHub repository.
2. Click on **Settings** > **Webhooks** > **Add Webhook**.
3. Payload URL: `http://<jenkins-server>:8080/github-webhook/`
4. Content Type: `application/json`
5. Events: Just the push event
6. Save.

Make sure:

- Your Jenkins has GitHub plugin installed.
- Project is set to **"Build when a change is pushed to GitHub"** in build triggers.

---

## 📝 Author

Made with ❤️ by Vikas Tyagi (@viktalks)