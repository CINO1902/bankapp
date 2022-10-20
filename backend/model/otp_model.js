const mongoose = require("mongoose");

const Schema = mongoose.Schema;

const otpverificationschema = Schema({
    email:{
        type: String,
    },
    otp:{
       type:String,
    },
    createdAt:{
        type:Date,
    },
    expiresAt:{
        type:String,
    }
});

const otpverifications = mongoose.model("userotpverifications", otpverificationschema);

module.exports = otpverifications;