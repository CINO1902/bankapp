const mongoose = require("mongoose");

const Schema = mongoose.Schema;

const Users = Schema({
    ID:{
        type: String,
    },
    PIN:{
        type: String,
    },
   
    balance:{
        type:String,
        default:'0.00',
    }
});

module.exports = mongoose.model("User", Users);