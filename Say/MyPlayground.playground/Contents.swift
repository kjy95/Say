//: Playground - noun: a place where people can play

import Cocoa

let webURL = URL(string: "https://www.instapaper.com/text?u=http://stackoverflow.com/questions/34940044/how-to-remove-all-the-spaces-and-n-r-in-a-string-in-swift/34940183")!

let data = NSData(contentsOf: webURL)!
let dataString = String(data:data as Data, encoding:String.Encoding.utf8)!

let unlinedString = dataString.replacingOccurrences(of: "\n", with: " ").replacingOccurrences(of: "\r", with: "")
//print(unlinedString)

let regex = try! NSRegularExpression(pattern: "<main.*</main>", options: NSRegularExpression.Options())
let result = regex.matches(in: unlinedString as String, options: NSRegularExpression.MatchingOptions(), range: NSRange(location: 0, length: unlinedString.characters.count))

assert(result.count > 0)
let range = result[0].rangeAt(0)
let text = (unlinedString as NSString).substring(with: range)
//print(text)

let regexTag = try! NSRegularExpression(pattern: "<[^>]*>", options: NSRegularExpression.Options())
var realResult = regexTag.stringByReplacingMatches(in: text, options: NSRegularExpression.MatchingOptions(), range: NSRange(location: 0, length: text.characters.count), withTemplate: "")
print(realResult)