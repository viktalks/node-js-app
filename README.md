# Node.js Jenkins CI/CD Project 🚀

This project demonstrates a full CI/CD pipeline using Jenkins for a simple Node.js Express application.

---

## 🧾 Tech Stack

- Node.js (Express)
- Docker
- Jenkins
- GitHub Webhooks
- Jest (for unit testing)

---

## 🛠 Folder Structure

```
nodejs-jenkins-cicd/
├── app.js              # Express app
├── app.test.js         # Jest test file
├── server.js           # Server bootstrap
├── Dockerfile          # Docker instructions
├── deploy.sh           # Deployment script (optional)
├── package.json
├── package-lock.json
└── node_modules/
```

---

## ✅ Steps to Run Locally

```bash
git clone <repo-url>
cd nodejs-jenkins-cicd
npm install
npm test       # Run Jest test
node server.js # Or use nodemon if installed
```

---

## 🔁 Jenkins CI/CD Pipeline Steps

1. **Install Jenkins** with required plugins: Git, Docker, NodeJS, Pipeline.
2. **Create a Pipeline Job** in Jenkins.
3. **Connect to GitHub** using SSH or credentials.
4. **Add Webhook** in your GitHub repo:
    - Go to **Settings → Webhooks → Add webhook**
    - Payload URL: `http://<jenkins-server>:8080/github-webhook/`
    - Content type: `application/json`
    - Trigger: **Just the push event**
5. **Add Jenkinsfile** in root of repo with following stages:
    - Checkout
    - Install Node.js
    - Install Dependencies (`npm install`)
    - Run Tests (`npm test`)
    - Build Docker Image
    - Push Docker Image to DockerHub
    - Deploy (shell or Kubernetes)

---

## 📋 Important Notes

- If you're modifying the response in `app.js`, **make sure to update the test case in `app.test.js` accordingly**. Otherwise, `npm test` will fail and your Jenkins pipeline will stop.
    - Example:
      ```js
      // If app.js returns this:
      res.send("Hello World from Jenkins CI/CD!");

      // Then test should be:
      expect(res.text).toBe("Hello World from Jenkins CI/CD!");
      ```

- In Jenkinsfile, you can inject environment variables (like DockerHub credentials) using Jenkins credentials store.

---

## 🐳 Docker Commands (Manual)

```bash
docker build -t your-username/nodejs-jenkins-cicd .
docker run -p 3000:3000 your-username/nodejs-jenkins-cicd
```

---

## 👨‍💻 Author

Made with ❤️ by Vikas Tyagi (viktalks)

---