const Event = require('../models/event');

// Funció per obtenir tots els events
exports.getAllEvents = async (req, res) => {
  try {
      const events = await Event.find({});
      res.json(events);
  } catch (err) {
      res.status(500).send(err.message);
  }
};
