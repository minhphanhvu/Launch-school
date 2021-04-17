function letterCaseCount(str) {
  const result = {
    lowercase: 0,
    uppercase: 0,
    neither: 0
  }

  str.split('').forEach(char => {
    if (/[A-Za-z]/.test(char)) {
      char.toUpperCase() === char ? result.uppercase += 1 : result.lowercase += 1
    } else {
      result.neither += 1
    }
  })

  return result
}

function letterPercentages(str) {
  const total = str.length
  const counts = letterCaseCount(str)
  
  Object.keys(counts).forEach(keyCase => counts[keyCase] = (counts[keyCase]/total * 100).toFixed(2))

  return counts
}

console.log(letterPercentages('abCdef 123'));
// { lowercase: "50.00", uppercase: "10.00", neither: "40.00" }

console.log(letterPercentages('AbCd +Ef'));
// { lowercase: "37.50", uppercase: "37.50", neither: "25.00" }

console.log(letterPercentages('123'));
// { lowercase: "0.00", uppercase: "0.00", neither: "100.00" }