const express = require('express');
const app = express();
const PORT = 3003;

app.get('/', (req, res) => res.send('Store UI Service'));

app.listen(PORT, () => console.log(`store-ui listening on ${PORT}`));
