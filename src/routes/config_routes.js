// src/routes/config_routes.js


import express from 'express';
import config from '../config/config.js'; // Import the default export

/**
 * @file config_routes.js
 * @name config_routes
 * @description This module exports an Express Router instance
 * that provides routes for the application logo and description.
 * @param {object} req - The request object
 * @param {object} res - The response object
 * @returns {object} Express Router
 * 
 */

const router = express.Router();

router.get('/application-logo', (req, res) => {
  res.json({ applicationLogo: config.applicationLogo });
});

router.get('/app-description', (req, res) => {
  res.json({ appDescription: config.appDescription });
});

router.get('/app-slogan', (req, res) => {
  res.json({ appSlogan: config.appSlogan });
});

router.get('/app-title', (req, res) => {
  res.json({ appTitle: config.appTitle });
});


export default router;