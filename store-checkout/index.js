const express = require('express');
const app = express();
const PORT = 3004;

app.get('/', (req, res) => res.send('Store Checkout Service'));

app.listen(PORT, () => console.log(`store-checkout listening on ${PORT}`));
