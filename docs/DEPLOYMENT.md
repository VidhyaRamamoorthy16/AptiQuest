# Deployment Guide

## Prerequisites

Before deploying, ensure you have:
- Node.js (v16 or higher)
- MySQL (v8 or higher) or PostgreSQL
- npm or yarn package manager
- Git (for version control)

## Local Development Setup

### 1. Clone the Repository

```bash
git clone <repository-url>
cd aptitudeweb
```

### 2. Database Setup

#### MySQL Setup:

```bash
# Login to MySQL
mysql -u root -p

# Create database
mysql -u root -p < database/schema.sql

# Load sample data
mysql -u root -p aptitudeweb < database/sample_data.sql
```

#### PostgreSQL Setup (Alternative):

```bash
# Create database
createdb aptitudeweb

# Run schema (convert SQL syntax if needed)
psql -U postgres -d aptitudeweb -f database/schema.sql

# Load sample data
psql -U postgres -d aptitudeweb -f database/sample_data.sql
```

### 3. Backend Setup

```bash
cd backend

# Install dependencies
npm install

# Create .env file (copy from .env.example)
cp .env.example .env

# Edit .env with your database credentials
# DB_HOST=localhost
# DB_USER=root
# DB_PASSWORD=your_password
# DB_NAME=aptitudeweb
# JWT_SECRET=your_secret_key_here
# PORT=5500

# Start development server
npm run dev
```

The backend will run on `http://localhost:5500`

### 4. Frontend Setup

```bash
cd frontend

# Install dependencies
npm install

# Start development server
npm run dev
```

The frontend will run on `http://localhost:3000`

## Production Deployment

### Option 1: Traditional VPS Deployment

#### Server Requirements:
- Ubuntu 20.04+ or similar Linux distribution
- Node.js 16+
- MySQL 8+
- Nginx (for reverse proxy)
- PM2 (for process management)

#### Steps:

1. **Server Setup:**
```bash
# Update system
sudo apt update && sudo apt upgrade -y

# Install Node.js
curl -fsSL https://deb.nodesource.com/setup_18.x | sudo -E bash -
sudo apt install -y nodejs

# Install MySQL
sudo apt install mysql-server -y
sudo mysql_secure_installation

# Install Nginx
sudo apt install nginx -y

# Install PM2 globally
sudo npm install -g pm2
```

2. **Database Setup:**
```bash
# Create database and user
mysql -u root -p
CREATE DATABASE aptitudeweb;
CREATE USER 'aptitudeweb_user'@'localhost' IDENTIFIED BY 'strong_password';
GRANT ALL PRIVILEGES ON aptitudeweb.* TO 'aptitudeweb_user'@'localhost';
FLUSH PRIVILEGES;
EXIT;

# Import schema and data
mysql -u aptitudeweb_user -p aptitudeweb < database/schema.sql
mysql -u aptitudeweb_user -p aptitudeweb < database/sample_data.sql
```

3. **Backend Deployment:**
```bash
cd /var/www/aptitudeweb/backend

# Install dependencies
npm install --production

# Create .env file with production values
nano .env

# Start with PM2
pm2 start server.js --name aptitudeweb-backend
pm2 save
pm2 startup
```

4. **Frontend Build:**
```bash
cd /var/www/aptitudeweb/frontend

# Install dependencies
npm install

# Build for production
npm run build

# The dist/ folder contains production files
```

5. **Nginx Configuration:**
```nginx
# /etc/nginx/sites-available/aptitudeweb
server {
    listen 80;
    server_name your-domain.com;

    # Frontend
    location / {
        root /var/www/aptitudeweb/frontend/dist;
        try_files $uri $uri/ /index.html;
    }

    # Backend API
    location /api {
        proxy_pass http://localhost:5500;
        proxy_http_version 1.1;
        proxy_set_header Upgrade $http_upgrade;
        proxy_set_header Connection 'upgrade';
        proxy_set_header Host $host;
        proxy_cache_bypass $http_upgrade;
    }
}
```

```bash
# Enable site
sudo ln -s /etc/nginx/sites-available/aptitudeweb /etc/nginx/sites-enabled/
sudo nginx -t
sudo systemctl reload nginx
```

6. **SSL with Let's Encrypt:**
```bash
sudo apt install certbot python3-certbot-nginx -y
sudo certbot --nginx -d your-domain.com
```

### Option 2: Docker Deployment

#### Create Dockerfile for Backend:

```dockerfile
# backend/Dockerfile
FROM node:18-alpine
WORKDIR /app
COPY package*.json ./
RUN npm install --production
COPY . .
EXPOSE 5500
CMD ["node", "server.js"]
```

#### Create Dockerfile for Frontend:

```dockerfile
# frontend/Dockerfile
FROM node:18-alpine as build
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build

FROM nginx:alpine
COPY --from=build /app/dist /usr/share/nginx/html
COPY nginx.conf /etc/nginx/conf.d/default.conf
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
```

#### Create docker-compose.yml:

```yaml
version: '3.8'

services:
  db:
    image: mysql:8.0
    environment:
      MYSQL_ROOT_PASSWORD: rootpassword
      MYSQL_DATABASE: aptitudeweb
    volumes:
      - db_data:/var/lib/mysql
      - ./database/schema.sql:/docker-entrypoint-initdb.d/schema.sql
    ports:
      - "3306:3306"

  backend:
    build: ./backend
    ports:
      - "5500:5500"
    environment:
      DB_HOST: db
      DB_USER: root
      DB_PASSWORD: rootpassword
      DB_NAME: aptitudeweb
      JWT_SECRET: your_secret_key
    depends_on:
      - db

  frontend:
    build: ./frontend
    ports:
      - "80:80"
    depends_on:
      - backend

volumes:
  db_data:
```

#### Deploy with Docker:

```bash
docker-compose up -d
```

### Option 3: Cloud Platform Deployment

#### Heroku:

1. Install Heroku CLI
2. Create `Procfile` in backend:
```
web: node server.js
```
3. Deploy:
```bash
cd backend
heroku create aptitudeweb-backend
heroku addons:create heroku-postgresql:hobby-dev
git push heroku main
```

#### Vercel/Netlify (Frontend):

1. Connect GitHub repository
2. Set build command: `npm run build`
3. Set publish directory: `dist`
4. Add environment variables
5. Deploy

#### Railway/Render:

1. Connect GitHub repository
2. Select backend/frontend folder
3. Set environment variables
4. Deploy automatically

## Environment Variables

### Backend (.env):
```
NODE_ENV=production
PORT=5500
DB_HOST=localhost
DB_USER=your_db_user
DB_PASSWORD=your_db_password
DB_NAME=aptitudeweb
JWT_SECRET=your_very_secure_secret_key_min_32_chars
JWT_EXPIRE=7d
CORS_ORIGIN=https://your-domain.com
```

### Frontend (.env):
```
VITE_API_URL=https://api.your-domain.com
```

## Security Checklist

- [ ] Change default database passwords
- [ ] Use strong JWT secret (32+ characters)
- [ ] Enable HTTPS/SSL
- [ ] Set up CORS properly
- [ ] Use environment variables (never commit .env)
- [ ] Enable database backups
- [ ] Set up rate limiting
- [ ] Configure firewall rules
- [ ] Keep dependencies updated
- [ ] Use parameterized queries (already implemented)

## Monitoring & Maintenance

### PM2 Monitoring:
```bash
pm2 monit
pm2 logs aptitudeweb-backend
```

### Database Backups:
```bash
# Daily backup script
mysqldump -u user -p aptitudeweb > backup_$(date +%Y%m%d).sql
```

### Log Rotation:
Configure logrotate for application logs

## Troubleshooting

### Backend won't start:
- Check database connection
- Verify environment variables
- Check port availability
- Review error logs

### Frontend build fails:
- Clear node_modules and reinstall
- Check Node.js version
- Verify all dependencies are installed

### Database connection errors:
- Verify credentials in .env
- Check MySQL service status
- Verify database exists
- Check firewall rules

## Performance Optimization

1. **Enable Gzip compression** in Nginx
2. **Use CDN** for static assets
3. **Enable database query caching**
4. **Implement Redis** for session storage
5. **Use database indexes** (already in schema)
6. **Enable HTTP/2**
7. **Optimize images** and assets
8. **Implement pagination** (already in API)

## Scaling Considerations

- Use load balancer for multiple backend instances
- Set up database read replicas
- Implement Redis for caching
- Use CDN for static content
- Consider microservices architecture for large scale

