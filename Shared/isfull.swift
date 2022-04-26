func isfull(game:game_varable)->Bool{
    var c=0
    for arr in game.board {
        for i in arr{
            if( i.img_id > 0 ){
                c+=1
            }
        }
    }
    if c==25{
        return true
    }else{
        return false
    }
}
