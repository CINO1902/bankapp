const { sign, verify } = require("jsonwebtoken");

const createTokens = (user) => {
  const accessToken = sign(
    { ID: user.ID },
    "caleb1902"
  );

  return accessToken;
};

const validateToken = (req, res, next) => {
  let accessToken = req.headers["authorization"];
  accessToken = accessToken.slice(7,accessToken.length);

  if(accessToken){
    verify(accessToken,'caleb1902',(err,decoded)=>{
        if(err){
            return res.json({success:'false', msg:'Invalid Token'})
        }else{
            req.decoded=decoded;
            next();
        }
    })
  }else{
    return res.json({success:'false', msg:'Token not provided'})
  }
};

module.exports = { createTokens, validateToken };