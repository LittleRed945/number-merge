import SwiftUI
import AVFoundation
struct tile{
    var img_id=0
    var offset = CGSize.zero
    var opacity:Double=1
}
struct game_varable{
    var isplaying=false
    var isover=false
    var isplaymusic=true
    var score=0
    var next=1
    var board=Array(repeating:Array(repeating: tile(), count: 5),count:5)
    mutating func play_again(){
        isover=false
        isplaymusic=true
        score=0
        next=1
        board=Array(repeating:Array(repeating: tile(), count: 5),count:5)
    }
    mutating func reset(){
        isplaying=false
        isover=false
        isplaymusic=true
        score=0
        next=1
        board=Array(repeating:Array(repeating: tile(), count: 5),count:5)
    }
    mutating func next_random(){
        next=Int.random(in: Range(1...3))
    }
    
}
