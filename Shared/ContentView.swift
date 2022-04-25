//
//  ContentView.swift
//  Shared
//
//  Created by  Erwin on 2022/4/18.
//

import SwiftUI

struct ContentView: View {
    @State private var game=game_varable()
    var body: some View {
        //playing view
        ZStack{
        if(game.isplaying){
            VStack{
                Text("Number Merge")
                //home,score and volume
                HStack{
                    //home
                    Button(action: {game.isplaying.toggle()}, label:{
                        Image(systemName:"house.circle.fill")
                    })
                    //
                    //score
                    Text("Score:\(game.score)")
                    //
                    //volume
                    Button(action: {game.isplaymusic.toggle()}, label:{
                        if(game.isplaymusic){
                            Image(systemName:"speaker.wave.2.circle.fill")
                        }else{
                            Image(systemName:"speaker.slash.circle.fill")
                        }
                        
                    })
                    //
                }
                //borad 5x5
                VStack(spacing: 4.0){
                    ForEach(Range(0...4)){y in
                        HStack(spacing:4.0){
                            ForEach(Range(0...4)){x in
                                ZStack{
                                    Rectangle()
                                        .stroke(Color.black)
                                        .frame(width: 50, height: 50)
                                        .onTapGesture {
                                            if(game.board[y][x].img_id == 0){
                                                game.board[y][x].img_id=game.next
                                                game.next_random()
                                            }
                                            if(merge_check(x: x, y: y, game: game)){
                                                number_merge(x: x, y: y, game: &game)
                                                number_merge(x:x,y:y,game:&game)
                                                score+=1
                                            }
                                        }
                                    
                                    if(game.board[y][x].img_id != 0){
                                        ZStack(alignment: .bottomTrailing){
                                            Image("\(game.board[y][x])")
                                                
                                            Text("\(game.board[y][x].img_id)").offset(x:10,y:10)
                                        }.offset(game.board[y][x].offset)
                                            .animation(.default,value:game_varable[y][x].offset)
                                        if(game.board[y][x].offset != CGSize.zero){
                                            game.board[y][x].offset=CGSize.zero
                                        }
                                        if(merge_check(x: x, y: y, game: game)){
                                            game.board[y][x].img_id += 1
                                        }
                                    }
                                    
                                    
                                }
                                
                                
                            }
                        }
                    }
                }
                //
                //animation
                
                //
                Text("Next:\(game.next)")
                
            }
        }
        //playing view end
        //home view
        else{
            VStack{
                Text("Number Merge")
                //play button
                Button(action: {
                    game.reset()
                    game.isplaying.toggle()
                }, label:{
                    Image(systemName:"play.fill")
                })
                //
            }
        }
        //home view end
        }
        Image("Wordle_background").scaledToFill()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
