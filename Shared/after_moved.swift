import SwiftUI
func after_moved(x:Int,y:Int, game:inout game_varable){
    game.board[y][x].offset=CGSize.zero
    game.board[y][x].img_id=0
}
