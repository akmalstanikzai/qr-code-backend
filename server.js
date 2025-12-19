require('dotenv').config();

const express = require('express');
const mongoose = require('mongoose');
const userRoutes = require('./routes/user');

// Express app
const app = express();

// Middleware
app.use(express.json());

app.use((req, res, next) => {
  console.log(req.path, req.method);
  next();
});

// Routes
app.use('/api/users', userRoutes);

// Port fallback (CRITICAL for Docker/Jenkins)
const PORT = process.env.PORT || 5000;

// Connect to MongoDB
mongoose.connect(process.env.MONGO_URI)
  .then(() => {
    console.log('Connected to the database');

    app.listen(PORT, () => {
      console.log('Listening for requests on port', PORT);
    });
  })
  .catch((err) => {
    console.error('Error connecting to the database:', err);
  });
