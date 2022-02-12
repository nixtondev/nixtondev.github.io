var getAge = "13/02/1997".split("/");
var birthDate = new Date(getAge[2], getAge[1] - 1, getAge[0]);
var today = new Date();
var diff = today - birthDate; // Difference in milliseconds
var myAge = Math.floor(diff/31557600000); // Divide by 1000*60*60*24*365.25
document.getElementsByClassName("age")[0].innerHTML = myAge;
