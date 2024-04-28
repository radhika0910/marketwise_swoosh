// Import required modules
const express = require('express');
const mongoose = require('mongoose');
const bodyParser = require('body-parser');

// Initialize Express app
const app = express();
const PORT = process.env.PORT || 8080;

// Middleware
app.use(bodyParser.json());

// MongoDB connection
mongoose.connect('mongodb+srv://newUser:Radhika123456@cluster0.pmj2hf8.mongodb.net/User', {
  useNewUrlParser: true,
  useUnifiedTopology: true,
})
.then(() => console.log('MongoDB connected'))
.catch((err) => console.log('MongoDB connection error:', err));

// Define user schema and model
const userSchema = new mongoose.Schema({
  Name: String,
  Domain: String,
  Event1: String,
  Event2: String,
  Bag_of_words: String,
  Recommended_Events: String,
  Login_ID: Number,
  Password: String,
  Reviews: String,
});

const User = mongoose.model('User', userSchema, 'data'); // Set collection name as 'data'

// Authentication endpoint - POST
app.post('/login', async (req, res) => {
  const { Login_ID, Password } = req.body;
  try {
    const user = await User.findOne({ Login_ID, Password }).select('-Password'); // Exclude the Password field from the response
    if (!user) {
      return res.status(404).json({ message: 'User not found or invalid credentials' });
    }
    return res.status(200).json({ message: 'Login successful', user });
  } catch (error) {
    console.error('Error:', error);
    return res.status(500).json({ message: 'Server error' });
  }
});

// Update user reviews endpoint - POST
app.post('/write-review/:id', async (req, res) => {
  const userId = req.params.id;
  const { review } = req.body;
  try {
    const user = await User.findById(userId);
    if (!user) {
      return res.status(404).json({ message: 'User not found' });
    }
    user.Reviews = review; // Update the Reviews field for the user
    await user.save(); // Save the updated user document
    return res.status(200).json({ message: 'Review updated successfully', user });
  } catch (error) {
    console.error('Error:', error);
    return res.status(500).json({ message: 'Server error' });
  }
});

// Start the server
app.listen(PORT, () => {
  console.log(`Server running on port ${PORT}`);
});
