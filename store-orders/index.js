const express = require('express');
const app = express();
const PORT = 3005;

app.get('/', (req, res) => res.send('Store Orders Service'));

app.listen(PORT, () => console.log(`store-orders listening on ${PORT}`));
