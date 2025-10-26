const express = require('express');
const app = express();
const PORT = 3002;

app.get('/', (req, res) => res.send('Store Catalog Service'));

app.listen(PORT, () => console.log(`store-catalog listening on ${PORT}`));
