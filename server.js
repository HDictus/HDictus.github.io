const express = require('express');

const app = express();
const port = 3000;
const fs = require("fs").promises

app.use(express.static('..'));
app.use(express.json())


app.post("/writecomment", async (req, res) => {
  const newComment = req.body;
  const allComments = JSON.parse(await fs.readFile("comments.json"));
  allComments.push(newComment);
  await fs.writeFile("comments.json", JSON.stringify(allComments, null, 4), "utf8", (error) =>{console.error(error)});
  res.json({"message": 'comment written'});
});

app.listen(port, () => {
  console.log(`Server listening at http://localhost:${port}`);
});
