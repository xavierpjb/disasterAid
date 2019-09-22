// Firebase App (the core Firebase SDK) is always required and
// must be listed before other Firebase SDKs
var firebase = require("firebase");
const path = require('path');

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

});
  //var userId = firebase.auth().currentUser.uid;
  //res.sendFile(path.join(__dirname+'/index.html'))
  //return firebase.database().ref('/Items/NewYorkCity/Water/').once('Qty').then(function(snapshot) {
  //  var username = snapshot.val()//(snapshot.val() && snapshot.val().username) || 'Anonymous';
  //  console.log(username);
  // ...
  //});

})

app.listen(port, () => console.log(`Example app listening on port ${port}!`))
