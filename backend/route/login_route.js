const express = require("express");
const router = express.Router();
const Users = require("../model/user_model");
const alert = require('../model/alert_model');

const bcrypt = require("bcrypt");

const {validateToken, createTokens} = require("../middleware");
const e = require("express");

router.route("/login").post(async (req,res)=>{
    const { ID, PIN } = req.body;

    const user = await Users.findOne({ ID });
  
    if (!user) {res.status(400).json({success:'false', msg: "User Doesn't Exist" });
}else{
    const dbPassword = user.PIN;
    bcrypt.compare(PIN, dbPassword).then((match) => {
      if (!match) {
        res
          .status(400)
          .json({success:'false',  msg: "Wrong Username and Password Combination!" });
      } else {
        const accessToken = createTokens(user)

        res.json({token:accessToken, msg:"Successfully Logged In", success:'true'});
      }
    });
}
});

router.route("/register").post( async (req,res)=>{
    const {ID, PIN} = req.body;
    let user = await Users.findOne({ID});
    if(user){
        console.log('not okay')
        return res.status(400).json({success:'false', msg:'User Already Exist'})
       
    }
   bcrypt.hash(PIN,10).then((hash)=> {
    Users.create({
        ID: ID,
        PIN: hash,
       
        
    }).then(()=>{
        console.log('okay')
        res.json({success:'true', msg:'Register Successfully'})
    }).catch((err)=>{
        if(err){
            res.status(400).json({sucess:'false', msg:'Something Went wrong'})
        }
    });
   });
})

router.route("/user_details").get( validateToken, (req,res,next)=>{
    console.log(req.decoded);
    Users.findOne({email:req.decoded.email},(err,result)=>{
        if(err){
            return res.status(500).json({success:'false', msg:err})
        }else{
            return res.status(200).json({
                success:'true', 
                email:result.email,
                name:result.username,
                balance:result.balance,
                total_trade:result.Ttrades,
                loss_trade:result.loss_trade,
                profit_trade:result.profit_trade,
            })
        }
})
})

router.route("/watchlist").post( async (req,res)=>{
    const {ID} = req.body;
   await watchlist.create({
        ID:ID,
    })
    res.json('done')
})

router.route("/getwatchlist").get( validateToken, (req,res,next)=>{
    watchlist.findOne({ID:req.decoded.ID},(err,result)=>{
        if(err){
            return res.status(500).json({success:'false', msg:err})
        }else{
            return res.status(200).json({
                success:'true', 
                ID:result.ID,
                pair:result.currency_pait,
                
            })
        }
})
})

router.route("/alert").post( async (req,res)=>{
    var datetime =  Date();
    console.log(datetime.slice(0,21));
    const {Detail, amount, ID, description, credit, To, letter} = req.body;
   await alert.create({ 
    ID: ID,
    Detail: Detail,
    description: description,
    amount: amount,
    createdAt: Date.now(),
    time: datetime.slice(0,21),
    trasction_type: credit,
    To: To,
    letter:letter,
    })
    res.json('done')
})

router.route("/getAlert").get( validateToken, (req,res,next)=>{
    alert.find({ID:req.decoded.ID},(err,result)=>{
        if(err){
            return res.status(500).json({success:'false', msg:err})
        }else{
            return res.status(200).json({
                success:'true', 
                Detail:result,
              
            })
        }
}) 
    

router.route('/getdetails').get(validateToken, (req, res)=>{
    Users.findOne({ID: req.decoded.ID},(err, result)=>{
        if(err){
            return res.status(500).json({success: 'false', msg:err})
        }else{
            return res.status(200).json({
                success:'true',
                balance: result,
            })
        }
    })
})

// router.route('/getdetails').get(validateToken, (req, res)=>{
//     Users.findOne({ID: req.decoded.ID}, (err, result)=>{
//         if(err){
//             return res.status(500).json({success:'false', msg:err})
//         }else{
//             return res.status(200).json({
//                 success:'true',
//             })
//         }
//     })
// })

})






// router.route("/verifyOTP").post( async (req,res)=>{
//     try{
//         const {email, otp} = req.body;
//       const otpverificationsRecords =  await otpverifications.findOne({email})
//       if(!otpverificationsRecords){
//         res.json({
//             success:'false',
//             msg:'Account Does not exist or it has been verified successfully'
//         });
//       }else{
//         const {expiresAt} = otpverificationsRecords[0];
//         const hashotp = otpverificationsRecords[0].otp;

//         if(expiresAt < Date.now()){
//            await  otpverifications.deleteMany(email);
//            res.json({
//             success:'false',
//             msg:'Otp has Expired, Please request a new one'
//         })
//         }else{
//           const validOTP =  bcrypt.compare(otp, hashotp);

//           if(!validOTP){
//             res.json({
//                 success:'false',
//                 msg:'OTP is incorrect',
//             })
//           }else{
//             Users.updateOne({email:email, verified:true});
//             await otpverifications.deleteMany(email);
//             res.json({
//                 success:'true',
//                 msg:'Email Verified Successfully',
//             })
//           }
//         }
//       }
//     }catch(error){
//         res.json({
//             success:'false',
//             msg:error,
//         })
//     }
// })



module.exports = router;


