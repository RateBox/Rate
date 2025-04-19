# RateBox Overview

RateBox is a comprehensive product and service review platform, built with the goal of providing the best user experience for both reviewers and businesses.

## System Architecture

RateBox is built on a microservices architecture with the following main components:

- **Frontend (Next.js)**: User interface built with Next.js 14, leveraging Server Components and App Router for optimal performance.

- **Backend (Strapi)**: Strapi Headless CMS providing flexible APIs and content management system.

- **Database (PostgreSQL)**: Powerful relational database storing user data and reviews.

## Workflow

1. Users access the frontend to view and create reviews
2. Frontend calls APIs from Strapi backend
3. Strapi processes requests and interacts with PostgreSQL
4. Data is returned to frontend and displayed to users

## Development Environments

- Development: Local environment with Docker Compose
- Staging: Testing environment before deployment
- Production: Live environment

## Technology Stack

- Next.js 14
- Strapi 4
- PostgreSQL 17
- Docker & Docker Compose
- Nginx (reverse proxy)
- Redis (cache)
