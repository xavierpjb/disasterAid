// Firebase App (the core Firebase SDK) is always required and
// must be listed before other Firebase SDKs
const firebase = require("firebase");
const path = require('path');
const request = require('request');


// Add the Firebase products that you want to use
//require("firebase/auth");
//require("firebase/firestore");

var firebaseConfig = {
  apiKey: "AIzaSyAmS-KJgRiMw8V6W7d3JbEEbP8YF9_NzDQ",
  authDomain: "disaster-aid-db.firebaseapp.com",
  databaseURL: "https://disaster-aid-db.firebaseio.com",
  projectId: "disaster-aid-db",
  storageBucket: "",
  messagingSenderId: "18681786079",
  appId: "1:18681786079:web:694b7b2f2e6b1139ad836a"
};
// Initialize Firebase
firebase.initializeApp(firebaseConfig);

const express = require('express')
const app = express()
const port = 3000
firebase.auth().signInWithEmailAndPassword("xa.patjb4@gmail.com", "password").catch(function(error) {
// Handle Errors here.
var errorCode = error.code;
var errorMessage = error.message;
console.log(error.message)
res.status(400);
res.send('probem');
});

app.use(express.json())
app.use (express.urlencoded({extended: false}))
app.use(function(req, res, next) {
   res.header("Access-Control-Allow-Origin", "*");
   res.header("Access-Control-Allow-Headers", "Origin, X-Requested-With,Content-Type, Accept");
   next();
});

app.get('/', (req, res) =>
res.send(
  'Ready for command!')
)


app.get('/yo', function(req,res){
  var ref = firebase.database().ref("Items/")
  ref.once("value", function(snapshot) {
    var data = snapshot.val();   //Data is in JSON format.
    console.log(data);
    console.log("reached end")
    res.status(200);
    res.redirect("/");
  })
});

const donationItems = {
  "NewYorkCity": {
    "Water": {
      "Qty": 3
    },
    "Clothes": {
      "Qty": 5,
      "Des": "Yoyo"
    }
  }
};

var options = {
  uri: 'http://0.0.0.0:3000/donateItems',
  method: 'POST',
  headers: {
     "content-type": "application/json",
  },
  body: JSON.stringify(donationItems)
};

app.get('/sendDonationTest', function(req,res){
  request(options, function (error, response, request) {

    if (!error && response.statusCode == 200) {
      //console.log(body.json) // Print the shortened url.
      //console.log(options.body + "got here")

    }

  });
});

app.post('/donateItems', function(req,res){

  //console.log(req);
  res.status(200);
  console.log(Object.keys(req.body))
  //get elements and check for presence
  console.log(Object.keys(req.body.NewYorkCity).length)
  //If available increment count

  //if new item make new spot


  res.end()
  //res.redirect("/");
})


app.listen(port, () => console.log(`Example app listening on port ${port}!`))
