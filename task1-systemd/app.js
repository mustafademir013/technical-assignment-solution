import express from 'express';
import winston from 'winston';
import fs from 'fs';
import path from 'path';

// Create log directory
const logDir = path.join(process.cwd(), 'logs');
if (!fs.existsSync(logDir)) {
    fs.mkdirSync(logDir, { recursive: true });
}

// Configure logger
const logger = winston.createLogger({
    format: winston.format.combine(
        winston.format.timestamp(),
        winston.format.json()
    ),
    transports: [
        new winston.transports.File({ 
            filename: path.join(logDir, 'app.log'),
            level: 'info'
        })
    ]
});

const app = express();
const port = 5000;

// Health check endpoint
app.get('/health', (req, res) => {
    logger.info('Health check performed');
    res.json({ status: 'healthy' });
});

// Main endpoint
app.get('/', (req, res) => {
    logger.info('Homepage visited');
    res.send('Hello, World!');
});

// Error handling middleware
app.use((err, req, res, next) => {
    logger.error('Error occurred:', err);
    res.status(500).json({ error: 'Internal Server Error' });
});

// Graceful shutdown handling
process.on('SIGTERM', () => {
    logger.info('Received SIGTERM. Performing graceful shutdown...');
    server.close(() => {
        logger.info('Server closed. Exiting process.');
        process.exit(0);
    });
});

// Start server
app.listen(port, '0.0.0.0', () => {
    logger.info(`Server started on port ${port}`);
}); 