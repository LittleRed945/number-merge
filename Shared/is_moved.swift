import SwiftUI
func  is_moved(x:Int,y:Int,game:game_varable) -> Bool{
    if game.board[y][x].offset != CGSize.zero {
        return true
    }else{
        return false
    }

}
