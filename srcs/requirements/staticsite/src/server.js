const express = require("express");
const path = require("path");
const app = express();
const port = 3000;

// Serve static files from public directory
app.use(express.static(path.join(__dirname, "public")));

// Start server
app.listen(port, () => {
  console.log(`Pokemon generator app listening at http://localhost:${port}`);
});
