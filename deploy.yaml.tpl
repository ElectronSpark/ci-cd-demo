---
apiVersion: deploy.cloud.google.com/v1
kind: DeliveryPipeline
metadata:
  name: $DELIVERY_PIPELINE_NAME
description: Pipeline for deploying K8s microservice demo
serialPipeline:
  stages:
  - targetId: staging
    profiles:
    - staging
  - targetId: production
    profiles:
    - production
---
apiVersion: deploy.cloud.google.com/v1
kind: Target
metadata:
  name: staging
description: Staging environment
gke:
  cluster: projects/$PROJECT_ID/locations/$CLUSTER_REGION/clusters/$STAGING_CLUSTER_NAME
---
apiVersion: deploy.cloud.google.com/v1
kind: Target
metadata:
  name: production
description: Production environment
gke:
  cluster: projects/$PROJECT_ID/locations/$CLUSTER_REGION/clusters/$PRODUCTION_CLUSTER_NAME
