import SwiftUI
func number_merge(x:Int,y:Int, game:inout game_varable){
    if(x<4&&game.board[y][x].img_id==game.board[y][x+1].img_id){
        game.board[y][x+1].img_id=0
        withAnimation{
            game.board[y][x+1].offset.width = -50
            game.board[y][x+1].offset.height = 0
            game.board[y][x+1].opacity=0
        }
        
    }
    if(x>0&&game.board[y][x].img_id==game.board[y][x-1].img_id){
        game.board[y][x-1].img_id=0
        withAnimation{
            game.board[y][x-1].offset.width = 50
            game.board[y][x-1].offset.height = 0
            game.board[y][x-1].opacity=0
        }
    }
    if(y<4&&game.board[y][x].img_id==game.board[y+1][x].img_id){
        game.board[y+1][x].img_id=0
        withAnimation{
            game.board[y+1][x].offset.width = 0
            game.board[y+1][x].offset.height = -50
            game.board[y+1][x].opacity=0
        }
    }
    if(y>0&&game.board[y][x].img_id==game.board[y-1][x].img_id){
        game.board[y-1][x].img_id=0
        withAnimation{
            game.board[y-1][x].offset.width = 0
            game.board[y-1][x].offset.height = 50
            game.board[y-1][x].opacity=0
        }
    }
}

