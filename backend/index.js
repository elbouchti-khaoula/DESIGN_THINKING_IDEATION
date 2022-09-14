const express = require("express");
const mongoose = require("mongoose");
const port = process.env.PORT || 5000;
const app = express();

mongoose.connect(
  "mongodb+srv://dbUser:salma@cluster0.5ibcc.mongodb.net/?retryWrites=true&w=majority",
  {
    useNewUrlParser: true,
    useCreateIndex: true,
    useUnifiedTopology: true,
  }
) ;
// after that on peur dans package ajouter start ... et runner 
//npm start
//npm run dev  c'est le mem mais pour visualiser les changement immdiatmt
const connection = mongoose.connection;
connection.once("open", () => {
  console.log("MongoDb connected");
});

//middleware
app.use("/uploads", express.static("uploads"));
app.use(express.json());

const userRoute = require("./routes/user");
app.use("/user", userRoute);


const categorieRoute = require("./routes/categorie");
app.use("/categorie", categorieRoute);

const ideeRoute = require("./routes/idee");
app.use("/idee", ideeRoute);

const sessionRoute = require("./routes/session");
app.use("/session", sessionRoute);

data = {
  info: "This is a root endpoint",
};

app.route("/").get((req, res) => res.json(data));

app.listen(port, "0.0.0.0", () =>
  console.log(`welcome your listinnig at port ${port}`)
);
