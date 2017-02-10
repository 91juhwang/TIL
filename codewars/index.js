/* 
	 Wednessday. 9-28-2016
	 Changing strings to 1 and 0 depending on even or odd 
*/
function stringy(size) {
	// when even 0, odd 1
	var string = ""
	for (i=1; i <= size; i ++) {
		var string = string + i%2
	}
	return string
}
console.log(stringy(4))
console.log(stringy(10))


/* 
	 Thursday. 9-29-2016
	 Reversing Integers and putting them in an array 
*/
//Using Reverse method to solve it
function reverse2(numbers) {
	arry = numbers.toString().split("").map(Number).reverse()
	console.log(arry)
}
console.log(reverse2(11314145243))
console.log(reverse2(15243))

// Without using reverse() method.
function reverse(numbers) {
	arry = numbers.toString().split("")
	new_arry = []
	for (i = arry.length-1; i > -1; i--) {
			new_arry.push(arry[i])
	}
	return new_arry.map(Number)
}
console.log(reverse(1234))
console.log(reverse(15243))

/* 
	 Friday. 9-30-2016
	 Fibonacci Challenge
*/
function fibonacci( x ) {
  // [0,1,2,3,4th,5th,6th,...]
  // [0,1,1,2,3,5,8,13,...]
  if (x == 0) { return 0 };
  if (x == 1 || x ==2) { return 1 };
  first = 1
  second = 1
  total = 0
  count = 2
  arry = []
  while (count < x)  {
    count += 1
    total = first + second
    first = second
    second = total
    arry.push(total) 
  }
  return arry
}
console.log(fibonacci(3))
console.log(fibonacci(4))
console.log(fibonacci(5))
console.log(fibonacci(6))
console.log(fibonacci(7))


/* 
	 Saturday. 10-01-2016
	 Email Validation 
*/
function validEmail( email ) {
	regex = /\w*@[a-zA-Z]+\./  
	if (email.match(regex)) {
	  return true
	} else {
		return false
	}
}
console.log(validEmail("asdf3_33@asfa.com"))


/* 
	Monday. 10-3-2016
	write a function which takes in numbers num1 and num2 and returns 1 if there is a straight triple of a number at any place in num1 and also a straight double of the same number in num2. 
*/
function tripledouble(num1, num2) {

	var num_s = num1.toFixed().toString().split("")
	var num2_s = num2.toFixed().toString().split("")
	holder = []
	console.log(num_s.length, num_s)
	for (i=0; i < num_s.length; i++) {
		if (num_s[i] == num_s[i+1] && num_s[i+2] == num_s[i]) {
			for (x=0; x < num2_s.length; x++) {
				if (num2_s[x] == num2_s[x+1]) {
					return 1
				}
			}
		} else {
			holder.push(0)
		}
	}
	return holder.reduce(x => x, 0)
}
console.log(tripledouble(234,100))

/* 
	Tuesday. 10-4-2016
	Given an array (x) calculate the Paul Misery Score. The values are worth the following points:
	kata = 5 Petes kata = 10 life = 0 eating = 1
	The Misery Score is the total points gained from the array. Once you have the total, return as follows:
	<40 = 'Super happy!'
	<70 >=40 = 'Happy!'
	<100 >=70 = 'Sad!'
	>=100 = 'Miserable!'
*/
function paul(x) {
	var int_points = []
	for (point = 0; point < x.length; point++) {
		if (x[point] == "kata") {
			int_points.push(5)
		} else if( x[point] == "Petes kata") {
			int_points.push(10)
		} else if( x[point] == "life") {
			int_points.push(0)
		} else if( x[point] == "eating") {
			int_points.push(1)
		}
	}
	var sum = int_points.reduce((prev,current) => prev+current, 0)
	if (sum < 40) {
		return "Super happy!"
	} else if (sum >= 40 && sum < 70) {
		return "Happy!"
	} else if (sum >=70 && sum < 100) {
		return "Sad!"
	} else if (sum >= 100) {
		return "Miserable!"
	}
}
/* 
	Wednesday. 10-5-2016
	ATM machines allow 4 or 6 digit PIN codes and PIN codes cannot contain anything but exactly 4 digits or exactly 6 digits.
	If the function is passed a valid PIN string, return true, else return false.
	eg:
	validatePIN("1234") === true
	validatePIN("12345") === false
	validatePIN("a234") === false
*/
function validatePIN (pin) {
	arry_pin = pin.split("")
	int_pin = arry_pin.map(Number)
	// checking for characters other than digits
	for (i=0; i< arry_pin.length; i++) {
		if (isNaN(int_pin[i])) {
			return false
		}
	}
	// checking for pin lengths
	if (pin.length == 4 || pin.length == 6) {
		return true
	} else {
		return false
	}
}
// Better solution 
function validatePIN(pin) {
  return /^(\d{4}|\d{6})$/.test(pin)
}
console.log(validatePIN("23k")) //false
console.log(validatePIN("3a2344")) //false
console.log(validatePIN("1234")) //true
console.log(validatePIN("a344")) //false

/*
	Thursday, 10-06-2016
	A friend of mine takes a sequence of numbers from 1 to n (where n > 0).
	Within that sequence, he chooses two numbers, a and b.
	
	He says that the product of a and b should be equal to the sum of all numbers in the sequence, excluding a and b.	Given a number n, could you tell me the numbers he excluded from the sequence?

	The function takes the parameter: n and returns an array of the form:
	[(a, b), ...] or [[a, b], ...] or {{a, b}, ...} or or [{a, b}, ...]
	with all (a, b) which are the possible removed numbers in the sequence 1 to n.

	[(a, b), ...] or [[a, b], ...] or {{a, b}, ...} or ...will be sorted in increasing order of the "a".

	It happens that there are several possible (a, b). The function returns an empty array if no possible numbers are found which will prove that my friend has not told the truth!
*/

// function removeNb (n) {
// 	let sequence = []
// 	let final = []
// 	let sum = 0
//   for (first = 1; first < n; first ++) {
//   	sequence.push(first)
//   	let sum = sequence.map( (prev, current) => prev + current)
//   }
//   for (number = 1; number < sequence.length; number++) {
//   	if (sum == number * ) {
//   		multiples.push( [ current, n[number] ] )
//   	} 
// 	}
// }

// console.log(removeNb(26))

/*
Friday, 10-07-2016, Consecutive Strings
	You are given an array strarr of strings and an integer k. Your task is to return the longest string consisting of k consecutive strings taken in the array without duplicates.
	longest_consec(["zone", "abigail", "theta", "form", "libe", "zas", "theta", "abigail"], 2) --> "abigailtheta"
	n being the length of the string array, if n = 0 or k > n or k <= 0 return "".
*/
function longestConsec(strarr, k) {
	var sorted = strarr.sort((a,b)=> b.length - a.length)
	var longest = Array.from(new Set(sorted)).slice(0,k).join("")
	for (i=0; i < strarr.length; i++) {
		if (strarr[i].length == 0) {
 			return ""
		} else if ( k > strarr[i].length) {
	 		return ""
	 	} else if (k <= 0) {
			return ""
		}
	}
	return longest
}
console.log(longestConsec(["zone", "abigail", "theta", "form", "libe", "zas", "theta", "abigail"], 2))

/*
Monday, 10-10-2016, Scramblies
	Write function scramble(str1,str2) that returns true if a portion of str1 characters can be rearranged to match str2, otherwise returns false.
	For example:
	str1 is 'rkqodlw' and str2 is 'world' the output should return true.
	str1 is 'cedewaraaossoqqyt' and str2 is 'codewars' should return true.
	str1 is 'katas' and str2 is 'steak' should return false.
	Only lower case letters will be used (a-z). No punctuation or digits will be included.
	Performance needs to be considered
*/

// function scramble(str1, str2) {
// 	var str1 = str1.split("")
// 	var str2 = str2.split("")
// 	for (i=0; i < str1.length; i++) {
// 		if (str1[i])
// 	}
// }
console.log(scramble("rkqodlw", 'world'))



