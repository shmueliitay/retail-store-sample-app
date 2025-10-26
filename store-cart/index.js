const express = require('express');
const app = express();
const PORT = 3001;

app.get('/', (req, res) => res.send('Store Cart Service'));

app.listen(PORT, () => console.log(`store-cart listening on ${PORT}`));
