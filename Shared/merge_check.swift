func merge_check(x:Int,y:Int,game:game_varable) -> Bool{
    if( game.board[y][x].img_id != 0){
        if(x<4&&game.board[y][x].img_id==game.board[y][x+1].img_id){
            return true
        }else if(x>0&&game.board[y][x].img_id==game.board[y][x-1].img_id){
            return true
        }else if(y<4&&game.board[y][x].img_id==game.board[y+1][x].img_id){
            return true
        }else if(y>0&&game.board[y][x].img_id==game.board[y-1][x].img_id){
            return true
        }else{
            return false
        }
            
    }
    else{
        return false
    }
}
