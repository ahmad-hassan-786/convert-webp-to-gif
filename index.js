const express = require("express");
const BodyParser = require("body-parser");
const {PythonShell} = require("python-shell");
const fs = require("fs");

const app = express();
let PORT = process.env.PORT || 3000;
app.use(BodyParser.json({limit: "25mb"}));



app.get("/get",(req,res)=>{
    res.send("Hello Boy!");
})


function base64_decode(base64str, file) {
    var bitmap = Buffer.from(base64str.toString(), 'base64');
    fs.writeFile(file, bitmap);
  //https://github.com/ahmad-hassan-786/convert-webp-2-gif.git
    var today = new Date();
    var time = today.getHours() + ":" + today.getMinutes() + ":" + today.getSeconds();
    console.log(time,'  ******** File created from base64 encoded string ********');
   }
  
  app.post("/Conversion",(request,response) => {
    var Data = request.body;
      //console.log("Request Body",Data);
      if (Data) {
        base64_decode(Data.imageData,"animated.webp");
        let options = {
          args : "animated.webp"
          }
          PythonShell.run("main.py",options,(err,result) => {
              if(err){
                  console.log(err);
                  response.send(err);
  
              }else{
                  response.sendFile("animated.gif", {root: __dirname});
              }
          });
      } else {
      response.send({ Error: "No Data" });
    }
  }); 
  
  app.listen(PORT, ()=> console.log("Api Server is Running!"));
  
  
  
