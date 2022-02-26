var englishText = "This is a secret message!"

var secretMessage = ".... --- .-- -.. -.--   .--. .- .-. - -. . .-."

// Add your code below 🤫
var lettersToMorse: [String: String] = ["a":".-",
"b":"-...",
"c":"-.-.",
"d":"-..",
"e":".",
"f":"..-.",
"g":"--.",
"h":"....",
"i":"..",
"j":".---",
"k":"-.-",
"l":".-..",
"m":"--",
"n":"-.",
"o":"---",
"p":".--.",
"q":"--.-",
"r":".-.",
"s":"...",
"t":"-",
"u":"..-",
"v":"...-",
"w":".--",
"x":"-..-",
"y":"-.--",
"z":"--..",
"1":".----",
"2":"..---",
"3":"...--",
"4":"....-",
"5":".....",
"6":"-....",
"7":"--...",
"8":"---..",
"9":"----.",
"0":"-----",
".":".-.-.-",
"!":"-.-.--",
"?":"..--..",
",":"--..--"]

//To encode a message to Morse Code
//Convert message to lowercase
englishText = englishText.lowercased()
//Empty string to store the Morse-encoded message
var morseText = ""
//Loop through each character of englishText
for element in englishText {
//Check to see if the value is in the dictionary
  if let morseChar = lettersToMorse["\(element)"] {
/*Append the letter to morseText, then add a space because each character is separated by a space in Morse Code */  
    morseText += morseChar + " "
  } else {
/*Append three spaces to morseText because each word in Morse Code is separated by three spaces*/    
    morseText += "   "
  }
}

print(morseText)

//To decode a Morse-encoded message
//String to hold the decoded message
var decodedMessage = ""
//Array to store individual Morse Code letters
var morseCodeArray = [String]()
//Current Morse Code letter
var currMorse = ""
//Iterate through each character of secretMessage
for char in secretMessage {
//If current character is not a space
  if char != " " {
//Append the current character to currMorse  
    currMorse.append(char)
  } else {
//If the current character is a space  
    switch currMorse {
/*If the current character is an empty string value, add a single space to currMorse */      
      case "": 
        currMorse += " "
/*If the current character is a single space, append a single space to morseCodeArray and reset currMorse to be an empty string*/        
      case " ":
        morseCodeArray.append(" ")
        currMorse = ""
/*When we reach the end of a Morse Code letter, append currMorse to morseCodeArray and reset currMorse to be an empty string.*/        
      default:
        morseCodeArray.append(currMorse)
        currMorse = ""
    } 
  }
}
//Append the final value of currMorse to morseCodeArray
morseCodeArray.append(currMorse)
print(morseCodeArray)

/*Create an empty dictionary to hold Morse keys and letter values*/
var morseToLetter: [String: String] = [:]

//Iterate through the keys and values of letterToMorse
for (letter, morseChar) in lettersToMorse {
//Make the original key the new value and vice versa
  morseToLetter[morseChar] = letter
}

//Iterate through morseCodeArray
for morseValue in morseCodeArray {
//If morseValue is in morseCodeArray, let it equal letterChar  
  if let letterChar = morseToLetter[morseValue] {
//Append letterChar to decodedMessage
    decodedMessage += letterChar    
/*If the character isn't in the dictionary, assume it's a space*/
  } else {
    decodedMessage += " "
  }
}
print(decodedMessage)