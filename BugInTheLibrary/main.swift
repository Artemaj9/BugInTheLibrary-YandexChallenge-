//
//  main.swift
//  BugInTheLibrary
//
//  Created by Artem on 04.06.2023.
//

/*import Foundation

var a = readLine()
var b = readLine()
var c = readLine()

for c in a! {
    print(c)
}
print("First line is \(a!)")
print("Second line is \(b!)")
print("Third line is \(c!)")
*/

import Foundation

extension String {

    private func filterCharacters(unicodeScalarsFilter closure: (UnicodeScalar) -> Bool) -> String {
        return String(String.UnicodeScalarView(unicodeScalars.filter { closure($0) }))
    }

    private func filterCharacters(definedIn charSets: [CharacterSet], unicodeScalarsFilter: (CharacterSet, UnicodeScalar) -> Bool) -> String {
        if charSets.isEmpty { return self }
        let charSet = charSets.reduce(CharacterSet()) { return $0.union($1) }
        return filterCharacters { unicodeScalarsFilter(charSet, $0) }
    }

    func removeCharacters(charSets: [CharacterSet]) -> String { return filterCharacters(definedIn: charSets) { !$0.contains($1) } }
    func removeCharacters(charSet: CharacterSet) -> String { return removeCharacters(charSets: [charSet]) }

    func onlyCharacters(charSets: [CharacterSet]) -> String { return filterCharacters(definedIn: charSets) { $0.contains($1) } }
    func onlyCharacters(charSet: CharacterSet) -> String { return onlyCharacters(charSets: [charSet]) }
}

let string = "23f45gdor#@%#i425v wer 24 1+DWEJwi 3u09ru49w*()9uE2R_)$I#Q)_ U383q04+RFJO{dgnkvlj b`kefl;nwdl qsa`WKFSA,.E"
print("original string: \(string)")
print("only .decimalDigits: \(string.onlyCharacters(charSet: .decimalDigits))")
print("only [.lowercaseLetters, .symbols]:\(string.onlyCharacters(charSets: [.lowercaseLetters,.symbols]))")
print("remove .letters: \(string.removeCharacters(charSet: .letters))")
print("remove [.decimalDigits, .lowercaseLetters]: \(string.removeCharacters(charSets: [.decimalDigits, .lowercaseLetters]))")

var a : [String] = []
var d : [Int] = []
for _ in 0...2 {
    a.append(readLine()!)
}

for i in 0...2 {
    d.append(Int((a[i].onlyCharacters(charSet: .decimalDigits)))!)
    print(d[i])
}
