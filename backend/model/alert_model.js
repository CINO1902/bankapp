const mongoose = require("mongoose");

const Schema = mongoose.Schema;

const alertschema = Schema({   
    ID:{
        type:String,
    },
     Detail:{
        type:String,
    },
    amount:{
        type: String,
    },
    description:{
        type: String,
    },
    createdAt:{
        type: Date,
    },
    time:{
        type:String,
    },
    trasction_type:{
        type:Boolean,
    },
    To:{
        type:String,
    },
    letter:{
        type:String,
    },
});

const alert = mongoose.model("alert", alertschema);

module.exports = alert;