const express = require('express');
const path = require('path');
const app = express();
const PORT = process.env.PORT || 3000;

// serve static files from the public dir
app.use(express.static(path.join(__dirname, 'public')));


app.get('/info', (req, res) => {
    res.json({
        version: process.env.IMAGE_VERSION || 'Dev',
        commit: process.env.GIT_COMMIT_SHA || 'Unknown',
        nodeEnv: process.env.NODE_ENV || 'Development',
        timespamp: new Date().toISOString()

    })
})

app.listen(PORT, () => {
    console.log('Server running on port ${PORT}')
});
  