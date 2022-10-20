const mongoose = require("mongoose");

const Schema = mongoose.Schema;

const watchlistschema = Schema({   
    ID:{
        type: String,
    },
    currency_pait:{
        type:Array,
        default:[
        'EUR,Euro,CAD,Canadian Dollar', 
        'EUR,Euro,CAD,Canadian Dollar', 
        'EUR,Euro,CAD,Canadian Dollar']
    },

    
});

const watchlist = mongoose.model("watchlist", watchlistschema);

module.exports = watchlist;