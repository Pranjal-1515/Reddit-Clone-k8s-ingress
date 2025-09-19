# Reddit Clone – Kubernetes Ingress Deployment

<p align="center">
  <img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/nodejs/nodejs-original-wordmark.svg" height="60" alt="Node.js logo"/>
  &nbsp;&nbsp;
  <img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/docker/docker-original-wordmark.svg" height="60" alt="Docker logo"/>
  &nbsp;&nbsp;
  <img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/kubernetes/kubernetes-plain-wordmark.svg" height="60" alt="Kubernetes logo"/>
</p>

<p align="center">
  <img src="https://img.shields.io/badge/Node.js-Backend-green?logo=node.js&logoColor=white" alt="Node.js badge"/>
  <img src="https://img.shields.io/badge/Docker-Containerized-blue?logo=docker&logoColor=white" alt="Docker badge"/>
  <img src="https://img.shields.io/badge/Kubernetes-Orchestrated-blueviolet?logo=kubernetes&logoColor=white" alt="Kubernetes badge"/>
  <img src="https://img.shields.io/badge/NGINX-Ingress-green?logo=nginx&logoColor=white" alt="NGINX badge"/>
</p>

---

## 📝 Application Overview

This project emulates the core functionality of Reddit, modularized into distinct services (such as frontend, backend, etc.), each containerized for scalability and ease of deployment. Kubernetes manages the lifecycle and scaling of these services, while NGINX Ingress enables efficient routing and domain-based access.

---

## 📁 Project Structure

- **Dockerfile** – Container definition for your main service.
- **deployment.yml** – Kubernetes Deployment manifest.
- **service.yml** – Kubernetes Service manifest.
- **ingress.yml** – Kubernetes Ingress manifest.
- **src/** – Source code for application components.
- **functions/**, **public/**, etc. – Supporting code and resources.

---

## 🚀 Setup & Deployment

### <img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/docker/docker-original.svg" height="30" alt="Docker logo"/> 1. Build, Tag, and Push Docker Image(s)

For the main application service (repeat for other services as necessary):

```bash
# Build the Docker image (local name)
docker build -t <service-name>:<tag> .

# Tag the image for Docker Hub
docker tag <service-name>:<tag> <your-dockerhub-username>/<service-name>:<tag>

# Push the tagged image to Docker Hub
docker push <your-dockerhub-username>/<service-name>:<tag>
```
> Make sure to update the image reference in your `deployment.yml` if you change the tag or repository.

---

### <img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/kubernetes/kubernetes-plain.svg" height="30" alt="Kubernetes logo"/> 2. Apply Kubernetes Manifests

Deploy all Kubernetes resources from the root directory:

```bash
kubectl apply -f deployment.yml
kubectl apply -f service.yml
kubectl apply -f ingress.yml
```

---

### <img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/nginx/nginx-original.svg" height="30" alt="NGINX logo"/> 3. Install Ingress Controller (if not already installed)

Deploy NGINX Ingress Controller:

```bash
kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/controller-v1.2.1/deploy/static/provider/cloud/deploy.yaml
```

Verify the controller is running:

```bash
kubectl get pods -n ingress-nginx
```

---

### 🖥️ 4. Update your hosts file

Add the following line to your system’s hosts file:  
- On Linux/macOS: `/etc/hosts`
- On Windows: `C:\Windows\System32\drivers\etc\hosts`
```
127.0.0.1   reddit.local
```
*(Replace `reddit.local` if your Ingress host differs.)*

---

### 🔀 5. Port Forwarding for Local Ingress Access

If using Minikube or Docker Desktop, forward local traffic to the Ingress controller:

```bash
kubectl port-forward --namespace ingress-nginx service/ingress-nginx-controller 8080:80
```

Access your app at: [http://reddit.local:8080](http://reddit.local:8080)

---

## 🛠️ Useful Kubernetes Commands

```bash
kubectl get pods
kubectl get svc
kubectl get ingress
kubectl logs <pod-name>
```

---

## ✅ Summary

You now have a modular, containerized Reddit Clone running on Kubernetes, complete with Ingress-based HTTP routing and local domain access.

---
