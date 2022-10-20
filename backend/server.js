const express = require("express");
const port = process.env.PORT || 3000;
const mongoose = require("mongoose");
const router = require("./route/login_route");
const app = express();


mongoose.connect("mongodb+srv://new_db:newdb1902@cluster0.9ll3qel.mongodb.net/BANK"
).then(() => console.log("Db Connected")).catch(()=> console.log("Database error"));

app.use(express.json());
app.use("/route",router);
app.route("/").get((req,res)=>{
res.json("hello world");
});



app.listen(port, "0.0.0.0",()=>{
    console.log("running in at "+port)
})