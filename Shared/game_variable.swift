import SwiftUI
struct tile{
    var img_id=0
    var offset = CGSize.zero
}
struct game_varable{
    var isplaying=false
    var isplaymusic=true
    var score=0
    var next=1
    var board=Array(repeating:Array(repeating: tile(), count: 5),count:5)
    mutating func reset(){
        isplaying=false
        isplaymusic=true
        score=0
        next=1
        board=Array(repeating:Array(repeating: tile(), count: 5),count:5)
    }
    mutating func next_random(){
        next=Int.random(in: Range(1...3))
    }
}
