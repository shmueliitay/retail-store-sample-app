const express = require('express');
const app = express();
const port = 3000;

app.get('/', (req, res) => res.send('🛒 Store Cart Service Running'));
app.listen(port, () => console.log(`Cart service listening on port ${port}`));
