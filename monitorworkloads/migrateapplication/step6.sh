#!/bin/bash
cat > /root/completedfiles/advertisements.yaml <<EOL
apiVersion: apps/v1
kind: Deployment
metadata:
  labels:
    service: advertisements
    app: ecommerce
  name: advertisements 
spec:
  replicas: 1
  selector:
    matchLabels:
      service: advertisements
      app: ecommerce
  strategy: {}
  template:
    metadata:
      creationTimestamp: null
      labels:
        service: advertisements
        app: ecommerce
    spec:
      containers:
      - image: ddtraining/advertisements-fixed:latest
        name: advertisements 
        command: ["flask"]
        args: ["run", "--port=5002", "--host=0.0.0.0"]
        env:
          - name: FLASK_APP
            value: "ads.py"
          - name: FLASK_DEBUG
            value: "1"
          - name: POSTGRES_PASSWORD
            valueFrom:
              secretKeyRef:
                key: pw
                name: db-password
          - name: POSTGRES_USER
            value: "user"
          - name: POSTGRES_HOST
            value: "db"
        ports:
        - containerPort: 5002
        resources: {}
---
apiVersion: v1
kind: Service
metadata:
  labels:
    service: advertisements
    app: ecommerce
  name: advertisements
spec:
  ports:
  - port: 5002
    protocol: TCP
    targetPort: 5002
  selector:
    service: advertisements
    app: ecommerce
status:
EOL
clear
creds
